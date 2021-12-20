#include <stdio.h>

int majorityElement(int num[], int n){
    int cnt = 1;
    int major = num[0];
    for(int i = 1; i < n; i++){
        if(num[i] == major) 
            cnt++;
        else if(cnt == 0){
            major = num[i];
            cnt = 1;
        }
        else
            cnt--;
    }
    return major;
}

int main(){
    int A[] = {1, 2, 2, 5, 2, 2, 4, 1, 2, 2};
    int ans = majorityElement(A, 10);
    printf("The majority element is %d\n", ans);
    return 0;
}