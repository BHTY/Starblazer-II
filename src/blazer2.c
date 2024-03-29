/*
	Filename: blazer2.c
	Description: Starblazer II Core Game Engine
*/

#include "../headers/int.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/slipstr.h"
#include "../headers/stats.h"
#include "../headers/hyptest.h"
#include "../headers/net.h"
#include "../headers/sndmixer.h"
#include "../headers/font.h"
#include "../headers/graphics.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define NUM_SHARDS 64

uint32 SND_EXPLODE, SND_HIT, SND_LASER, SND_LASER_ENEMY;
bool_t laser_type;

LASER ENEMY_LASER_SHREDDER, ENEMY_LASER_DRAGONBREATH;
TEMPLATE *AX5, *LASER_PLAYER, *LASER_ENEMY, *EXPLOSION_SHARD, *ASTEROID, *TURRET_PLATFORM, *TURRET;
//char barcolors[22] = "\xe0\xe0\xc0\xc4\xc4\xa0\xa8\xa8\xac\x8c\x8c\x90\x74\x75\x55\x59\x5a\x3a\x3e\x1f\x1f\x1f";
  char barcolors[22] = "\xe8\xe8\xc8\xcc\xcc\xca\xe8\xe8\xe8\xe8\xe8\xe8\xe8\xe8\xf8\xf8\xb8\xb8\xbc\xbf\xbf\xbf";
	                                //                                                                |

VEC3 title_stars[500];

uint32 frames_respawning = 0;
bool_t dying;

uint32 impact_id;
int frames;
bool_t multiplayer = 0;
bool_t boost_overheating = 0;
bool_t firing = 0;
VEC3 velocity;
int barcycle = 0;

TEMPLATE cam_template;
ENTITY* camera;

FIGHTER player_fighter;
LASER player_weapon; //bolt player

uint32 player_boost;
uint32 player_battery;

uint32 shake_frames = 0;
uint32 firing_cooldown = 0;

MAT3 rot_mat;
VEC3 pos_delta;

VEC3 laser_velocity;

void explode_at(VEC3* pos){
	int i;
	uint32 id;

	for (i = 0; i < NUM_SHARDS; i++){
		id = spawn_entity(EXPLOSION_SHARD, pos->x + (rand() % 256 - 128), pos->y + (rand() % 256 - 128), pos->z + (rand() % 256 - 128), rand() % 256, rand() % 256, rand() % 256);
		StarblazerEntities[id]->state[1] = 3 * (rand() % 256 - 128);
		StarblazerEntities[id]->state[2] = 3 * (rand() % 256 - 128);
		StarblazerEntities[id]->state[3] = 3 * (rand() % 256 - 128);
	}

	play_soundfx(SND_EXPLODE);
}

void explode_entity(ENTITY** ptr){
	VEC3 pos = (*ptr)->pos;
	free(*ptr);
	*ptr = 0;
	explode_at(&pos);
}

void print_vec(VEC3* vec){
	printf("(%d, %d, %d)\n", vec->x, vec->y, vec->z);
}

void step_entity(ENTITY* ent, VEC3* vel){
	quat_tomat(&(ent->orientation), &rot_mat); //generate rotation matrix
	mat3_mul(&rot_mat, vel, &pos_delta);
	vec3_add(&pos_delta, &(ent->pos));
}

void draw_stars(){
	int i;
	for (i = 0; i < 500; i++){
		plotpoint_3d(title_stars[i], 255);
	}
}

void fire_laser(){
	uint32 id = spawn_entity(player_weapon.model, StarblazerEntities[0]->pos.x, StarblazerEntities[0]->pos.y, StarblazerEntities[0]->pos.z, 0, 0, 0);
	StarblazerEntities[id]->state[0] = 280; //lifetime in ticks
	StarblazerEntities[id]->state[15] = player_weapon.damage; //damage
	StarblazerEntities[id]->orientation = StarblazerEntities[0]->orientation;
	rotate_object(StarblazerEntities[id]);
	firing = 1;
	play_soundfx(SND_LASER);
}

void cam_script(ENTITY** ptr){
	step_entity(*ptr, &velocity);
}

void init_star(VEC3* star){
	star->x = ((rand() % 2000) - 1000) * 65536;
	star->y = ((rand() % 2000) - 1000) * 65536;
	star->z = ((rand() % 2000) - 1000) * 65536;
}

void spawn_asteroid(){
	VEC3 pos;
	uint32 id;
	pos.x = int_fixed(rand() % 500 - 250);
	pos.y = int_fixed(rand() % 500 - 250);
	pos.z = int_fixed(rand() % 500 - 250);

	id = spawn_entity(ASTEROID, pos.x, pos.y, pos.z, rand() % 256, rand() % 256, rand() % 256);
	//printf("Spawned asteroid %d\n", id);
}

void ax5_script(ENTITY** ptr){
	/*if (test_collisions(*ptr, StarblazerEntities[0])){
		StarblazerEntities[0]->health -= 5;
		shake_frames = 7;
		return;
	}*/
}

void enemy_laser_script(ENTITY** ptr){
	int i;
	step_entity(*ptr, &laser_velocity);
	(*ptr)->state[0]--;

	//test collision with camera
	if (test_collisions(*ptr, StarblazerEntities[0])){
		StarblazerEntities[0]->health -= (*ptr)->state[15];//5;
		shake_frames = 7;
		impact_id = (*ptr)->state[13];
		play_soundfx(SND_HIT);
		free(*ptr);
		*ptr = 0;
		return;
	}

	if (!(*ptr)->state[0]){
		free(*ptr);
		*ptr = 0;
	}
}

void laser_script(ENTITY** ptr){
	int i;

	step_entity(*ptr, &laser_velocity);
	(*ptr)->state[0]--;

	for (i = 0; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i] && StarblazerEntities[i] != *ptr){
			if (StarblazerEntities[i]->type->flags & 1){ //hittable
				if (test_collisions(*ptr, StarblazerEntities[i])){
					//printf("That's a confirmed hit!\n");
					StarblazerEntities[i]->color_override = 192;
					StarblazerEntities[i]->override_frames = 7;
					StarblazerEntities[i]->health -= (*ptr)->state[15];

					//despawn
					play_soundfx(SND_HIT);
					free(*ptr);
					*ptr = 0;
					return;
				}
			}
		}
	}

	if (!(*ptr)->state[0]){
		free(*ptr);
		*ptr = 0;
	}
}

void asteroid_script(ENTITY** ptr){
	if (test_collisions(*ptr, StarblazerEntities[0])){
		StarblazerEntities[0]->health -= 5;
		shake_frames = 7;
		explode_entity(ptr);
		play_soundfx(SND_HIT);
		return;
	}

	if ((*ptr)->health <= 0){
		explode_entity(ptr);
	}
}

void debris_script(ENTITY** ptr){
	(*ptr)->pos.x += (int32)(*ptr)->state[1] * 64;
	(*ptr)->pos.y += (int32)(*ptr)->state[2] * 64;
	(*ptr)->pos.z += (int32)(*ptr)->state[3] * 64;
	quat_pitch(32, &((*ptr)->orientation));
	quat_yaw(32, &((*ptr)->orientation));
	quat_roll(32, &((*ptr)->orientation));
	rotate_object(*ptr);

	if (!(rand() % 45))
	{
		free(*ptr);
		*ptr = 0;
	}
}

void set_attributes(){
	ENEMY_LASER_SHREDDER.model = load_model("assets/shreder2.obj");
	ENEMY_LASER_SHREDDER.model->script = enemy_laser_script;
	ENEMY_LASER_SHREDDER.model->radar_color = 239;
	ENEMY_LASER_SHREDDER.model->radar_type = 0;
	ENEMY_LASER_SHREDDER.model->flags = 2;
	create_hitbox(ENEMY_LASER_SHREDDER.model, int_fixed(3), int_fixed(3), int_fixed(3));
	ENEMY_LASER_SHREDDER.damage = 8;

	ENEMY_LASER_DRAGONBREATH.model = load_model("assets/dragon2.obj");
	ENEMY_LASER_DRAGONBREATH.model->script = enemy_laser_script;
	ENEMY_LASER_DRAGONBREATH.model->radar_color = 207;
	ENEMY_LASER_DRAGONBREATH.model->radar_type = 0;
	ENEMY_LASER_DRAGONBREATH.model->flags = 2;
	create_hitbox(ENEMY_LASER_DRAGONBREATH.model, int_fixed(3), int_fixed(3), int_fixed(3));
	ENEMY_LASER_DRAGONBREATH.damage = 2;

	if (laser_type == 0) {
		LASER_PLAYER = load_model("assets/shreder1.obj");
		LASER_PLAYER->radar_color = 191;
		player_weapon.cooldown_ticks = 10;
		player_weapon.energy_draw = 7;
		player_weapon.damage = 8;
	}
	else {
		LASER_PLAYER = load_model("assets/dragon1.obj");
		LASER_PLAYER->radar_color = 175;
		player_weapon.cooldown_ticks = 3;
		player_weapon.energy_draw = 2;
		player_weapon.damage = 2;
	}

	LASER_PLAYER->flags = 2;
	LASER_PLAYER->script = laser_script;
	LASER_PLAYER->radar_type = 0;
	create_hitbox(LASER_PLAYER, int_fixed(3), int_fixed(3), int_fixed(3));

	player_fighter.health = 64;
	player_fighter.turn_rate = 25;
	player_fighter.speed = 0x3000;
	player_fighter.boost_speed = 0xf000;
	player_fighter.boost_size = 40;
	player_fighter.energy_tank = 40;

	//              Cooldown/Energy/Damage
	//Shredder:     10/7/8
	//Dragonbreath: 3/2/2
	//Shredder DPS: 70 / 70 / 10 * 8 = 56
	//Dragonbreath DPS: 70 / 3 * 2 = 46.67
	//Shredder DPB: 40 / 7 * 8 = 45.71
	//Dragonbreath DPB: 40/2 * 2 = 40

	/*player_weapon.cooldown_ticks = 3;// 10;
	player_weapon.energy_draw = 2;// 7;
	player_weapon.damage = 2;*/
	player_weapon.model = LASER_PLAYER;

	laser_velocity.x = 0;
	laser_velocity.y = 0;
	laser_velocity.z = 0x10000;

	EXPLOSION_SHARD = load_model("assets/shard.obj");
	EXPLOSION_SHARD->script = debris_script;
	EXPLOSION_SHARD->flags = 2;
	EXPLOSION_SHARD->radar_color = 127;
	EXPLOSION_SHARD->radar_type = 0;
	create_hitbox(EXPLOSION_SHARD, 0, 0, 0);

	ASTEROID = load_model("assets/asterold.obj");
	ASTEROID->script = asteroid_script;
	ASTEROID->flags = 3;
	ASTEROID->maxhp = 10;
	ASTEROID->radar_color = 250;// 207;
	ASTEROID->radar_type = 0;
	create_hitbox(ASTEROID, int_fixed(5), int_fixed(5), int_fixed(5));

	AX5 = load_model("assets/hyper.obj");
	AX5->script = ax5_script;
	AX5->flags = 3;
	AX5->maxhp = 0;
	AX5->radar_type = 1;
	create_hitbox(AX5, int_fixed(5), int_fixed(5), int_fixed(7)); //3x2x7
}

//when you're dead, it'll forcibly zero out your velocity and your joystick inputs

/*
This function is called either from the title module (singleplayer) or mpsetup module (multiplayer).
The multiplayer flag is set by the calling function. If we're in multiplayer mode, the connection has already been opened.
*/

unsigned char accumPitch, accumYaw, accumRoll;

void blazer2_init(){
	uint32 i;

	frames = 0;
	shading = 1;

	// sfx/music
	stop_music();
	play_music("sfx/net.wav");
	sfx_enable = 1;
	SND_EXPLODE = load_soundfx("sfx/explode.wav", 1, 0);
	SND_LASER = load_soundfx("sfx/laser.wav", 2, 0);
	SND_LASER_ENEMY = load_soundfx("sfx/laser.wav", 3, 0);
	SND_HIT = load_soundfx("sfx/hit.wav", 1, 0);

	//load models
	SL_CENTER_X = 160;
	SL_CENTER_Y = 100;

	set_attributes();

	cam_template.mesh = 0;
	cam_template.verts = 0;
	cam_template.num_verts = 0;
	cam_template.num_tris = 0;
	cam_template.script = cam_script;
	cam_template.maxhp = player_fighter.health;
	cam_template.flags = 2;
	
	create_hitbox(&cam_template, int_fixed(3), int_fixed(2), int_fixed(7)); //2x2x2

	//spawn stars
	for (i = 0; i < 500; i++){
		init_star(&(title_stars[i]));
	}

	//clear out entity list
	for (i = 0; i < MAX_ENTITIES; i++){
		free(StarblazerEntities[i]);
		StarblazerEntities[i] = 0;
	}

	//spawn the camera entity & certain pos and angle
	i = spawn_entity(&cam_template, int_fixed(rand() % 100 - 50), int_fixed(rand() % 100 - 50), int_fixed(rand() % 100 - 50), 0, 0, 0);

	accumPitch = 0;
	accumYaw = 0;
	accumRoll = 0;

	//setup core state variables (i.e. boost meter, laser bar, etc.)
	player_boost = player_fighter.boost_size;
	player_battery = player_fighter.energy_tank;

	//pull in all of the templates-models & AIs - that we need

	//if this is singleplayer, spawn in asteroids & turret
	if (!multiplayer){
		for (i = 0; i < 100; i++){
			spawn_asteroid();
		}
	}

#ifdef __DOS32A__
	if (multiplayer) setup_duel(); // moves each player to the appropriate starting pos & rot - serial play only
#endif

	//set the module fn pointers
	SG_Module = blazer2_module;
	SG_Draw = blazer2_draw;

	velocity.x = 0;
	velocity.y = 0;
	velocity.z = player_fighter.speed;

	init_hypercraft();
}

SANGLE angle_multiply(SANGLE angle, int8 joy_amount){
	return (angle * joy_amount) >> 8;
}

void vjoy_read(joystick_t* joy){
	SG_joystick_t stick;

	//scan the and joystick
	SG_ReadStick(&stick);

	joy->fire = SG_KeyDown('J');
	joy->exit = 0;
	joy->brake = SG_KeyDown('K');
	joy->boost = SG_KeyDown('B');

	//read pitch
	if (SG_KeyDown('W')){
		joy->pitch = 127;
	}
	else if (SG_KeyDown('S')){
		joy->pitch = -127;
	}
	else{
		joy->pitch = 0;
	}

	//read yaw
	if (SG_KeyDown('A')){
		joy->yaw = 127;
	}
	else if (SG_KeyDown('D')){
		joy->yaw = -127;
	}
	else{
		joy->yaw = 0;
	}

	//read roll
	if (SG_KeyDown('Q')){
		joy->roll = -127;
	}
	else if (SG_KeyDown('E')){
		joy->roll = 127;
	}
	else{
		joy->roll = 0;
	}

	//read fire

	//read radar

	//read boost

	//read exit
}

/*
explode_at()
Parameters: VEC3* position, int num_shards

An explosion is spawned at the given position.
*/

/*
explode_entity()
Parameters: ENTITY** entity, int num_shards

The given entity is despawned and an explosion of the given shards number spawned from its position.
*/

VEC3 tst, tst2;

void respawn_player(){
	StarblazerEntities[0]->health = player_fighter.health;
	StarblazerEntities[0]->pos.x = int_fixed(rand() % 100 - 50);
	StarblazerEntities[0]->pos.y = int_fixed(rand() % 100 - 50);
	StarblazerEntities[0]->pos.z = int_fixed(rand() % 100 - 50);
}


void blazer2_module(){
	uint32 id;
	joystick_t joy;
	vjoy_read(&joy);

	if (frames_respawning == 0){
		BG_COLOR = 0;
	}

	if (StarblazerEntities[0]->health <= 0 && frames_respawning == 0){
		play_soundfx(SND_EXPLODE);
		dying = 1;
		frames_respawning = timeout;
		BG_COLOR = 127;

		if (timeout == 0){
			respawn_player();
		}
	}

	if (frames_respawning){ //disable controls if we're respawning
		memset(&joy, 0, sizeof(joystick_t));
		frames_respawning--;

		if (frames_respawning == 0){
			respawn_player();
		}
	}

	if (shake_frames){
		shake_frames--;
	}

	//process inputs
	quat_pitch(angle_multiply(player_fighter.turn_rate, joy.pitch), &(StarblazerEntities[0]->orientation));
	accumPitch += angle_multiply(player_fighter.turn_rate, joy.pitch);
	quat_yaw(angle_multiply(player_fighter.turn_rate, joy.yaw), &(StarblazerEntities[0]->orientation));
	accumYaw += angle_multiply(player_fighter.turn_rate, joy.yaw);
	quat_roll(angle_multiply(player_fighter.turn_rate, joy.roll), &(StarblazerEntities[0]->orientation));
	accumRoll += angle_multiply(player_fighter.turn_rate, joy.roll);

	if (SG_KeyDown('P')){
		shading = !shading;
		SG_WaitBlank();
	}

	//shoot
	if (joy.fire && (player_battery >= player_weapon.energy_draw) && firing_cooldown == 0){
		player_battery -= player_weapon.energy_draw;
		firing_cooldown = player_weapon.cooldown_ticks;
		fire_laser();
	}
	else{
		firing = 0;
		if (player_battery < player_fighter.energy_tank){
			if (frames % 15 == 0){ player_battery++; }
		}
		if (firing_cooldown > 0){
			firing_cooldown--;
		}
	}
	
	//boost & brake - make the curves smoother?
	if (joy.boost && !boost_overheating){
		velocity.z = player_fighter.boost_speed;
		if (frames % 5 == 0) { player_boost--; }
	}
	else if (joy.brake && !boost_overheating){
		velocity.z = 0;
		if (frames % 5 == 0) { player_boost--; }
	}
	else{
		if (!frames_respawning){
			velocity.z = player_fighter.speed;
		}
		else{
			velocity.z = 0;
		}
		if (player_boost < player_fighter.boost_size){
			if (frames % 15 == 0) { player_boost++; }
		}
	}
	//radar lock

	//sync state if this is multiplayer
	if (multiplayer){
		net_syncstate();
	}

	run_entity_scripts();

	//handle boost overheating
	if (player_boost == 0){
		boost_overheating = 1;
	}
	if (player_boost >= (player_fighter.boost_size >> 1)){
		boost_overheating = 0;
	}

	//exit back to title screen if the exit key is pressed
	frames++;

	//handle drawing stuff
	barcycle += 2;
	if (barcycle == 64) barcycle = 0;

	//account for screenshake
	if (shake_frames){
		SL_CENTER_X += (rand() % 20) - 10;
		SL_CENTER_Y += (rand() % 20) - 10;
	}
	else{
		SL_CENTER_X = 160;
		SL_CENTER_Y = 100;
	}
}

void blazer2_screencrack(){
	draw_line(30, 0, 40, 50, 255);
	draw_line(40, 50, 70, 80, 255);
	draw_line(70, 80, 120, 85, 255);
	draw_line(215, 140, 180, 155, 255);
	draw_line(180, 155, 220, 200, 255);
	draw_line(215, 85, 200, 70, 255);
	draw_line(200, 70, 215, 50, 255);
	draw_line(215, 50, 319, 40, 255);
	draw_line(160, 100, 100, 130, 255);
	draw_line(160, 100, 215, 140, 255);
	draw_line(160, 100, 215, 140, 255);
	draw_line(160, 100, 215, 85, 255);
	draw_line(120, 85, 160, 100, 255);
	draw_line(100, 130, 80, 160, 255);
	draw_line(80, 160, 20, 170, 255);
	draw_line(20, 170, 0, 192, 255);
}


uint32 count_entities(){
	int i;
	int c = 0;

	for (i = 0; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i]) c++;
	}

	return c;
}


void draw_debug(){
	char num[100];

	//draw # of onscreen entities
	vputs("ENT", 0, 0, 1, 1, 239, 1);
	sprintf(num, "%d / %d", count_entities(), MAX_ENTITIES);
	vputs(num, 15, 0, 1, 1, 239, 1);
	//draw # of onscreen polygons
	vputs("TRI", 0, 7, 1, 1, 239, 1);
	sprintf(num, "%d / %d", SL_TRIANGLE_INDEX, MAX_TRIS);
	vputs(num, 15, 7, 1, 1, 239, 1);
	//draw tickrate
	vputs("FPS", 0, 14, 1, 1, 239, 1);
	if (LAST_FRAME_TIME != 0){ sprintf(num, "%d", 1000 / LAST_FRAME_TIME); }else{
		sprintf(num, "INF");
	}
	vputs(num, 15, 14, 1, 1, 239, 1);

	//draw position
	sprintf(num, "%d %d %d", fixed_int(StarblazerEntities[0]->pos.x), fixed_int(StarblazerEntities[0]->pos.y), fixed_int(StarblazerEntities[0]->pos.z));
	vputs(num, 240, 0, 1, 1, 175, 1);

	sprintf(num, "VERT %d / %d", SL_VERTEX_INDEX, MAX_VERTS);
	vputs(num, 240, 7, 1, 1, 175, 1);
	
	/*sprintf(num, "%d %d %d %d", StarblazerEntities[0]->orientation.x, StarblazerEntities[0]->orientation.y, StarblazerEntities[0]->orientation.z, StarblazerEntities[0]->orientation.w);
	vputs(num, 100, 14, 1, 1, 175, 1);
	
	sprintf(num, "%d %d %d %d", StarblazerEntities[players[0].entity_id]->orientation.x, StarblazerEntities[players[0].entity_id]->orientation.y, StarblazerEntities[players[0].entity_id]->orientation.z, StarblazerEntities[players[0].entity_id]->orientation.w);
	vputs(num, 100, 21, 1, 1, 175, 1);*/
}

void draw_HPbar(){
	int k, j, i, pos1, pos2, pos3, pos4, c;

	// draw the health bar
	// coordinates of bar (16, 16) to (32, 184)
	//k = ((StarblazerEntities[0]->health*5/8) * 21) / 5 + 16;
	k = (StarblazerEntities[0]->health * 105) / 40 + 16;
	i = 8 + (barcycle >> 3);
	for (j = 0; j < 22; j++) {
		c = barcolors[j];
		if (i > k) break;
		pos1 = 24;
		pos2 = i;
		pos3 = 8;
		pos4 = i + 8;
		if (i + 8 > k) {
			//drawline(24, i, 8+(((i+8)-k)<<1), k, 0xe0);
			pos3 += (((i + 8) - k) << 1);
			pos4 = k;
		}
		if (i < 16) {
			pos1 -= (16 - i) << 1;
			pos2 = 16;
		}
		drawline(pos1, pos2, pos3, pos4, c);
		i += 8;
	}
	drawline(8, 16, 24, 16, 0xff);
	drawline(24, 16, 24, 184, 0xff);
	drawline(24, 184, 8, 184, 0xff);
	drawline(8, 184, 8, 16, 0xff);
	drawline(8, k, 24, k, 0xff);
}

void draw_crosshair(){
	int i;
	for (i = 0; i < 7; i++) {
		// operate on (140+i, 80)
		// (180-i, 80)
		bitset_pixel(150 + i, 90, 0xaf);
		bitset_pixel(170 - i, 90, 0xaf);
		bitset_pixel(150 + i, 110, 0xaf);
		bitset_pixel(170 - i, 110, 0xaf);
		bitset_pixel(150, 90 + i, 0xaf);
		bitset_pixel(150, 110 - i, 0xaf);
		bitset_pixel(170, 90 + i, 0xaf);
		bitset_pixel(170, 110 - i, 0xaf);
	}

	bitset_pixel(160, 100, 0xaf);
}


void draw_boost_bar(){
	int k, j, i, pos1, pos2, pos3, pos4, c;

	// draw the health bar
	// coordinates of bar (16, 16) to (32, 184)
	k = (player_boost * 21) / 5 + 16;
	i = 8 + (barcycle >> 3);
	for (j = 0; j < 22; j++) {
		c = boost_overheating ? 223 : 159;
		if (i > k) break;
		pos1 = 312;
		pos2 = i;
		pos3 = 296;
		pos4 = i + 8;
		if (i + 8 > k) {
			//drawline(24, i, 8+(((i+8)-k)<<1), k, 0xe0);
			pos3 += (((i + 8) - k) << 1);
			pos4 = k;
		}
		if (i < 16) {
			pos1 -= (16 - i) << 1;
			pos2 = 16;
		}
		drawline(pos1, pos2, pos3, pos4, c);
		i += 8;
	}
	drawline(296, 16, 312, 16, 0xff);
	drawline(312, 16, 312, 184, 0xff);
	drawline(312, 184, 296, 184, 0xff);
	drawline(296, 184, 296, 16, 0xff);
	drawline(296, k, 312, k, 0xff);
}

void draw_radar(){
	int i, j, c, k, pos1, pos2;
	VEC3 vector_pos, screen_coords;

	//draw radar box and half-transparent mesh bg
	for(i = 0; i < 60; i++){
		for(j = 0; j < 60; j++){
			c = 0;

			if(i == 0  || i == 59 || j == 0 || j == 59) c = 0xff;
			if(!c && (i+j) %2) continue;
			plot_pixel(130+i,10+j,c);
		}
	}
	
	//draw the "player" indictator
	for(j = -1; j < 2; j++){
		for (k = -1; k < 2; k++){
			plot_pixel(160 + j, 40 + k, 239);
		}
	}

	draw_line(160, 40, 160, 44, 239);

	//actually draw the radar blips
	for (i = 1; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i] && (StarblazerEntities[i]->type->flags & 2)){
			vector_pos = StarblazerEntities[i]->pos;
			vec3_subtract(&(StarblazerEntities[0]->pos), &vector_pos);
			mat3_mul(&SL_CAMERA_ORIENTATION, &vector_pos, &screen_coords);

			pos1 = screen_coords.x >> 17;
			pos2 = screen_coords.z >> 17;

			if (pos1 > 30) pos1 = 30;
			if (pos1 < -30) pos1 = -30;
			if (pos2 > 30) pos2 = 30;
			if (pos2 < -30) pos2 = -30;

			if (StarblazerEntities[i]->type->radar_type){
				if (screen_coords.y >= 0){
					c = 175;
				}
				else{
					c = 223;
				}

				for (j = -1; j < 2; j++) {
					for (k = -1; k < 2; k++) {
						if (40 + pos2 + k < 0) continue;
						plot_pixel(160 + pos1 + j, 40 + pos2 + k, c);
					}
				}
			}
			else{
				plot_pixel(160 + pos1, 40 + pos2, StarblazerEntities[i]->type->radar_color);
			}
		}
	}
}

void draw_battery(){
	int offset = 140;
	int i;
	int intensity = (player_battery * 6) >> 4;

	for (i = 0; i < 40; i++){
		if (player_battery >= i){
			drawline(offset + i, 160, offset + i, 170, 160 | (intensity));
		}
	}

	/*for (r = 7; r >= 0; r--){
		g = 7 - r;
		c = (r << 5) | (g >> 1); //<<2

		if (total_pixels >= 5){
			block_pixels = 5;
			total_pixels -= 5;
		}
		else{
			block_pixels = total_pixels;
			total_pixels = 0;
		}

		for (i = 0; i < block_pixels; i++){
			drawline(offset + i, 160, offset + i, 170, c);
		}

		offset += 5;
	}*/

	drawline(139, 160, 180, 160, 0xff);
	drawline(139, 170, 180, 170, 0xff);
	drawline(139, 160, 139, 170, 0xff);
	drawline(180, 160, 180, 170, 0xff);
}

/*
The way the nametag system works is that
1.) When a player starts their game, the default name of the null character is given to all players
2.) When a player connects to the server, they send their name to the server. The server sends the names of all connected players back.
3.) The server sends the new player's name to all other players. That way, all players know who everyone else is.
*/

void draw_nametags() {
	int i;
	VEC3 vector_pos, screen_coords;

	for (i = 0; i < 16; i++) {
		if (players[i].status == 1) { //they're connected normally
			vector_pos = StarblazerEntities[players[i].entity_id]->pos;
			vec3_subtract(&(StarblazerEntities[0]->pos), &vector_pos);
			mat3_mul(&SL_CAMERA_ORIENTATION, &vector_pos, &screen_coords);

			screen_coords.x = SL_CENTER_X - fixed_int(muldiv(screen_coords.x, SL_FOV_X, screen_coords.z));
			screen_coords.y = SL_CENTER_Y - fixed_int(muldiv(screen_coords.y, SL_FOV_Y, screen_coords.z));

			if (screen_coords.z > 65535 && screen_coords.z < 0x640000) { //determine center pos & scale size a bit better
				vputs("PLAYER", screen_coords.x, screen_coords.y, 1, 1, 255, 1); //fetch their actual player name and not "PLAYER"
			}
		}
	}
}


void blazer2_draw(){
	char text[80];

	//draw starfield bg
	camera_translate(&(StarblazerEntities[0]->pos));
	quat_tomat(&(StarblazerEntities[0]->orientation), &SL_CAMERA_ORIENTATION);

	//draw 3d scene geometry
	draw_scene(&(StarblazerEntities[0]->pos), StarblazerEntities[0]->orientation, shading, title_stars, 500);

	//draw targeting reticle
	if (frames_respawning == 0){ draw_crosshair(); }

	//draw boost bar
	draw_boost_bar();

	//draw health bar
	draw_HPbar();

    //draw radar
	draw_radar();
    
	//draw weapons energy tank
	draw_battery();

	//if (multiplayer) { draw_nametags(); }
    
	//draw targeting computer lead position
    //draw screen crack
	if (StarblazerEntities[0]->health < (player_fighter.health >> 1)){
		blazer2_screencrack();
	}
	//draw respawn message
	if (frames_respawning){
		vputs("RESPAWNING", 110, 90, 3, 2, 159, 1);
		sprintf(text, " IN %d SEC", frames_respawning / 70);
		vputs(text, 110, 100, 3, 2, 159, 1);
	}

	//draw debug display
	draw_debug();

	//draw hypercraft
	set_hypercraft_orientation(StarblazerEntities[0]->orientation);
	draw_hypercraft(265, 160);
}
