#ifndef __INT_H_
#define __INT_H_

typedef signed char int8;
typedef unsigned char uint8;
typedef signed short int16;
typedef unsigned short uint16;
typedef signed int int32;
typedef unsigned int uint32;
typedef uint8 bool_t;

#ifdef __GNUC__

typedef signed long long int64;
typedef unsigned long long uint64;

#else

typedef signed __int64 int64;
typedef unsigned __int64 uint64;

#endif

#endif
