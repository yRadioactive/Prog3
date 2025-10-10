#include <stdio.h> 
#include <limits.h>

int main(){
    
    int a=INT_MAX;
    printf("%d\n",a);
    short b = SHRT_MAX;
    printf("%d\n",b );
    long c = LONG_MAX;
    printf("%ld\n",c);
    long long d = LONG_LONG_MAX;
    printf("%lld\n",d);
    char e = CHAR_MAX;
    printf("%d\n",e);
    /*
        double g =__SIZEOF_DOUBLE__;
        printf("%lf\n",g);
        float f = __SIZEOF_FLOAT__;
        printf("%f\n",f);
    */

    
    
    return 0;
}