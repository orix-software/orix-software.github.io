# Samples in C

```c

#include <stdio.h>

unsigned char chars[255];

main (){
 fp=fopen("/myfile","r");
  if (fp==NULL)
  {
    printf("Can't open %s\n",argv[1]);
    return (1);
  }   
        
  nb=fread(chars,255,1,fp);
  fclose(fp);
}

```

