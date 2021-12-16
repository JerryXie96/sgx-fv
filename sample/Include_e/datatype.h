/*
  65536 is the max polynomial bits for 4096 degrees
  The bits and degrees can be changed by the same ratio.
  
  The bits can be calculated by Degree*NbModuli*sizeof(T), which T is uint64 in this example.
*/

#ifndef INCLUDE_E_DATATYPE_H_
#define INCLUDE_E_DATATYPE_H_


#define DEGREE 4096
#define NBMODULI 2
#define MAX_POLY_BIT DEGREE*NBMODULI*8

typedef struct {
  unsigned char value_bin[MAX_POLY_BIT],value_shoup_bin[MAX_POLY_BIT];
} SecKeyStruct;

typedef struct {
  unsigned char c0_bin[MAX_POLY_BIT],c1_bin[MAX_POLY_BIT];
} CT2Struct;

typedef struct {
  unsigned char c0_bin[MAX_POLY_BIT],c1_bin[MAX_POLY_BIT],c2_bin[MAX_POLY_BIT];
} CT3Struct;

#endif