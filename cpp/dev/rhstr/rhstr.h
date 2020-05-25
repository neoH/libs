// ******************************************************************************************
// File         : rhstr.h
// Author       : RyanHunter
// Creating Date: Sat May 23 04:37:21 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef rhstr__h
#define rhstr__h

#include <stdint.h>
#include "rharr.h"

enum rhstr_pat_enum
{
	WILDS,
	WILDP,
	ONE
};

class rhstrPat
{

	public:
		rharr *num[];         // pattern for each Pos
		rhstr_pat_enum pat[]; // pattern type for each Pos

};

class rhstr
{
	private:
		char     *_str;
		uint32_t  _len;
		rhstrPat  _fpP;


	public:
		rhstr(const char *s);
		bool is_match(const char *s);


};





#endif
