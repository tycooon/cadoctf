#include <stdint.h>
#include <stdio.h>

typedef uint8_t undefined8;
typedef unsigned long int ulong;
typedef unsigned int uint;

int main(void) {
  int retval;
  int j;
  int i;
  long access_flag;
  uint mod [3];
  ulong rem [4];
  ulong n [4];
  ulong input [5];

  mod[0] = 0xab1cda1;
  mod[1] = 0x355f85;
  mod[2] = 0xbde3;
  n[0] = 0xa4d49c6a79ee87d4;
  n[1] = 0x2d3617313050bbca;
  n[2] = 0xd3fa380132ca2a76;
  access_flag = 0;

  printf("Enter key: ");
  scanf("%24lu",input);

  for(int x = 0; x < 5; x++) {
    printf("%lX\n", input[x]);
  }

  j = 0;
  do {
    if (2 < j) {
      if (access_flag == 0) {
        puts("Access granted.");
      }
      else {
        puts("Go away dirty hacker!");
      }
      retval = 0;
LAB_00101370:
      // if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
      //               /* WARNING: Subroutine does not return */
      //   __stack_chk_fail();
      // }
      return retval;
    }
    for (i = 0; i < 3; i = i + 1) {
      rem[i] = input[j] % (ulong)mod[i];
    }
    if ((rem[0] & 0x4000000) == 0) {
      puts("Go away dirty hacker!!!");
      retval = 0xffffffff;
      goto LAB_00101370;
    }

    access_flag = access_flag + (n[j] ^ (rem[0] << 0x26 | rem[1] << 0x10 | rem[2]));
    j = j + 1;
  } while(1);
}
