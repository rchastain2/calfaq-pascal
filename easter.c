
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "calfaq.h" /* https://www.tondering.dk/download/calfaq.zip */

int current_year()
{
  time_t t = time(NULL);
  struct tm stm = *localtime(&t);
  return stm.tm_year + 1900;
}

int main(int argc, char *argv[])
{
  int year, month, day;
  int jdn;
  
  if (argc == 1)
  {
    year = current_year();
  }
  else
  {
    year = atoi(argv[1]);
  }
  
  easter(GREGORIAN, year, &month, &day);
  
  printf("Easter %d in Gregorian calendar: month %d day %d\n", year, month, day);
  
  return 0;
}
