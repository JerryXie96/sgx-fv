# sgx-fv
    This is a modified library to enable FV Somewhat Homomorphic Encryption (FV-SHE) in Intel SGX.
    
    This library is based on [sgx-gmp](https://github.com/intel/sgx-gmp), [MPFR](https://www.mpfr.org/), [NFLlib](https://github.com/quarkslab/NFLlib) and [ORide](https://github.com/ldsec/ORide) inspired from [FV-NFLlib](https://github.com/CryptoExperts/FV-NFLlib).

## Installation Guide
    1. Compile the library in the folder `sgx-gmp`. The library will be installed in `/opt/gmp`.
        1.1 execute command `./configure`.
        1.2 execute command `make`.
        1.3 execute command `make install`.
    2. Compile the library in the folder `mpfr`. The library will be installed in `/opt/mpfr`.
        2.1 execute command `./configure CPPFLAGS="-I/opt/gmp/6.1.2/include" LDFLAGS="-L/opt/gmp/6.1.2/lib"`.
        2.2 open `makefile` and change the property `LIBS = -lgmp' to `LIBS = -lsgx_tgmp`.
        2.3 execute command `make install`.
    3. Compile the library in the folder `NFLlib`.
        3.1 execute command `cmake .`.
        3.2 execute command `make`.
    4. Compile the library in the folder 'ORide'.
        4.1 execute command `make`.
    
## SGX Implementation
    To use the library in Intel SGX, you should use the `include` folders in `NFLlib` and `ORide` as the include paths. `libnfllib_static.a` and `libfvshe.a` should be used as the link packages.

    The link options are `-lnfllib_static -lfvshe -lmpfr -lsgx_tgmp`.
    
    The include paths and link packages of sgx-gmp and MPFR should also be used.
    A typical code framework of SGX applications can be referred to [hello-enclave](https://github.com/digawp/hello-enclave).

    The example of how to use the FV functions can be referred to the `sample` folder which is based on [hello-enclave](https://github.com/digawp/hello-enclave).

## To-do
    The encryption and relinearization in SGX enclaves.