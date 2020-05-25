// ******************************************************************************************
// File         : rhstr.cpp
// Author       : RyanHunter
// Creating Date: Sat May 23 04:37:49 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef rhstr__cpp
#define rhstr__cpp


#include "rhstr.h"



void rhstr::_Patparse(char *pP)
{
	
	int i = 0;
	while (*(pP+i) != '\0')
	{
		switch (*(pP+i))
		{
			case '\\':
				// specify the \w, \W, ...
				i++; // check next char of pattern
				switch (*(pP+i))
				{
					case 'w';
					break;
					case 'W';
					break;
				}
			break;
		}
	}

}



#endif
