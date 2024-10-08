#include <bits/stdc++.h>
using namespace std;

int main() {

  int m[5][5];
  int sum = 0;
  for(int i = 0; i < 5; i++) {
      for(int t = 0; t < 5; t++) {
          
          cin >> m[i][t];
          
          if (m[i][t] == 1) {
              
              sum =  abs(i - 2) + abs(t-2);
          }
      }
  }
    
    cout << sum;
    return 0;
}
