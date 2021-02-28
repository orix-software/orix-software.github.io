# Write a file

```c
#include <stdio.h>

static unsigned char buffer[4000];

int main() {
  FILE* fp;

  unsigned int nb_write;
  static unsigned char destfilename[9]="myfile.txt";    

  fp = fopen(destfilename, "wb");
  if (!fp) {
    printf("Can't create output file\n");
    return 1;
  }
  nb_write=fwrite(buffer, 1, 4000, fp);
  fclose(fp);
}        
```
