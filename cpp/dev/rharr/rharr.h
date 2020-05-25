// ******************************************************************************************
// File         : rharr.h
// Author       : RyanHunter
// Creating Date: Mon May 25 08:27:43 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef rharr__h
#define rharr__h

#include <stdint.h>
#include <iostream>

using namespace std;

template <class T>
class rharr
{

	private:
		T **_arr;
		uint32_t _size;
		uint32_t _idx;

	public:
		rharr(uint32_t s = 10)
		{
			_arr = new T*[s];
			_size = s;
			_idx = 0;
		}

		uint32_t msize();
		uint32_t size();
		bool push(T i);
		T *pop();
		~rharr()
		{
			for (int i=0;i<_size;i++)
			{
				delete _arr[i]; // delete the address of item
			}
			delete _arr; // delete the array container
		}
		void del(int i = -1); // to delete the corresponding item, or whole array
};

template <class T>
void rharr<T>::del(int i)
{
	if (i == -1)
	{
		// delete whole item, which is to delete all items in the array
		//
		for (int loop=0;loop<_size;loop++)
		{
			delete _arr[loop];
		}
		_idx = 0;
	} else {
		delete _arr[i];
		for (int loop=i;loop<_size-1;loop++)
		{
			_arr[loop] = _arr[loop+1];
		}
		_idx--; // delete one item
	}

	return;
}

template <class T>
uint32_t rharr<T>::msize()
{
	return _size;
}

template <class T>
uint32_t rharr<T>::size()
{
	return _idx;
}

template <class T>
bool rharr<T>::push(T i)
{
	T *iP = new T;
	*iP = i;

	if (_idx >= _size)
	{
		cout << "ERROR: index larger than size !" << endl;
		return false;
	}

	_arr[_idx] = iP;
	_idx++;
}

template <class T>
T *rharr<T>::pop()
{
	if (_size != 0)
	{
		T *i = _arr[0];

		// delete one index
		for (int loop=0;loop < _size-1;loop++)
		{
			_arr[loop] = _arr[loop+1];
		}
		//delete _arr[_size-1];  // delete the last item address of T
		// delete &_arr[_size-1]; // delete the last index address
		// do not change the size
		_idx--;
		return i;
	}
}



#endif
