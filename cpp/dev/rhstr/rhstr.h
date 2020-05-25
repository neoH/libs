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


class rhstr
{
	private:
		char      *m_str;
		uint32_t  m_len;


	public:
		rhstr(const char *s);
		rhstr(char *s);
		rhstr() {}
		//copy(rhstr s); // copy string item from another rhstr


};


rhstr::rhstr(const char *s) // {{{
{

	uint32_t len = 0;

	while (*(s+len) != '\0') {len++;}

	m_str = new char [len];
	m_len = len;



	// copy string to m_str
	len = 0;
	while (*(s+len) != 0)
	{
		*(m_str+len) = *(s+len);
		len++;
	}

} // }}}

rhstr::rhstr(char *s) // {{{
{
	uint32_t len = 0;

	while (*(s+len) != '\0') {len++;}

	m_str = new char [len];
	m_len = len;



	// copy string to m_str
	len = 0;
	while (*(s+len) != 0)
	{
		*(m_str+len) = *(s+len);
		len++;
	}

} // }}}




rhstr::rhstr(char *s)
{

}


#endif
