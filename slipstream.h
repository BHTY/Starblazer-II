typedef struct SL_VEC3{
	float vec[3];
} SL_VEC3;

typedef struct SL_POLY{ //triangle
	int vert1, vert2, vert3;
	uint8_t color;
} SL_POLY;


typedef struct SL_ENTITY{
	SL_POLY* mesh;
	SL_VEC3* verts;
	SL_VEC3 pos;
	uint8_t pitch, yaw, roll;
	int num_verts;
	int num_polys;
	//other state stuff
} SL_ENTITY;


void SL_MATMUL(SL_VEC3 matrix[3], SL_VEC3 vector, SL_VEC3* output){
	int i, o;

	for (i = 0; i < 3; i++){
		output->vec[i] = 0.0;

		for (o = 0; o < 3; o++){
			output->vec[i] += matrix[i].vec[o] * vector.vec[o];
		}
	}
}


/*CORE RENDERER STATE BEGINS HERE*/
#define SL_MAXVERTS 1200
#define SL_MAXTRIS 1000

SL_VEC3 SL_VERTEX_BUFFER[SL_MAXVERTS];
SL_POLY SL_TRIANGLE_BUFFER[SL_MAXTRIS];

float SL_CAMERA_X, SL_CAMERA_Y, SL_CAMERA_Z;
SL_VEC3 SL_WORLD_ROTATION_MATRIX[3];

int SL_VERTEX_INDEX = 0;
int SL_TRIANGLE_INDEX = 0;

float SL_FOV = 100;
/*CORE RENDERER STATE ENDS HERE*/

#define ConnectVertices(vert1, vert2, col)	drawline(vert1.vec[0] + 160, vert1.vec[1] + 100, vert2.vec[0] + 160, vert2.vec[1] + 100, col)


void SL_TRANSLATE(SL_VEC3 trans){
	SL_CAMERA_X = trans.vec[0];
	SL_CAMERA_Y = trans.vec[1];
	SL_CAMERA_Z = trans.vec[2];
}

void SL_ROTATE(uint8_t pitch, uint8_t yaw, uint8_t roll, SL_VEC3 matrix[3]){
	float sin_pitch = sin(pitch * PI / 128);
	float cos_pitch = cos(pitch * PI / 128);
	float sin_yaw = sin(yaw * PI / 128);
	float cos_yaw = cos(yaw * PI / 128);
	float sin_roll = sin(roll * PI / 128);
	float cos_roll = cos(roll * PI / 128);

	matrix[0].vec[0] = cos_yaw * cos_roll;
	matrix[0].vec[1] = -cos_pitch * sin_roll + sin_pitch * sin_yaw * cos_roll;
	matrix[0].vec[2] = sin_pitch * sin_roll + cos_pitch * sin_yaw * cos_roll;

	matrix[1].vec[0] = cos_yaw * sin_roll;
	matrix[1].vec[1] = cos_pitch * cos_roll + sin_pitch * sin_yaw * sin_roll;
	matrix[1].vec[2] = -sin_pitch * cos_roll + cos_pitch * sin_yaw * sin_roll;

	matrix[2].vec[0] = -sin_yaw;
	matrix[2].vec[1] = sin_pitch * cos_yaw;
	matrix[2].vec[2] = cos_pitch * cos_yaw;
}

void SL_BEGIN(){ //clear geometry buffers
	SL_VERTEX_INDEX = 0;
	SL_TRIANGLE_INDEX = 0;
}

int SL_CLIP(SL_VEC3* vec){
	return (vec->vec[2] > 0) && (abs(vec->vec[0]) < 160) && (abs(vec->vec[1]) < 100);
}

void SL_END(){ //rasterizes - back-to-front, connect vertices for every triangle
	int i;
	SL_POLY tri;

	for (i = 0; i < SL_TRIANGLE_INDEX; i++){
		tri = SL_TRIANGLE_BUFFER[i];

		if (SL_CLIP(&SL_VERTEX_BUFFER[tri.vert1]) && SL_CLIP(&SL_VERTEX_BUFFER[tri.vert2]) && SL_CLIP(&SL_VERTEX_BUFFER[tri.vert3])){
			ConnectVertices(SL_VERTEX_BUFFER[tri.vert1], SL_VERTEX_BUFFER[tri.vert2], tri.color);
			ConnectVertices(SL_VERTEX_BUFFER[tri.vert3], SL_VERTEX_BUFFER[tri.vert2], tri.color);
			ConnectVertices(SL_VERTEX_BUFFER[tri.vert1], SL_VERTEX_BUFFER[tri.vert3], tri.color);
		}
	}
}

void SL_ZSORT(){ //Z-sort the triangle buffer

}

void print_vertex(SL_VEC3* vert){
	printf("(%f, %f, %f)\n", vert->vec[0], vert->vec[1], vert->vec[2]);
}

void SL_VERTEX(float p1, float p2, float p3){
	float scale;
	SL_VEC3 vert = { p1 - SL_CAMERA_X, p2 - SL_CAMERA_Y, p3 - SL_CAMERA_Z };

	//apply scene-space rotation
	SL_MATMUL(SL_WORLD_ROTATION_MATRIX, vert, &vert);

	//project into the vertex list
	scale = SL_FOV / vert.vec[2];
	SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[0] = vert.vec[0] * scale;
	SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[1] = vert.vec[1] * scale;
	SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[2] = vert.vec[2];
	//print_vertex(&SL_VERTEX_BUFFER[SL_VERTEX_INDEX]);
	SL_VERTEX_INDEX++;
}

void SL_TRIANGLES(SL_POLY* tris, int num_tris, int vertex_offset){
	int i;

	for (i = 0; i < num_tris; i++){
		SL_TRIANGLE_BUFFER[SL_TRIANGLE_INDEX].color = tris[i].color;
		SL_TRIANGLE_BUFFER[SL_TRIANGLE_INDEX].vert1 = tris[i].vert1 + vertex_offset;
		SL_TRIANGLE_BUFFER[SL_TRIANGLE_INDEX].vert2 = tris[i].vert2 + vertex_offset;
		SL_TRIANGLE_BUFFER[SL_TRIANGLE_INDEX].vert3 = tris[i].vert3 + vertex_offset;

		SL_TRIANGLE_INDEX++;
	}
}

void SL_DRAWSCENE(SL_ENTITY* models, int num_models, SL_VEC3 cam_pos, uint8_t cam_pitch, uint8_t cam_yaw, uint8_t cam_roll, int zsort){ //renders everything
	int i, p;
	int cur_index;
	SL_VEC3 temp_vert;
	SL_VEC3 model_rotation_matrix[3];
	
	SL_TRANSLATE(cam_pos);
	SL_ROTATE(cam_pitch, cam_yaw, cam_roll, SL_WORLD_ROTATION_MATRIX);
	
	SL_BEGIN();

	for (i = 0; i < num_models; i++){
		cur_index = SL_VERTEX_INDEX;

		//create per-model rotation matrix
		SL_ROTATE(models[i].pitch, models[i].yaw, models[i].roll, model_rotation_matrix);

		//rotate and load every vertex
		for (p = 0; p < models[i].num_verts; p++){
			SL_MATMUL(model_rotation_matrix, models[i].verts[p], &temp_vert);
			SL_VERTEX(temp_vert.vec[0] + models[i].pos.vec[0], temp_vert.vec[1] + models[i].pos.vec[1], temp_vert.vec[2] + models[i].pos.vec[2]);
		}

		//load in tris
		SL_TRIANGLES(models[i].mesh, models[i].num_polys, cur_index);
	}

	if (zsort){
		SL_ZSORT();
	}

	SL_END();

}


SL_POLY formTri(int v1, int v2, int v3, unsigned char color){
	return SL_POLY{ v1, v2, v3, color };
}


SL_ENTITY* SL_LOADMODEL(char* filename, SL_ENTITY* entity){
	FILE* fp = fopen(filename, "r");
	int eof = 0;
	int res;
	char lineHeader[512];
	int currentVert = 0;
	int currentFace = 0;
	int face1, face2, face3;
	float x, y, z;
	uint32_t current_color;

	SL_POLY* polys = (SL_POLY*)malloc(sizeof(SL_POLY) * 200);
	SL_VEC3* verts = (SL_VEC3*)malloc(sizeof(SL_VEC3) * 200);

	while (!eof){
		res = fscanf(fp, "%s", lineHeader);
		if (res == -1){ eof = 1; break; }

		if (strcmp(lineHeader, "v") == 0){
			fscanf(fp, "%f %f %f\n", &x, &y, &z);
			verts[currentVert].vec[0] = x;
			verts[currentVert].vec[1] = y;
			verts[currentVert].vec[2] = z;
			currentVert++;
		}

		if (strcmp(lineHeader, "f") == 0){
			fscanf(fp, "%d %d %d\n", &face1, &face2, &face3);
			polys[currentFace].color = current_color;
			polys[currentFace].vert1 = face1 - 1;
			polys[currentFace].vert2 = face2 - 1;
			polys[currentFace].vert3 = face3 - 1;
			currentFace++;
		}

		if (strcmp(lineHeader, "usemtl") == 0){
			fscanf(fp, "%d", &current_color);
		}
	}

	entity->num_polys = currentFace;
	entity->num_verts = currentVert;
	entity->verts = verts;
	entity->mesh = polys;

	return entity;
}


SL_ENTITY formCube(unsigned short shade, float size){
	SL_ENTITY temporary;
	temporary.num_polys = 12;
	temporary.num_verts = 8;
	temporary.verts = (SL_VEC3*)malloc(8 * sizeof(SL_VEC3));
	temporary.mesh = (SL_POLY*)malloc(temporary.num_polys*sizeof(SL_POLY));
	int i;

	for (i = 0; i<8; i++){
		if (((i % 4) == 0) || (i % 4) == 1){
			temporary.verts[i].vec[0] = size;
		}
		else{
			temporary.verts[i].vec[0] = -size;
		}
		if (i<4){
			temporary.verts[i].vec[1] = -size;
		}
		else{
			temporary.verts[i].vec[1] = size;
		}
		if ((i == 7) || (i == 4) || (i == 3) || (i == 0)){
			temporary.verts[i].vec[2] = -size;
		}
		else{
			temporary.verts[i].vec[2] = size;
		}
	}

	temporary.mesh[0] = formTri(1, 2, 3, shade);
	temporary.mesh[1] = formTri(7, 6, 5, shade);
	temporary.mesh[2] = formTri(4, 5, 1, shade);
	temporary.mesh[3] = formTri(5, 6, 2, shade);
	temporary.mesh[4] = formTri(2, 6, 7, shade);
	temporary.mesh[5] = formTri(0, 3, 7, shade);
	temporary.mesh[6] = formTri(0, 1, 3, shade);
	temporary.mesh[7] = formTri(4, 7, 5, shade);
	temporary.mesh[8] = formTri(0, 4, 1, shade);
	temporary.mesh[9] = formTri(1, 5, 2, shade);
	temporary.mesh[10] = formTri(3, 2, 7, shade);
	temporary.mesh[11] = formTri(4, 0, 7, shade);
	temporary.pos.vec[0] = 00;
	temporary.pos.vec[1] = 00;
	temporary.pos.vec[2] = 40;


	return temporary;
}
