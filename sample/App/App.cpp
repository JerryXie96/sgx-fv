#include <chrono>
#include <cstdlib>

#include "sgx_urts.h"
#include "sgx_utils/sgx_utils.h"
#include "Enclave_u.h"

#include "fv.hpp"

using namespace oride;

sgx_enclave_id_t global_eid = 0;
int plain[DEGREE]; // corresponding to Degree

void test(){
    srand(time(NULL));

    using SK = SecretKey<uint64_t, DEGREE, NBMODULI>;
    using APK = AbstractPublicKey<uint64_t, DEGREE, NBMODULI>;
    using PK = PublicKey<uint64_t, DEGREE, NBMODULI>;

    using PT = Plaintext<uint32_t, DEGREE>;
    using CT2 = Ciphertext2<uint64_t, DEGREE, NBMODULI, uint32_t>;
    using CT3 = Ciphertext3<uint64_t, DEGREE, NBMODULI, uint32_t>;

    std::array<uint32_t, DEGREE> a,b;
    bool isCorrect;
    int isCt3;

    std::cout<<"Generate FV-SHE public key and secret key."<<std::endl;
    SK sk;
    APK apk(sk);
    PK pk(std::move(apk));
    // Warning: This is just used for local test. Please use Remote Attestation to transmit the secret key to the SGX enclave.
    SecKeyStruct sk_struct=sk.output();
    sgx_status_t status_t=ecall_save_secret_key(global_eid,&sk_struct);
    
    std::cout<<"Generate random vectors a and b."<<std::endl;
    for(int i=0;i<DEGREE;i++){
        a[i]=rand()%500;
        b[i]=rand()%500;
        while(a[i]<b[i]){
            a[i]=rand()%500;
            b[i]=rand()%500;
        }
    }

    PT pt_a_add(a);
    PT pt_b_add(b);
    pt_a_add.invntt();
    pt_b_add.invntt();
    CT2 ct2_a_add=pk.encrypt(pt_a_add);
    CT2 ct2_b_add=pk.encrypt(pt_b_add);
    ct2_a_add+=ct2_b_add;
    PT pt_sum=sk.decrypt(ct2_a_add);
    pt_sum.ntt();
    CT2Struct ct2_struct_sum=ct2_a_add.output();
    isCt3=0;
    status_t=ecall_generate_plain(global_eid,&ct2_struct_sum,&isCt3,plain);
    isCorrect=true;
    for(int i=0;i<DEGREE;i++)
        if(pt_sum.get(i)!=plain[i] || a[i]+b[i]!=plain[i]){
            isCorrect=false;
            break;
        }
    
    if(isCorrect)
        std::cout<<"Test Addition: Pass."<<std::endl;
    else
        std::cout<<"Test Addition: Failed."<<std::endl;
    
    PT pt_a_sub(a);
    PT pt_b_sub(b);
    pt_a_sub.invntt();
    pt_b_sub.invntt();
    CT2 ct2_a_sub=pk.encrypt(pt_a_sub);
    CT2 ct2_b_sub=pk.encrypt(pt_b_sub);
    ct2_a_sub-=ct2_b_sub;
    PT pt_diff=sk.decrypt(ct2_a_sub);
    pt_diff.ntt();
    // Warning: This is just used for local test. Please use Remote Attestation to transmit the secret key to the SGX enclave.
    CT2Struct ct2_struct_diff=ct2_a_sub.output();
    isCt3=0;
    status_t=ecall_generate_plain(global_eid,&ct2_struct_diff,&isCt3,plain);
    isCorrect=true;
    for(int i=0;i<DEGREE;i++)
        if(pt_diff.get(i)!=plain[i] || a[i]-b[i]!=plain[i]){
            isCorrect=false;
            break;
        }
    if(isCorrect)
        std::cout<<"Test Substraction: Pass."<<std::endl;
    else
        std::cout<<"Test Substraction: Failed."<<std::endl;

    PT pt_a_multi(a);
    PT pt_b_multi(b);
    pt_a_multi.invntt();
    pt_b_multi.invntt();
    CT2 ct2_a_multi=pk.encrypt(pt_a_multi);
    CT2 ct2_b_multi=pk.encrypt(pt_b_multi);
    CT3 ct3_pro=ct2_a_multi.mul_norelin(ct2_b_multi);
    PT pt_pro=sk.decrypt(ct3_pro);
    pt_pro.ntt();
    // Warning: This is just used for local test. Please use Remote Attestation to transmit the secret key to the SGX enclave.
    CT3Struct ct3_struct_pro=ct3_pro.output();
    isCt3=1;
    status_t=ecall_generate_plain(global_eid,&ct3_struct_pro,&isCt3,plain);
    isCorrect=true;
    for(int i=0;i<DEGREE;i++)
        if(pt_pro.get(i)!=plain[i] || a[i]*b[i]!=plain[i]){
            isCorrect=false;
            break;
        }
    if(isCorrect)
        std::cout<<"Test Multiplication: Pass."<<std::endl;
    else
        std::cout<<"Test Multiplication: Failed."<<std::endl;
}

int main(){
    if (initialize_enclave(&global_eid, "enclave.token", "enclave.signed.so") < 0) {
        std::cout << "Fail to initialize enclave." << std::endl;
        return -1;
    }
    
    test();

    return 0;
}

