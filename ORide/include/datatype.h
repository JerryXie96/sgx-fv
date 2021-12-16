/*
  8192 is the max polynomial bits for 512 degrees
  The bits and degrees can be changed by the same ratio.
  
  The bits can be calculated by Degree*NbModuli*sizeof(T), which T is uint64 in this example.
*/

#ifndef DATATYPE_H_
#define DATATYPE_H_
#define MAX_POLY_BIT 8192
typedef struct {
  char value_bin[MAX_POLY_BIT],value_shoup_bin[MAX_POLY_BIT];
} SecKeyStruct;

typedef struct {
  char c0_bin[MAX_POLY_BIT],c1_bin[MAX_POLY_BIT];
} CT2Struct;

typedef struct {
  char c0_bin[MAX_POLY_BIT],c1_bin[MAX_POLY_BIT],c2_bin[MAX_POLY_BIT];
} CT3Struct;

#endif
