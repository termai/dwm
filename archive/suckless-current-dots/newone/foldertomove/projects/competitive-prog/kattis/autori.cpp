#include <bits/stdc++.h>
using namespace std;


int main() {

  string a;

  cin >> a;

  char rhyphen = '-';
  char spaces  = ' '; 
  string blanks = "";
  replace(a.begin(), a.end(), rhyphen, spaces);

  for(int i = 0; i < a.length(); i++) {
    if(a[i] == " ") {

      blanks.push_back(a[i]);
    
    }

  }

  cout << a << "\n";
}
