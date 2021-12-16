all:
	gcc -c util.cpp -I../NFLlib/include
	ar rcs libfvshe.a util.o
	mkdir include
	cp datatype.h fv.hpp serialize.hpp util.hpp include
	rm util.o

clean:
	rm libfvshe.a
	rm -rf include
