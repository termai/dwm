#include <bits/stdc++.h>
#include <string>
using namespace std;

int main() {
    int intone;
    cin >> intone;

    int check = 0;

    for (int i = 0; i < intone; i++) {

      int one, two, three;
      cin >> one >> two >> three;

      int sum = one + two + three;

      if (sum >= 2) {

        check++;

      }

    }
    cout << check << "\n";
    return 0;
}
