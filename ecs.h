typedef struct vector{
	long x, y, z;
} vector;

typedef struct Entity{
	Object obj; //what kind of object is this (defines size, behavior, etc.)
	long state[8];
	vector pos;
} Entity;

void scale(char* imagePtr, char* newPtr, int oldX, int oldY, int newX, int newY) {

	int i, p, scaleFactorX, scaleFactorY, currentLine;

	if (!newX || !newY) return;

	scaleFactorX = (oldX << 4) / newX;
	scaleFactorY = (oldY << 4) / newY;
	currentLine = 0;

	for (i = 0; i < newY; i++) {
		for (p = 0; p < newX; p++) {
			newPtr[currentLine + p] = imagePtr[oldX * ((scaleFactorY * i) >> 4) + ((scaleFactorX * p) >> 4)];
		}

		currentLine += newX;
	}

}

void blit(char* bits, int xSize, int ySize, int x, int y){
	int i, p;
	char c;

	for (i = 0; i < ySize; i++){
		for (p = 0; p < xSize; p++){
			c = bits[i * xSize + p];
			if (c){ backbuffer[(y + i) * 320 + (x + p)] = c; }
		}
	}
}

#define fov 0.05
long FOV = 65536 / fov;

//modify to use fixed point math
void DrawEntity(vector* cam, Entity* obj, char* scratchSpace){
	//double scalefactor, size, xpos, ypos;
	long scalefactor, size, xpos, ypos;

	if (obj->pos.z <= cam->z) return;

	scalefactor = FOV / (obj->pos.z - cam->z);
	xpos = ((obj->pos.x - cam->x) * scalefactor) >> 16;
	ypos = ((obj->pos.y - cam->y) * scalefactor) >> 16;
	size = (obj->obj.size * scalefactor) >> 16;

	if (xpos >= 160 || xpos < -160 || ypos >= 100 || ypos < -100) return;

	scale(obj->obj.bits, scratchSpace, obj->obj.spriteSize, obj->obj.spriteSize, size, size);
	blit(scratchSpace, size, size, xpos + 160 - size / 2, ypos + 100 - size / 2);
}