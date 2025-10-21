#include <stdio.h>
#include <string.h>



void rgb(int r, int g, int b){
    printf("#%x%x%x\n",r,g,b);
}

char* encrypt(char* a,unsigned char b){
 int size = strlen(a);
 for (int i = 0; i < size; i++){
    a[i] = a[i] ^ b;
 }
 return a;
}


int main (){
    //1.
    for (int i = 32; i <= 255; i++){        
        if (i%2 == 0){
            printf("%c : %d ; %o ; %x \t | \t ~*~*~*~*~  \n",i,i,i,i );
        }
        else{
             printf("%c : %d ; %o ; %x \t | \t *~*~*~*~*  \n",i,i,i,i );  
        }               
    }
    
    printf("___________________________________________________________________________\n");
    
    //2.
    //Wie bei gets ist es sehr gefährlich, scanf zum Lesen von vom Benutzer eingegebenen Zeichenfolgen zu verwenden ,
    //da scanf die Länge der eingegebenen Zeichenfolgen nicht beachtet und eine Zeichenfolge zulässt,
    //die länger ist als die für das Array definierte Größe, in dem diese Zeichenfolge gespeichert werden soll.
    // = ***wrong use can lead to buffer overflow***
    // safe alternatives : fgets()

    //3.
    printf("Enter the RGB numbers [0-255]\n");

    int r,g,b;
    scanf("%d%d%d", &r, &g, &b);
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
        printf("Error: RGB values must be between 0 and 255.\n");
        return 1;
    }
    rgb(r,g,b);

    printf("___________________________________________________________________________\n");

    //4.
    char eingabe[256];
    int key;
    printf("First String then key:\n");
    if (scanf("%255s %d", eingabe, &key) != 2) {
        printf(  "Invalid input: expected a string and an integer\n");
        return 1;
    }
    

    if (key < 0 || key > 255) {
        printf("Key must be 0..255\n");
        return 1;
    }

//    printf("\t%s %d\n", eingabe, key);

    char* encrypt_i = encrypt(eingabe,key);
    printf("%s\n",encrypt_i );
    
    char* decrypt_o = encrypt(encrypt_i,key);
    printf("%s\n",decrypt_o );
    
    
    
    return 0;
}


