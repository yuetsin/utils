#include <jni.h>
#include <string>
#include <cstdlib>

static int keybox[] = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};

extern "C" JNIEXPORT jstring JNICALL
Java_com_test_test1_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}

extern "C" JNIEXPORT jstring JNICALL
Java_com_test_test1_MainActivity_generate(
        JNIEnv *env,
        jobject/* this */ ) {
    int v0;       // ST08_4
    int v1;       // eax
    signed int i; // [rsp+Ch] [rbp-4h]

    std::string our_str;

    srand(0LL);
    for (i = 0; i < 100; ++i)
    {
        // swap keybox[v0] and keybox[v1]
        v0 = rand() % 64;
        v1 = rand() % 64;
        keybox[v0] += keybox[v1];
        keybox[v1] = keybox[v0] - keybox[v1];
        keybox[v0] -= keybox[v1];
    }

    printf("after modify, keybox is: \n");
    for (size_t i = 0; i < 64; i++)
    {
        our_str += std::to_string(keybox[i]);
        our_str += ", ";
    }
    return env->NewStringUTF(our_str.c_str());
}


