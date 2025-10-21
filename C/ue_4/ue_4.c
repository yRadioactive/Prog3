#include <stdio.h>

int main(){
    printf("Which unit should be converted?\n");
    char unit;
    int value;
    scanf(" %c%d",&unit,&value);
    
    switch (unit){
    case 'm' :
        value*=60;
        break;    
    case 'h' :
        value*=60*60;
        break;
    case 'd' :
        value*=60*60*24;
        break;
    case 'w' :
        value*=60*60*24*7;
        break;    
    case 'y' :
        value*=60*60*24*365;
        break;
    default:
        printf("wrong unit");
        return 1;
    }

    printf("%d", value);



    return 0;
}
