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


typedef struct SL_VEC3{
        fixed vec[3];
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

        int state[8];
        void (*script)(struct SL_ENTITY**);
} SL_ENTITY;

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

        matrix[0].vec[0] = (FixedMul(cos_yaw, cos_roll));
        matrix[0].vec[1] = (FixedMul(-cos_pitch, sin_roll) + FixedMul(sin_pitch, FixedMul(sin_yaw, cos_roll)));
        matrix[0].vec[2] = (FixedMul(sin_pitch, sin_roll) + FixedMul(cos_pitch, FixedMul(sin_yaw, cos_roll)));

        matrix[1].vec[0] = (FixedMul(cos_yaw, sin_roll));
        matrix[1].vec[1] = (FixedMul(cos_pitch, cos_roll) + FixedMul(sin_pitch, FixedMul(sin_yaw, sin_roll)));
        matrix[1].vec[2] = (FixedMul(-sin_pitch, cos_roll) + FixedMul(cos_pitch, FixedMul(sin_yaw, sin_roll)));

        matrix[2].vec[0] = (-sin_yaw);
        matrix[2].vec[1] = (FixedMul(sin_pitch, cos_yaw));
        matrix[2].vec[2] = (FixedMul(cos_pitch, cos_yaw));
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
                for (p = 0; p < models[i]->num_verts; p++){
                        SL_MATMUL(model_rotation_matrix, models[i]->verts[p], &temp_vert);

                        SL_VERTEX(temp_vert.vec[0] + models[i]->pos.vec[0], temp_vert.vec[1] + models[i]->pos.vec[1], temp_vert.vec[2] + models[i]->pos.vec[2]);
                }

                //load in tris
                SL_TRIANGLES(models[i]->mesh, models[i]->num_polys, cur_index);
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

SL_ENTITY formCube(unsigned short shade, int size){
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
        int current_color;

        SL_POLY* polys = (SL_POLY*)malloc(sizeof(SL_POLY) * 200);
        SL_VEC3* verts = (SL_VEC3*)malloc(sizeof(SL_VEC3) * 200);

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

        entity->num_polys = currentFace;
        entity->num_verts = currentVert;
        entity->verts = verts;
        entity->mesh = polys;

        return entity;
}
