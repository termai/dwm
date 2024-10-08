#include <bits/stdc++.h>
using namespace std;

int main() {

  int n;
  string words[100];
  cin >> n;

  for(int i = 0; i < n; i++ ) {

    cin >> words[i]; 
    
  }

  for(int t = 0; t < n; t++ ) {
    
    if(words[t].length() >= 10){
      char firstL = words[t][0];
      char lastL = words[t][words[t].length() -1];
      int nums = words[t].length() - 2;
      cout << firstL << nums << lastL << "\n";
    } else {

      cout << words[t] << "\n";
    }


  }

}
