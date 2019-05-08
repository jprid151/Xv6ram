#include "types.h"
#include "stat.h"
#include "user.h"



int main(int argc, char* argv[]){
    
  if(argc < 2){
    printf(2, "Usage: mrd <dirname>\n");
    exit();
  }
  int x = rammake(argv[1]);
  if(x==-2){
    printf(1,"mrd: There are already 3 ramdisks.\n");
    exit();
  }
  else if (x==-3){
    printf(1,"mrd: The disk already exists.\n");
    exit();
  }
  else{
    printf(1,"mrd: Ram drive mounted.\n");
  }
  exit();
}