#include "types.h"
#include "stat.h"
#include "user.h"



int main(int argc, char* argv[]){


    int x= 0;
    int y = open("/ram/file.txt",0x202);
    while(x<8192){
      write(y,"e",1);
       x++;   
    }
    char *buf = malloc(4096);
    int z = 0;
    while(z<4096){
        buf[z]='e';
        if(z==4094){
            buf[z]='z';
        }
         if(z==4095){
            buf[z]='\n';
        }
        z++;
    }
    write(y,buf,4096);
   close(y);
    exit();
}
