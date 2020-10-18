#include <iostream>
#include <iterator>
#include <vector>
#include <set>

int main()
{
  std::basic_ostream<char,std::char_traits<char> > *v0; // rax
  std::basic_ostream<char,std::char_traits<char> > *v1; // rax
  int64_t v2; // rax
  uint64_t v3; // rax
  std::basic_ostream<char,std::char_traits<char> > *v4; // rax
  uint64_t v5; // rax
  std::string::iterator *v6; // rax
  std::basic_ostream<char,std::char_traits<char> > *v7; // rax
  std::string::iterator *v8; // rax
  uint64_t v9; // rax
  std::vector<std::pair<int,int>>::iterator *v10; // rax
  std::vector<int>::iterator *v11; // rax
  std::pair<int,int> *v12; // rax
  std::vector<int>::iterator *v13; // rax
  std::vector<int>::iterator *v14; // rax
  std::vector<int>::iterator *v15; // rax
  std::vector<int>::iterator *v16; // rax
  std::basic_ostream<char,std::char_traits<char> > *v17; // rax
  std::basic_ostream<char,std::char_traits<char> > *v18; // rax
  std::basic_ostream<char,std::char_traits<char> > *v19; // rax
  std::basic_ostream<char,std::char_traits<char> > *v20; // rax
  int v21; // [rsp+20h] [rbp-278h]
  int j; // [rsp+24h] [rbp-274h]
  char _Val; // [rsp+29h] [rbp-26Fh]
  char v24; // [rsp+2Ah] [rbp-26Eh]
  char v25; // [rsp+2Bh] [rbp-26Dh]
  char v26; // [rsp+2Ch] [rbp-26Ch]
  char v27; // [rsp+2Dh] [rbp-26Bh]
  char v28; // [rsp+2Eh] [rbp-26Ah]
  char v29; // [rsp+2Fh] [rbp-269h]
  char v30; // [rsp+30h] [rbp-268h]
  char v31; // [rsp+31h] [rbp-267h]
  char v32; // [rsp+32h] [rbp-266h]
  int v33; // [rsp+34h] [rbp-264h]
  int i; // [rsp+38h] [rbp-260h]
  int k; // [rsp+3Ch] [rbp-25Ch]
  std::set<char,std::less<char>,std::allocator<char> > v36; // [rsp+40h] [rbp-258h]
  std::vector<int,std::allocator<int> > v37; // [rsp+50h] [rbp-248h]
  bool v38; // [rsp+68h] [rbp-230h]
  std::string::iterator v39; // [rsp+70h] [rbp-228h]
  std::vector<std::pair<int,int> >::iterator v40; // [rsp+78h] [rbp-220h]
  unsigned int v41; // [rsp+88h] [rbp-210h]
  int v42; // [rsp+8Ch] [rbp-20Ch]
  unsigned int v43; // [rsp+90h] [rbp-208h]
  unsigned int v44; // [rsp+94h] [rbp-204h]
  unsigned int v45; // [rsp+98h] [rbp-200h]
  unsigned int v46; // [rsp+9Ch] [rbp-1FCh]
  std::set<char,std::less<char>,std::allocator<char> > v47; // [rsp+A0h] [rbp-1F8h]
  int *v48; // [rsp+B0h] [rbp-1E8h]
  std::set<char,std::less<char>,std::allocator<char> > v49; // [rsp+B8h] [rbp-1E0h]
  __int64_t _Off; // [rsp+C8h] [rbp-1D0h]
  std::vector<int>::const_iterator _Where; // [rsp+D0h] [rbp-1C8h]
  __int64_t v52; // [rsp+D8h] [rbp-1C0h]
  __int64_t v53; // [rsp+E0h] [rbp-1B8h]
  std::vector<int>::iterator *v54; // [rsp+E8h] [rbp-1B0h]
  std::basic_string<char,std::char_traits<char>,std::allocator<char> > *v55; // [rsp+F0h] [rbp-1A8h]
  std::basic_string<char,std::char_traits<char>,std::allocator<char> > *_Left; // [rsp+F8h] [rbp-1A0h]
  std::string::iterator *v57; // [rsp+100h] [rbp-198h]
  uint64_t v58; // [rsp+108h] [rbp-190h]
  std::vector<std::pair<int,int> >::iterator v59; // [rsp+110h] [rbp-188h]
  std::vector<std::pair<int,int> >::iterator v60; // [rsp+118h] [rbp-180h]
  std::vector<int>::iterator v61; // [rsp+120h] [rbp-178h]
  std::vector<int>::iterator v62; // [rsp+128h] [rbp-170h]
  std::vector<int>::iterator v63; // [rsp+130h] [rbp-168h]
  std::vector<int>::iterator v64; // [rsp+138h] [rbp-160h]
  std::vector<int>::iterator v65; // [rsp+140h] [rbp-158h]
  std::vector<int>::iterator v66; // [rsp+148h] [rbp-150h]
  std::vector<int>::iterator v67; // [rsp+150h] [rbp-148h]
  std::vector<int>::iterator v68; // [rsp+158h] [rbp-140h]
  std::string::iterator v69; // [rsp+160h] [rbp-138h]
  std::string::iterator v70; // [rsp+168h] [rbp-130h]
  std::string::iterator v71; // [rsp+170h] [rbp-128h]
  std::string::iterator v72; // [rsp+178h] [rbp-120h]
  std::pair<char, bool> v73; // [rsp+180h] [rbp-118h]
  std::pair<char, bool> v74; // [rsp+190h] [rbp-108h]
  std::pair<char, bool> v75; // [rsp+1A0h] [rbp-F8h]
  std::pair<char, bool> v76; // [rsp+1B0h] [rbp-E8h]
  std::pair<char, bool> v77; // [rsp+1C0h] [rbp-D8h]
  std::pair<char, bool> v78; // [rsp+1D0h] [rbp-C8h]
  std::pair<char, bool> v79; // [rsp+1E0h] [rbp-B8h]
  std::pair<char, bool> v80; // [rsp+1F0h] [rbp-A8h]
  std::pair<char, bool> v81; // [rsp+200h] [rbp-98h]
  std::pair<char, bool> v82; // [rsp+210h] [rbp-88h]
  std::basic_string<char,std::char_traits<char>,std::allocator<char> > _Str; // [rsp+220h] [rbp-78h]
  std::basic_string<char,std::char_traits<char>,std::allocator<char> > v84; // [rsp+240h] [rbp-58h]
  std::basic_string<char,std::char_traits<char>,std::allocator<char> > result; // [rsp+260h] [rbp-38h]

  v33 = 0;
  std::cout << "Input flag:";
  std::basic_ostream<char,std::char_traits<char>>::operator<<(v0, std::endl<char,std::char_traits<char>>);
  std::basic_string<char,std::char_traits<char>,std::allocator<char>>::basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
  std::operator>><char,std::char_traits<char>,std::allocator<char>>(&std::cin, &_Str);
  if ( std::basic_string<char,std::char_traits<char>,std::allocator<char>>::size(&_Str) == 70 )
  {
    v55 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::substr(&_Str, &result, 0i64, 5ui64);
    _Left = v55;
    v33 |= 1u;
    v38 = std::operator!=<char,std::char_traits<char>,std::allocator<char>>(v55, "0ops{")
       || (v3 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::size(&_Str),
           *std::basic_string<char,std::char_traits<char>,std::allocator<char>>::operator[](&_Str, v3 - 1) != 125);
    if ( v33 & 1 )
    {
      v33 &= 0xFFFFFFFE;
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&result);
    }
    if ( v38 )
    {
      v4 = std::operator<<<std::char_traits<char>>(&std::cout, "Format Error");
      std::basic_ostream<char,std::char_traits<char>>::operator<<(v4, std::endl<char,std::char_traits<char>>);
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
      v2 = 0i64;
    }
    else
    {
      v5 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::size(&_Str);
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::substr(&_Str, &v84, 5ui64, v5 - 6);
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::begin(&v84, &v39);
      while ( 1 )
      {
        v6 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::end(&v84, &v70);
        if ( !std::_String_const_iterator<std::_String_val<std::_Simple_types<char>>>::operator!=(&v39, v6) )
          break;
        if ( *std::_String_iterator<std::_String_val<std::_Simple_types<char>>>::operator*(&v39) < 48
          || *std::_String_iterator<std::_String_val<std::_Simple_types<char>>>::operator*(&v39) > 57 )
        {
          v7 = std::operator<<<std::char_traits<char>>(&std::cout, "Error");
          std::basic_ostream<char,std::char_traits<char>>::operator<<(v7, std::endl<char,std::char_traits<char>>);
          v41 = 0;
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&v84);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
          return v41;
        }
        std::_String_iterator<std::_String_val<std::_Simple_types<char>>>::operator++(&v39, &v69, 0);
      }
      std::vector<int,std::allocator<int>>::vector<int,std::allocator<int>>(&v37);
      v57 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::end(&v84, &v71);
      v8 = std::basic_string<char,std::char_traits<char>,std::allocator<char>>::begin(&v84, &v72);
      std::vector<int,std::allocator<int>>::assign<std::_String_iterator<std::_String_val<std::_Simple_types<char>>>,0>(
        &v37,
        (std::string::iterator)v8->_Ptr,
        (std::string::iterator)v57->_Ptr);
      for ( i = 0; ; ++i )
      {
        v58 = i;
        v9 = std::vector<int,std::allocator<int>>::size(&v37);
        if ( v58 >= v9 )
          break;
        v48 = std::vector<int,std::allocator<int>>::operator[](&v37, i);
        *v48 -= 48;
      }
      std::vector<std::pair<int,int>,std::allocator<std::pair<int,int>>>::begin(&oriBoardMap, &v40);
      while ( 1 )
      {
        v10 = std::vector<std::pair<int,int>,std::allocator<std::pair<int,int>>>::end(&oriBoardMap, &v60);
        if ( !std::_Vector_const_iterator<std::_Vector_val<std::_Simple_types<std::pair<int,int>>>>::operator!=(
                &v40,
                v10) )
          break;
        _Off = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<std::pair<int,int>>>>::operator*(&v40)->first;
        v11 = std::vector<int,std::allocator<int>>::begin(&v37, &v61);
        _Where._Ptr = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<int>>>::operator+(v11, &v62, _Off)->_Ptr;
        v12 = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<std::pair<int,int>>>>::operator*(&v40);
        std::vector<int,std::allocator<int>>::insert(&v37, &v63, _Where, &v12->second);
        std::_Vector_iterator<std::_Vector_val<std::_Simple_types<std::pair<int,int>>>>::operator++(&v40, &v59, 0);
      }
      for ( j = 0; j < 9; ++j )
      {
        v52 = 9 * j;
        v13 = std::vector<int,std::allocator<int>>::begin(&v37, &v64);
        v14 = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<int>>>::operator+(v13, &v65, v52);
        v54 = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<int>>>::operator+(v14, &v66, 9i64);
        v53 = 9 * j;
        v15 = std::vector<int,std::allocator<int>>::begin(&v37, &v67);
        v16 = std::_Vector_iterator<std::_Vector_val<std::_Simple_types<int>>>::operator+(v15, &v68, v53);
        std::set<char,std::less<char>,std::allocator<char>>::set<char,std::less<char>,std::allocator<char>>(
          &v49,
          (std::vector<int>::iterator)v16->_Ptr,
          (std::vector<int>::iterator)v54->_Ptr);
        std::set<char,std::less<char>,std::allocator<char>>::set<char,std::less<char>,std::allocator<char>>(&v47);
        std::set<char,std::less<char>,std::allocator<char>>::set<char,std::less<char>,std::allocator<char>>(&v36);
        for ( k = 0; k < 9; ++k )
        {
          _Val = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, j + 9 * k);
          std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v47, &v73, &_Val);
        }
        v42 = 27 * (j / 3);
        v21 = 3 * (j % 3) + 27 * (j / 3);
        v24 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v74, &v24);
        v25 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 1);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v75, &v25);
        v26 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 2);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v76, &v26);
        v27 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 9);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v77, &v27);
        v28 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 10);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v78, &v28);
        v29 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 11);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v79, &v29);
        v30 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 18);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v80, &v30);
        v31 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 19);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v81, &v31);
        v32 = *(_BYTE *)std::vector<int,std::allocator<int>>::operator[](&v37, v21 + 20);
        std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::insert<0,0>(&v36, &v82, &v32);
        if ( std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::size(&v49) != 9 )
        {
          v17 = std::operator<<<std::char_traits<char>>(&std::cout, "Error");
          std::basic_ostream<char,std::char_traits<char>>::operator<<(v17, std::endl<char,std::char_traits<char>>);
          v43 = 0;
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v36);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v47);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v49);
          std::vector<int,std::allocator<int>>::~vector<int,std::allocator<int>>(&v37);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&v84);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
          return v43;
        }
        if ( std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::size(&v47) != 9 )
        {
          v18 = std::operator<<<std::char_traits<char>>(&std::cout, "Error");
          std::basic_ostream<char,std::char_traits<char>>::operator<<(v18, std::endl<char,std::char_traits<char>>);
          v44 = 0;
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v36);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v47);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v49);
          std::vector<int,std::allocator<int>>::~vector<int,std::allocator<int>>(&v37);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&v84);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
          return v44;
        }
        if ( std::_Tree<std::_Tset_traits<char,std::less<char>,std::allocator<char>,0>>::size(&v36) != 9 )
        {
          v19 = std::operator<<<std::char_traits<char>>(&std::cout, "Error");
          std::basic_ostream<char,std::char_traits<char>>::operator<<(v19, std::endl<char,std::char_traits<char>>);
          v45 = 0;
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v36);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v47);
          std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v49);
          std::vector<int,std::allocator<int>>::~vector<int,std::allocator<int>>(&v37);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&v84);
          std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
          return v45;
        }
        std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v36);
        std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v47);
        std::set<char,std::less<char>,std::allocator<char>>::~set<char,std::less<char>,std::allocator<char>>(&v49);
      }
      v20 = std::operator<<<std::char_traits<char>>(&std::cout, "Correct");
      std::basic_ostream<char,std::char_traits<char>>::operator<<(v20, std::endl<char,std::char_traits<char>>);
      v46 = 0;
      std::vector<int,std::allocator<int>>::~vector<int,std::allocator<int>>(&v37);
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&v84);
      std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
      v2 = v46;
    }
  }
  else
  {
    v1 = std::operator<<<std::char_traits<char>>(&std::cout, "Length Error");
    std::basic_ostream<char,std::char_traits<char>>::operator<<(v1, std::endl<char,std::char_traits<char>>);
    std::basic_string<char,std::char_traits<char>,std::allocator<char>>::~basic_string<char,std::char_traits<char>,std::allocator<char>>(&_Str);
    v2 = 0i64;
  }
  return v2;
}