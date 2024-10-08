#include <bits/stdc++.h>
using namespace std;

int main() {

  int n, h;
  int count = 0;
  cin >> n >> h;

  for(int i = 0; i < n; i++) {

    int friends;

    cin >> friends;

    if (friends > h) {
      count += 2;
    }
    else {
      count += 1;
    }

  }
  
  cout << count << "\n";
  return 0;

}
