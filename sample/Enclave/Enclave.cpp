#include "Enclave_t.h"
#include "sgx_eid.h" 

#include "fv.hpp"

using namespace oride;

extern sgx_enclave_id_t global_eid;

SecKeyStruct sk_bin;

void ecall_generate_plain(void* ct_bin, void* isCt3, int* dataFilter){
    int count=1;

    using SK = SecretKey<uint64_t, DEGREE, NBMODULI>;
    using APK = AbstractPublicKey<uint64_t, DEGREE, NBMODULI>;
    using PK = PublicKey<uint64_t, DEGREE, NBMODULI>;

    using PT = Plaintext<uint32_t, DEGREE>;
    using CT2 = Ciphertext2<uint64_t, DEGREE, NBMODULI, uint32_t>;
    using CT3 = Ciphertext3<uint64_t, DEGREE, NBMODULI, uint32_t>;

    SK sk(sk_bin);
    if(*((int*)isCt3)==1){
        CT3 ct3(*((CT3Struct*)ct_bin));
        PT plain=sk.decrypt(ct3);
        plain.ntt();

        for (int i = 0 ; i < DEGREE ; ++i)
            dataFilter[i] = plain.get(i);
        return;
    } else {
        CT2 ct2(*((CT2Struct*)ct_bin));
        PT plain=sk.decrypt(ct2);
        plain.ntt();

        for (int i = 0 ; i < DEGREE ; ++i)
            dataFilter[i] = plain.get(i);
        return;
    }
    
}

void ecall_save_secret_key(void* sk_bin_str){
    sk_bin=*((SecKeyStruct*)sk_bin_str);
    return;
}
