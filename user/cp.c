#include "types.h"
#include "stat.h"
#include "user.h"


void
cp(int fd, int fd2, int fsize)
{
  int n;
  char* buf = malloc(8192);
  while((n = read(fd, buf, 8192)) > 0){
    write(fd2, buf, n);
   
  }
  free(buf);
}

int
main(int argc, char *argv[])
{
  int fd, fd2;

  if(argc < 3){
    printf(1, "usage: <source> <dest>\n");
    exit();
  }

    struct stat stat1;
    
    if((fd = open(argv[1], 0)) < 0){
      printf(1, "Source file does not exist.\n", argv[1]);
      exit();
    }
    stat(argv[2],&stat1);
    
    if(stat1.type==1){
      printf(1, "Destination may not be a directory.\n");
      exit();
    }
    if((fd2 = open(argv[2], 0X202)) < 0){
      printf(1, "cp: cannot open %s\n", argv[2]);
      exit();
    }
    
    
    int n;
  char* buf = malloc(8192);
  while((n = read(fd, buf, 8192)) > 0){
    write(fd2, buf, n);
 
  }
  free(buf);
    close(fd);
    close(fd2);
  exit();
}
