#include <iostream>
#include <vector>
#include <set>
#include "map.h"

using namespace std;

// aliases:
// v84: _Content
// v37: _Vec
// _Str: _Str
// v40: _oriBoardMap
// v49: _Set

int main() {
    cout << "Input flag:" << endl;
    string _Str;
    cin >> _Str;

    string result;
    if (_Str.size() == 70) {
        // get first 5 chars
        string _Header = _Str.substr(0, 5);
        
        if (_Header != "0ops{") {
            cout << "Format Error" << endl;
            return -1;
        } else {
            int _Len = _Str.size();
            string _Content = _Str.substr(5, _Len - 6);

            for (auto _Iter = _Content.begin(); _Iter != _Content.end(); ++_Iter) {
                char _Char = *_Iter;
                // should be all digits
                if (_Char < 48 || _Char > 57) {
                    cout << "flag[5:-6] Char Validation " <<  "Error" << endl;
                    return -2;
                }
            }

            vector<int> _Vec;

            auto _End = _Content.end();
            auto _Begin = _Content.begin();
            
            _Vec.assign(_Begin, _End);
            for (int i = 0; i < _Vec.size(); ++i) {
                _Vec[i] -= 48;
            }

            // just a declaration
            vector<pair<int, int>> _oriBoardMap;
            for (auto iter = _oriBoardMap.begin(); iter != _oriBoardMap.end(); ++iter) {
                auto _Offset = iter->first;
                _Vec.insert(_Vec.begin() + _Offset, iter->second);
            }

            for (int j = 0; j < 9; ++j) {
                set<char> _Set49(_Vec.begin() + 9 * j, _Vec.begin() + 9 * (j + 1));

                set<char> _Set47;
                // construct _Set with _Vec[9 * j : 9 * (j + 1)]

                for (int k = 0; k < 9; ++k) {
                    auto _Val = (char)_Vec[j + 9 * k];
                    _Set47.insert(_Val);
                }

                auto _Idx = 3 * (j % 3) + 27 * (j / 3);

                _Set36.insert(_Vec[_Idx]);
                _Set36.insert(_Vec[_Idx + 1]);
                _Set36.insert(_Vec[_Idx + 2]);
                _Set36.insert(_Vec[_Idx + 9]);
                _Set36.insert(_Vec[_Idx + 10]);
                _Set36.insert(_Vec[_Idx + 11]);
                _Set36.insert(_Vec[_Idx + 18]);
                _Set36.insert(_Vec[_Idx + 19]);
                _Set36.insert(_Vec[_Idx + 20]);

                if (_Set36.size() != 9) {
                    cout << "_Set36 Size " << "Error" << endl;
                    cout << "get " << _Set36.size() <<", should be 9" << endl;
                    return -4;
                }

                if (_Set47.size() != 9) {
                    cout << "_Set47 Size " << "Error" << endl;
                    cout << "get " << _Set47.size() <<", should be 9" << endl;
                    return -5;
                }

                if (_Set49.size() != 9) {
                    cout << "_Set49 Size " << "Error" << endl;
                    cout << "get " << _Set49.size() <<", should be 9" << endl;
                    return -6;
                }

                cout << "Correct. And that's your flag." << endl;
                return 0;
            }
        }
    } else {
        cout << "Length Error" << endl;
        cout << "get " << _Str.size() <<", should be 70" << endl;
        return -3;
    }

    return 0;
}