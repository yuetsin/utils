#!/usr/bin/env python3

s = input('Flag >>> ')
assert(len(s) == 32)

s1 = _mm_cmpeq_pd(
    _mm_add_pd(
        _mm_mul_pd(_mm_unpckl_pd((__m128d)*(unsigned __int64 * )&s, (__m128d)*(unsigned __int64 * )&s), unk_201010),
        _mm_mul_pd(_mm_unpckl_pd((__m128d)v7, (__m128d)v7), unk_201020)),
    unk_201030)
