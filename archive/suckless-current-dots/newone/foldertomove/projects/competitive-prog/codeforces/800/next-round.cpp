#include <iostream>

using namespace std;

int main()
{
    int n, k;
    int a[100];
    cin >> n >> k;
    int count = 0;
    
    for(int i = 0; i < n; i++) {
        
        cin >> a[i];
    } 
        
    int nextr = a[k -1];
    for(int i = 0; i < n; i++) {
      if(a[i] >= nextr && a[i] > 0) {

        count += 1;

      }
    }
    
    cout << count << "\n";


    return 0;
}
