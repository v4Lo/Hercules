// Copyright (c) Athena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

#define HERCULES_CORE

#include "random.h"

#include "common/cbasetypes.h" // for WIN32
#include "common/showmsg.h"
#include "common/timer.h" // gettick

#include <mt19937ar/mt19937ar.h> // init_genrand, genrand_int32, genrand_res53

#if defined(WIN32)
#	include "common/winapi.h"
#elif defined(HAVE_GETPID) || defined(HAVE_GETTID)
#	include <sys/types.h>
#	include <unistd.h>
#endif

// http://www.concentric.net/~Ttwang/tech/inthash.htm
unsigned long mix(unsigned long a, unsigned long b, unsigned long c)
{
	a = a - b;  a = a - c;  a = a ^ (c >> 13);
	b = b - c;  b = b - a;  b = b ^ (a << 8);
	c = c - a;  c = c - b;  c = c ^ (b >> 13);
	a = a - b;  a = a - c;  a = a ^ (c >> 12);
	b = b - c;  b = b - a;  b = b ^ (a << 16);
	c = c - a;  c = c - b;  c = c ^ (b >> 5);
	a = a - b;  a = a - c;  a = a ^ (c >> 3);
	b = b - c;  b = b - a;  b = b ^ (a << 10);
	c = c - a;  c = c - b;  c = c ^ (b >> 15);
	return c;
}

/// Initializes the random number generator with an appropriate seed.
void rnd_init(void)
{
	unsigned long pid = 0;
	//unsigned long tid;
#if defined(WIN32)
	pid = (unsigned long)GetCurrentProcessId();
	//tid = (unsigned long)GetCurrentThreadId();
#else
#if defined(HAVE_GETPID)
	pid = (unsigned long)getpid();
#endif // HAVE_GETPID
#if defined(HAVE_GETTID)
	//tid = (unsigned long)gettid();
#endif // HAVE_GETTID
#endif
	init_genrand(mix(clock(), (unsigned long)time(NULL), pid));
}


/// Initializes the random number generator.
void rnd_seed(uint32 seed)
{
	init_genrand(seed);
}


/// Generates a random number in the interval [0, SINT32_MAX]
int32 rnd(void)
{
	return (int32)genrand_int31();
}


/// Generates a random number in the interval [0, dice_faces)
/// NOTE: interval is open ended, so dice_faces is excluded (unless it's 0)
uint32 rnd_roll(uint32 dice_faces)
{
	return (uint32)(rnd_uniform()*dice_faces);
}


/// Generates a random number in the interval [min, max]
/// Returns min if range is invalid.
int32 rnd_value(int32 min, int32 max)
{
	if( min >= max )
		return min;
	return min + (int32)(rnd_uniform()*(max-min+1));
}


/// Generates a random number in the interval [0.0, 1.0)
/// NOTE: interval is open ended, so 1.0 is excluded
double rnd_uniform(void)
{
	return ((uint32)genrand_int32())*(1.0/4294967296.0);// divided by 2^32
}


/// Generates a random number in the interval [0.0, 1.0) with 53-bit resolution
/// NOTE: interval is open ended, so 1.0 is excluded
/// NOTE: 53 bits is the maximum precision of a double
double rnd_uniform53(void)
{
	return genrand_res53();
}
