#include <bits/stdc++.h>
using namespace std;

int main() {

  string a,b;
  cin >> a;
  cin >> b;

  if (a.length() < b.length()) {
    cout << "-1" << "\n";
  } else if (b.length() < a.length()) {
    cout << "1" << "\n";
  } else {
    cout << "0" << "\n";

  }

}
