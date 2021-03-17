#include <stdio.h>

void func(void)
{
	printf("[%s,%d]Hello World.", __func__, __LINE__);
}