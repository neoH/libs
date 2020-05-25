// ******************************************************************************************
// File         : main.cpp
// Author       : RyanHunter
// Creating Date: Mon May 25 08:28:01 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef main__cpp
#define main__cpp

#include "rharr.h"

#include <iostream>

using namespace std;

int main (int argc, char *argv[])
{

	rharr <int> arr(20);

	cout << "arr.msize(): " << arr.msize() << endl;

	arr.push(3);
	arr.push(4);
	arr.push(5);
	arr.push(6);

	cout << "current size: " << arr.size() << endl;
	cout << "arr.pop: " << *arr.pop() << endl;
	cout << "current size: " << arr.size() << endl;
	cout << "arr.pop: " << *arr.pop() << endl;
	cout << "current size: " << arr.size() << endl;
	cout << "arr.pop: " << *arr.pop() << endl;
	cout << "current size: " << arr.size() << endl;
	cout << "arr.pop: " << *arr.pop() << endl;
	cout << "current size: " << arr.size() << endl;

	return 0;
}


#endif
