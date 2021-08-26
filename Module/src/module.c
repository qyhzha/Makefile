#include <stdio.h>

void module(void)
{
	printf("func = %s\r\n", __func__);
}