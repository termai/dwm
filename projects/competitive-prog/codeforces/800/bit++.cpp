#include <bits/stdc++.h>
using namespace std;

int main() {
  int n;
  string var;
  cin >> n;
  int count = 0;

  for(int i = 0; i < n; i++){

    cin >> var;

    if (var == "++X" || var == "X++") {
      count += 1;

    } else {

      count -= 1;
    
    }

  }

  cout << count << "\n";
}
