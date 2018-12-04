#include "stdafx.h"

extern "C" int IntegerMulDiv_(int a, int b, int* prod, int* quo, int* rem);

int _tmain(int argc, _TCHAR* argv[]) 
{
	int a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;
	int rc;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
}