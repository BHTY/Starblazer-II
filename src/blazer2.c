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

TEMPLATE *AX5, *LASER_PLAYER, *LASER_ENEMY, *EXPLOSION_SHARD, *ASTEROID, *TURRET_PLATFORM, *TURRET;

VEC3 title_stars[500];

bool_t multiplayer = 0;
bool_t boost_overheating = 0;
bool_t firing = 0;
VEC3 velocity;

TEMPLATE cam_template;
ENTITY* camera;

FIGHTER player_fighter;
LASER player_weapon; //bolt player

uint32 player_boost;
uint32 player_battery;

uint32 shake_frames = 0;
uint32 firing_cooldown = 0;

void print_vec(VEC3* vec){
	printf("(%d, %d, %d)\n", vec->x, vec->y, vec->z);
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
	firing = 1;
}

void cam_script(ENTITY** ptr){

}

void init_star(VEC3* star){
	star->x = ((rand() % 1000) - 500) * 65536;
	star->y = ((rand() % 1000) - 500) * 65536;
	star->z = ((rand() % 1000) - 500) * 65536;
}

//when you're dead, it'll forcibly zero out your velocity and your joystick inputs

/*
This function is called either from the title module (singleplayer) or mpsetup module (multiplayer).
The multiplayer flag is set by the calling function. If we're in multiplayer mode, the connection has already been opened.
*/

void blazer2_init(){
	uint32 i;

	cam_template.mesh = 0;
	cam_template.verts = 0;
	cam_template.num_verts = 0;
	cam_template.num_tris = 0;
	cam_template.script = cam_script;
	cam_template.maxhp = 100;
	cam_template.flags = 2;
	
	create_hitbox(&cam_template, int_fixed(2), int_fixed(2), int_fixed(2));

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
	i = spawn_entity(&cam_template, 0, 0, 0, 0, 0, 0);

	//setup core state variables (i.e. boost meter, laser bar, etc.)
	player_boost = 100;
	player_battery = 100;

	//pull in all of the templates-models & AIs - that we need

	//set player fighter and laser
	player_fighter.health = cam_template.maxhp;
	player_fighter.turn_rate = 31;
	player_fighter.speed = 100000;
	player_fighter.boost_speed = 200000;

	//if this is singleplayer, spawn in asteroids & turret

	//set the module fn pointers
	SG_Module = blazer2_module;
	SG_Draw = blazer2_draw;

	velocity.x = 0;
	velocity.y = 0;
	velocity.z = 10000;
}

SANGLE angle_multiply(SANGLE angle, int8 joy_amount){
	return (angle * joy_amount) >> 8;
}

void vjoy_read(joystick_t* joy){
	//scan the mouse and joystick
	joy->fire = 0;
	joy->exit = 0;
	joy->brake = 0;
	joy->boost = 0;

	if (SG_KeyDown('K')){
		joy->boost = 1;
	}

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
		joy->roll = 127;
	}
	else if (SG_KeyDown('E')){
		joy->roll = -127;
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

void blazer2_module(){
	uint32 id;
	VEC3 pos_delta;
	MAT3 rot_mat;
	joystick_t joy;
	vjoy_read(&joy);

	if (shake_frames){
		shake_frames--;
	}

	//process inputs
	quat_pitch(angle_multiply(player_fighter.turn_rate, joy.pitch), &(StarblazerEntities[0]->orientation));
	quat_yaw(angle_multiply(player_fighter.turn_rate, joy.yaw), &(StarblazerEntities[0]->orientation));
	quat_roll(angle_multiply(player_fighter.turn_rate, joy.roll), &(StarblazerEntities[0]->orientation));

	//shoot
	if (joy.fire && (player_battery >= player_weapon.energy_draw) && firing_cooldown == 0){
		player_battery -= player_weapon.energy_draw;
		firing_cooldown = player_weapon.cooldown_ticks;
		fire_laser();
	}
	else{
		firing = 0;
		if (player_battery < player_fighter.energy_tank){
			player_battery++;
		}
		if (firing_cooldown > 0){
			firing_cooldown--;
		}
	}

	//boost & brake - make the curves smoother?
	if (joy.boost && !boost_overheating){
		velocity.z = player_fighter.boost_speed;
		player_boost--;
	}
	else if (joy.brake && !boost_overheating){
		velocity.z = 0;
		player_boost--;
	}
	else{
		velocity.z = player_fighter.speed;
		if (player_boost < player_fighter.boost_size){
			player_boost++;
		}
	}
	//radar lock
	
	//move me
	quat_tomat(&(StarblazerEntities[0]->orientation), &rot_mat); //generate rotation matrix
	mat3_mul(&rot_mat, &velocity, &pos_delta);
	vec3_add(&pos_delta, &(StarblazerEntities[0]->pos));
	print_vec(&pos_delta);

	//sync state if this is multiplayer
	if (multiplayer){
		//blazer_syncstate();
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
}

void blazer2_draw(){
	//account for screenshake

	//draw starfield bg
	camera_translate(&(StarblazerEntities[0]->pos));
	quat_tomat(&(StarblazerEntities[0]->orientation), &SL_CAMERA_ORIENTATION);

	draw_stars();

	//draw 3d scene geometry
	draw_scene(&(StarblazerEntities[0]->pos), &(StarblazerEntities[0]->orientation), 0);

	//draw targeting reticle

	//draw boost bar

	//draw health bar

    //draw radar
    //draw weapons energy tank
    //draw targeting computer lead position
    //draw screen crack
	/*if (player_health < (player_fighter.health >> 1)){
		blazer2_screencrack();
	}*/
	//draw respawn message
	//draw debug display
}