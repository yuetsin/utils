// 请在下方添加代码
/********** Begin *********/
#include <iostream>

using namespace std;
int main()
{
    int n, m;
    cin >> n >> m;
    // chic + rabb = n;
    //  2 * chic + 2 * rabb = 2 * n;
    //  2 * chic + 4 * rabb = m;

    int rabb = m / 2 - n, chic = n - rabb;

    if (rabb >= 0 && chic >= 0) {
        cout << chic << ' ' << rabb << endl;
    } else {
        cout << "无解" << endl;
    }

    return 0;
}
/********** End **********/
