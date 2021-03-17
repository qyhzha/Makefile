#include <stdio.h>

void func(void)
{
	printf("%s,%d", __func__, __LINE__);
}