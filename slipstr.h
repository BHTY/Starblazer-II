#define MAX_ENTITIES 500


#define PI 3.14159
#define float2fixed(n)  (fixed)(n*65536)
#define fixed2float(n)  ((n)/65536.0)

typedef signed long fixed;
typedef unsigned char uint8_t;

extern fixed FixedMul(fixed n1, fixed n2);
extern fixed FixedDiv(fixed n1, fixed n2);

#pragma aux FixedMul = \
        "imul ebx" \
        "shr eax, 16" \
        "shl edx, 16" \
        "or eax, edx" \
        parm [eax] [ebx] \
        modify [edx] \
        value [eax];

#pragma aux FixedDiv = \
        "mov edx, eax" \
        "shr edx, 16" \
        "movsx edx, dx" \
        "shl eax, 16" \
        "idiv ebx" \
        parm [eax] [ebx] \
        modify [edx] \
        value [eax];

fixed SL_SIN[256] = {0,
1608,
3215,
4821,
6423,
8022,
9616,
11204,
12785,
14359,
15923,
17479,
19024,
20557,
22078,
23586,
25079,
26557,
28020,
29465,
30893,
32302,
33692,
35061,
36409,
37736,
39039,
40319,
41575,
42806,
44011,
45189,
46340,
47464,
48558,
49624,
50660,
51665,
52639,
53581,
54491,
55368,
56212,
57022,
57797,
58538,
59243,
59913,
60547,
61144,
61705,
62228,
62714,
63162,
63571,
63943,
64276,
64571,
64826,
65043,
65220,
65358,
65457,
65516,
65536,
65516,
65457,
65358,
65220,
65043,
64826,
64571,
64276,
63943,
63571,
63162,
62714,
62228,
61705,
61144,
60547,
59913,
59243,
58538,
57797,
57022,
56212,
55368,
54491,
53581,
52639,
51665,
50660,
49624,
48558,
47464,
46340,
45189,
44011,
42806,
41575,
40319,
39039,
37736,
36409,
35061,
33692,
32302,
30893,
29465,
28020,
26557,
25079,
23586,
22078,
20557,
19024,
17479,
15923,
14359,
12785,
11204,
9616,
8022,
6423,
4821,
3215,
1608,
0,
-1608,
-3215,
-4821,
-6423,
-8022,
-9616,
-11204,
-12785,
-14359,
-15923,
-17479,
-19024,
-20557,
-22078,
-23586,
-25079,
-26557,
-28020,
-29465,
-30893,
-32302,
-33692,
-35061,
-36409,
-37736,
-39039,
-40319,
-41575,
-42806,
-44011,
-45189,
-46340,
-47464,
-48558,
-49624,
-50660,
-51665,
-52639,
-53581,
-54491,
-55368,
-56212,
-57022,
-57797,
-58538,
-59243,
-59913,
-60547,
-61144,
-61705,
-62228,
-62714,
-63162,
-63571,
-63943,
-64276,
-64571,
-64826,
-65043,
-65220,
-65358,
-65457,
-65516,
-65536,
-65516,
-65457,
-65358,
-65220,
-65043,
-64826,
-64571,
-64276,
-63943,
-63571,
-63162,
-62714,
-62228,
-61705,
-61144,
-60547,
-59913,
-59243,
-58538,
-57797,
-57022,
-56212,
-55368,
-54491,
-53581,
-52639,
-51665,
-50660,
-49624,
-48558,
-47464,
-46340,
-45189,
-44011,
-42806,
-41575,
-40319,
-39039,
-37736,
-36409,
-35061,
-33692,
-32302,
-30893,
-29465,
-28020,
-26557,
-25079,
-23586,
-22078,
-20557,
-19024,
-17479,
-15923,
-14359,
-12785,
-11204,
-9616,
-8022,
-6423,
-4821,
-3215,
-1608};

fixed SL_COS[256] = {65536,
65516,
65457,
65358,
65220,
65043,
64826,
64571,
64276,
63943,
63571,
63162,
62714,
62228,
61705,
61144,
60547,
59913,
59243,
58538,
57797,
57022,
56212,
55368,
54491,
53581,
52639,
51665,
50660,
49624,
48558,
47464,
46340,
45189,
44011,
42806,
41575,
40319,
39039,
37736,
36409,
35061,
33692,
32302,
30893,
29465,
28020,
26557,
25079,
23586,
22078,
20557,
19024,
17479,
15923,
14359,
12785,
11204,
9616,
8022,
6423,
4821,
3215,
1608,
0,
-1608,
-3215,
-4821,
-6423,
-8022,
-9616,
-11204,
-12785,
-14359,
-15923,
-17479,
-19024,
-20557,
-22078,
-23586,
-25079,
-26557,
-28020,
-29465,
-30893,
-32302,
-33692,
-35061,
-36409,
-37736,
-39039,
-40319,
-41575,
-42806,
-44011,
-45189,
-46340,
-47464,
-48558,
-49624,
-50660,
-51665,
-52639,
-53581,
-54491,
-55368,
-56212,
-57022,
-57797,
-58538,
-59243,
-59913,
-60547,
-61144,
-61705,
-62228,
-62714,
-63162,
-63571,
-63943,
-64276,
-64571,
-64826,
-65043,
-65220,
-65358,
-65457,
-65516,
-65536,
-65516,
-65457,
-65358,
-65220,
-65043,
-64826,
-64571,
-64276,
-63943,
-63571,
-63162,
-62714,
-62228,
-61705,
-61144,
-60547,
-59913,
-59243,
-58538,
-57797,
-57022,
-56212,
-55368,
-54491,
-53581,
-52639,
-51665,
-50660,
-49624,
-48558,
-47464,
-46340,
-45189,
-44011,
-42806,
-41575,
-40319,
-39039,
-37736,
-36409,
-35061,
-33692,
-32302,
-30893,
-29465,
-28020,
-26557,
-25079,
-23586,
-22078,
-20557,
-19024,
-17479,
-15923,
-14359,
-12785,
-11204,
-9616,
-8022,
-6423,
-4821,
-3215,
-1608,
0,
1608,
3215,
4821,
6423,
8022,
9616,
11204,
12785,
14359,
15923,
17479,
19024,
20557,
22078,
23586,
25079,
26557,
28020,
29465,
30893,
32302,
33692,
35061,
36409,
37736,
39039,
40319,
41575,
42806,
44011,
45189,
46340,
47464,
48558,
49624,
50660,
51665,
52639,
53581,
54491,
55368,
56212,
57022,
57797,
58538,
59243,
59913,
60547,
61144,
61705,
62228,
62714,
63162,
63571,
63943,
64276,
64571,
64826,
65043,
65220,
65358,
65457,
65516};
fixed SL_TAN[256];

void computeTanLut() {
	int angle;
	for (angle = 0; angle < 256; angle++) {
		if (SL_COS[angle]) {
			SL_TAN[angle] = FixedDiv(SL_SIN[angle],SL_COS[angle]);
		} else {
			if (SL_SIN[angle] < 0) {
				SL_TAN[angle] = 0x80000000;
			} else {
				SL_TAN[angle] = 0x7fffffff;
			}
		}
	}
}

int sl_atan2(fixed y, fixed x) {
	unsigned char angle = 0xc0;
	fixed tangent;
	if (x == 0) {
		if (y < 0) return 0xc0;
		return 0x40;
	}
	tangent = FixedDiv(y,x);
	while (angle != 0x40) {
		angle++;
		if (SL_TAN[angle?angle-1:0xff] <= tangent && SL_TAN[angle] >= tangent) break; 
	}
	if (angle == 0xc1 || angle == 0x41) angle--;
	if (x < 0) angle ^= 0x80;
	return angle;
}

fixed sl_hypot(fixed x, fixed y) {
	// TODO: use a better version, somehow
	float xf = x / 65536.0;
	float yf = y / 65536.0;
	return (fixed)(65536*hypot(xf, yf));
}
typedef struct SL_VEC3{
        fixed vec[3];
} SL_VEC3;

typedef struct SL_POLY{ //triangle
        int vert1, vert2, vert3;
        uint8_t color;
} SL_POLY;


struct SL_TEMPLATE;

typedef struct SL_ENTITY{
        struct SL_TEMPLATE* type;
        SL_VEC3 pos;
        uint8_t pitch, yaw, roll;
        int num_verts;
        int num_polys;

        int state[8];
        int health;
} SL_ENTITY;

struct SL_TEMPLATE{
	SL_POLY* mesh;
	SL_VEC3* verts;
	int num_verts;
	int num_polys;
        void (*script)(SL_ENTITY**);
        fixed hitboxX;
        fixed hitboxY;
        fixed hitboxZ;
        int maxhp;
        int flags; // shootable
};
typedef struct SL_TEMPLATE SL_TEMPLATE;
	
typedef struct SL_PACKET {
	SL_VEC3 pos;
	unsigned char pitch;
	unsigned char yaw;
	unsigned char roll;
	unsigned char firing;
} SL_PACKET;
int SL_COLLIDE(SL_ENTITY *ent1, SL_ENTITY *ent2) {
	if (abs(ent1->pos.vec[0] - ent2->pos.vec[0]) < ent1->type->hitboxX >> 1) {
		if (abs(ent1->pos.vec[1] - ent2->pos.vec[1]) < ent1->type->hitboxY >> 1) {
			if (abs(ent1->pos.vec[2] - ent2->pos.vec[2]) < ent1->type->hitboxZ >> 1) {
				return 1;
			}
		}
	}
	return 0;
}

void SL_MATMUL(SL_VEC3 matrix[3], SL_VEC3 vector, SL_VEC3* output){
        int i, o;

        output->vec[0] = FixedMul(matrix[0].vec[0], vector.vec[0]) + FixedMul(matrix[0].vec[1], vector.vec[1]) + FixedMul(matrix[0].vec[2], vector.vec[2]);
        output->vec[1] = FixedMul(matrix[1].vec[0], vector.vec[0]) + FixedMul(matrix[1].vec[1], vector.vec[1]) + FixedMul(matrix[1].vec[2], vector.vec[2]);
        output->vec[2] = FixedMul(matrix[2].vec[0], vector.vec[0]) + FixedMul(matrix[2].vec[1], vector.vec[1]) + FixedMul(matrix[2].vec[2], vector.vec[2]);

        /*for (i = 0; i < 3; i++){
                output->vec[i] = matrix[i].vec[0] * vector.vec[0] + matrix[i].vec[1] * vector.vec[1] + matrix[i].vec[2] * vector.vec[2];
        }*/
}


/*CORE RENDERER STATE BEGINS HERE*/
#define SL_MAXVERTS 1200
#define SL_MAXTRIS 1000

SL_VEC3 SL_VERTEX_BUFFER[SL_MAXVERTS];
SL_POLY SL_TRIANGLE_BUFFER[SL_MAXTRIS];

fixed SL_CAMERA_X, SL_CAMERA_Y, SL_CAMERA_Z;
SL_VEC3 SL_WORLD_ROTATION_MATRIX[3];

int SL_VERTEX_INDEX = 0;
int SL_TRIANGLE_INDEX = 0;

fixed SL_FOV = 0x640000;
/*CORE RENDERER STATE ENDS HERE*/

#define ConnectVertices(vert1, vert2, col)      drawline(160 - fixed2float(vert1.vec[0]), 100 - fixed2float(vert1.vec[1]), 160 - fixed2float(vert2.vec[0]), 100 - fixed2float(vert2.vec[1]), col)

void SL_TRANSLATE(SL_VEC3 trans){
        SL_CAMERA_X = trans.vec[0];
        SL_CAMERA_Y = trans.vec[1];
        SL_CAMERA_Z = trans.vec[2];
}

void print_vertex(SL_VEC3* vert){
        printf("(%f, %f, %f)\n", fixed2float(vert->vec[0]), fixed2float(vert->vec[1]), fixed2float(vert->vec[2]));
}

void SL_ROTATE(uint8_t pitch, uint8_t yaw, uint8_t roll, SL_VEC3 matrix[3]){
        fixed sin_pitch = SL_SIN[pitch];
        fixed cos_pitch = SL_COS[pitch];
        fixed sin_yaw = SL_SIN[yaw];
        fixed cos_yaw = SL_COS[yaw];
        fixed sin_roll = SL_SIN[roll];
        fixed cos_roll = SL_COS[roll];
        //α yaw, around z
        //β pitch, around y
        //γ roll, around x

        /*matrix[0].vec[0] = (FixedMul(cos_yaw, cos_roll)); // cosβ cosα
        matrix[0].vec[1] = (FixedMul(-cos_pitch, sin_roll) + FixedMul(sin_pitch, FixedMul(sin_yaw, cos_roll))); // sinγ sinβ cosα - cosγ sinα
        matrix[0].vec[2] = (FixedMul(sin_pitch, sin_roll) + FixedMul(cos_pitch, FixedMul(sin_yaw, cos_roll))); // cosγ sinβ cosα + sinγ sinα

        matrix[1].vec[0] = (FixedMul(cos_yaw, sin_roll)); // cosβ sinα
        matrix[1].vec[1] = (FixedMul(cos_pitch, cos_roll) + FixedMul(sin_pitch, FixedMul(sin_yaw, sin_roll))); // sinγ sinβ sinα + cosγ cosα
        matrix[1].vec[2] = (FixedMul(-sin_pitch, cos_roll) + FixedMul(cos_pitch, FixedMul(sin_yaw, sin_roll))); // cosγ sinβ sinα - sinγ cosα

        matrix[2].vec[0] = (-sin_yaw); // -sinβ
        matrix[2].vec[1] = (FixedMul(sin_pitch, cos_yaw)); // sinγ cosβ
        matrix[2].vec[2] = (FixedMul(cos_pitch, cos_yaw)); // cosγ cosβ*/
        
        matrix[0].vec[0] = (FixedMul(cos_yaw, cos_pitch));
        matrix[0].vec[1] = (FixedMul(FixedMul(cos_yaw, sin_pitch), sin_roll) - FixedMul(sin_yaw, cos_roll));
        matrix[0].vec[2] = (FixedMul(FixedMul(cos_yaw, sin_pitch), cos_roll) + FixedMul(sin_yaw, sin_roll));
        
        matrix[1].vec[0] = (FixedMul(sin_yaw, cos_pitch));
        matrix[1].vec[1] = (FixedMul(FixedMul(sin_yaw, sin_pitch), sin_roll) + FixedMul(cos_yaw, cos_roll));
        matrix[1].vec[2] = (FixedMul(FixedMul(sin_yaw, sin_pitch), cos_roll) - FixedMul(cos_yaw, sin_roll));
        
        matrix[2].vec[0] = (-sin_pitch);
        matrix[2].vec[1] = (FixedMul(cos_pitch, sin_roll));
        matrix[2].vec[2] = (FixedMul(cos_pitch, cos_roll));
}

void SL_BEGIN(){ //clear geometry buffers
        SL_VERTEX_INDEX = 0;
        SL_TRIANGLE_INDEX = 0;
}

int SL_CLIP(SL_VEC3* vec){
        return (vec->vec[2] > 0) && (abs(vec->vec[0]) < 0xA00000) && (abs(vec->vec[1]) < 0x640000);
}

void SL_END(){ //rasterizes - back-to-front, connect vertices for every triangle
        int i;
        SL_POLY tri;

        for (i = 0; i < SL_TRIANGLE_INDEX; i++){
                tri = SL_TRIANGLE_BUFFER[i];
		if (SL_VERTEX_BUFFER[tri.vert1].vec[2] < 0 || SL_VERTEX_BUFFER[tri.vert2].vec[2] < 0 || SL_VERTEX_BUFFER[tri.vert3].vec[2] < 0) continue; // temp removing behind
                //if (SL_CLIP(&SL_VERTEX_BUFFER[tri.vert1]) && SL_CLIP(&SL_VERTEX_BUFFER[tri.vert2]) && SL_CLIP(&SL_VERTEX_BUFFER[tri.vert3])){
                        ConnectVertices(SL_VERTEX_BUFFER[tri.vert1], SL_VERTEX_BUFFER[tri.vert2], tri.color);
                        ConnectVertices(SL_VERTEX_BUFFER[tri.vert3], SL_VERTEX_BUFFER[tri.vert2], tri.color);
                        ConnectVertices(SL_VERTEX_BUFFER[tri.vert1], SL_VERTEX_BUFFER[tri.vert3], tri.color);
                //}
        }
}

void SL_ZSORT(){ //Z-sort the triangle buffer

}

fixed ABS(fixed x){
    fixed y = x >> 31;
    return (x ^ y) - y;
}

void SL_VERTEX(fixed p1, fixed p2, fixed p3){
        SL_VEC3 vert;
        fixed scale;
        vert.vec[0] = p1 - SL_CAMERA_X;
        vert.vec[1] = p2 - SL_CAMERA_Y;
        //vert.vec[2] = ((p3 - SL_CAMERA_Z) < 256) ? 256 : (p3 - SL_CAMERA_Z);
	vert.vec[2] = p3 - SL_CAMERA_Z;
	
        //apply scene-space rotation
        SL_MATMUL(SL_WORLD_ROTATION_MATRIX, vert, &vert);

        //project into the vertex list
        if((SL_FOV >> 16) >= (ABS(vert.vec[2]) >> 1)){
            scale = 1;
        }
        else{
            scale = FixedDiv(SL_FOV, vert.vec[2]);
        }

        SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[0] = FixedMul(vert.vec[0], scale);
        SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[1] = FixedMul(vert.vec[1], scale);
        SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[2] = vert.vec[2];
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
int sldx;
int sldy;
int spc = 255;
void SL_PLOTPOINT(SL_VEC3 pos) {
	// TODO: make this fit with the structure
	int x, y;
	SL_VERTEX(pos.vec[0], pos.vec[1], pos.vec[2]);
	SL_VERTEX_INDEX--;
	if (SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[2] < 0) return;
	x = SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[0];
	y = SL_VERTEX_BUFFER[SL_VERTEX_INDEX].vec[1];
	//if (x > 0 && y > 0 && x < 320 && y < 200) {
		draw_pixel(160 - fixed2float(x), 100 - fixed2float(y), spc);
		sldx = x;
		sldy = y;
	//}
}

void SL_DRAWSCENE(SL_ENTITY** models, SL_VEC3 cam_pos, uint8_t cam_pitch, uint8_t cam_yaw, uint8_t cam_roll, int zsort){ //renders everything
        int i, p;
        int cur_index;
        SL_VEC3 temp_vert;
        SL_VEC3 model_rotation_matrix[3];

        SL_TRANSLATE(cam_pos);
        SL_ROTATE(cam_pitch, cam_yaw, cam_roll, SL_WORLD_ROTATION_MATRIX);

        SL_BEGIN();

        for (i = 0; i < MAX_ENTITIES; i++){
                if(models[i] == 0){continue;}

                cur_index = SL_VERTEX_INDEX;

                //create per-model rotation matrix
                SL_ROTATE(models[i]->pitch, models[i]->yaw, models[i]->roll, model_rotation_matrix);

                //rotate and load every vertex
                for (p = 0; p < models[i]->type->num_verts; p++){
                        SL_MATMUL(model_rotation_matrix, models[i]->type->verts[p], &temp_vert);

                        SL_VERTEX(temp_vert.vec[0] + models[i]->pos.vec[0], temp_vert.vec[1] + models[i]->pos.vec[1], temp_vert.vec[2] + models[i]->pos.vec[2]);
                }

                //load in tris
                SL_TRIANGLES(models[i]->type->mesh, models[i]->type->num_polys, cur_index);
        }

        if (zsort){
                SL_ZSORT();
        }

        SL_END();

}

SL_POLY formTri(int v1, int v2, int v3, unsigned char color){
        SL_POLY tri;
        tri.color = color;
        tri.vert1 = v1;
        tri.vert2 = v2;
        tri.vert3 = v3;

        return tri;
}

/*SL_ENTITY formCube(unsigned short shade, int size){
        SL_ENTITY temporary;
        int i;
        temporary.num_polys = 12;
        temporary.num_verts = 8;
        temporary.verts = (SL_VEC3*)malloc(8 * sizeof(SL_VEC3));
        temporary.mesh = (SL_POLY*)malloc(temporary.num_polys*sizeof(SL_POLY));

        for (i = 0; i<8; i++){
                if (((i % 4) == 0) || (i % 4) == 1){
                        temporary.verts[i].vec[0] = float2fixed(size);
                }
                else{
                        temporary.verts[i].vec[0] = float2fixed(-size);
                }
                if (i<4){
                        temporary.verts[i].vec[1] = float2fixed(-size);
                }
                else{
                        temporary.verts[i].vec[1] = float2fixed(size);
                }
                if ((i == 7) || (i == 4) || (i == 3) || (i == 0)){
                        temporary.verts[i].vec[2] = float2fixed(-size);
                }
                else{
                        temporary.verts[i].vec[2] = float2fixed(size);
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
        temporary.pos.vec[2] = 40*65536;


        return temporary;
}*/

SL_TEMPLATE* SL_LOADMODEL(char* filename){
        FILE* fp = fopen(filename, "r");
        int eof = 0;
        int res;
        char lineHeader[512];
        int currentVert = 0;
        int currentFace = 0;
        int face1, face2, face3;
        float x, y, z;
        int current_color;

        SL_POLY* polys = (SL_POLY*)malloc(sizeof(SL_POLY) * 200);
        SL_VEC3* verts = (SL_VEC3*)malloc(sizeof(SL_VEC3) * 200);
        
        SL_TEMPLATE *tpl = (SL_TEMPLATE*)malloc(sizeof(SL_TEMPLATE));

        while (!eof){
                res = fscanf(fp, "%s", lineHeader);
                if (res == -1){ eof = 1; break; }

                if (strcmp(lineHeader, "v") == 0){
                        fscanf(fp, "%f %f %f\n", &x, &y, &z);
                        verts[currentVert].vec[0] = float2fixed(x);
                        verts[currentVert].vec[1] = float2fixed(y);
                        verts[currentVert].vec[2] = float2fixed(z/2);
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

        tpl->num_polys = currentFace;
        tpl->num_verts = currentVert;
        tpl->verts = verts;
        tpl->mesh = polys;
	
	tpl->flags = 0;
	fclose(fp);
        return tpl;
}
void SL_HITBOX(SL_TEMPLATE *tpl, int x, int y, int z) {
	tpl->hitboxX = x*65536;
	tpl->hitboxY = y*65536;
	tpl->hitboxZ = z*65536;
}
