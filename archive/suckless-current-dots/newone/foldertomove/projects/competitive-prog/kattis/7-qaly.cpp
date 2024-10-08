#include <bits/stdc++.h>
using namespace std;

int main() {

  int n;

  cin >> n;
  
  float qaly = 0.0;

  for(int i = 0; i < n; i++) {

    float q,y;

    cin >> q >> y;

    qaly = qaly + (q * y);
  }

  cout << qaly << "\n";
  return 0;

}
