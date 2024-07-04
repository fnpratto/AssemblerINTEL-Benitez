/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

	Replace the "return" statement in each function with one
	or more lines of C code that implements the function. Your code
	must conform to the following style:

	int Funct(arg1, arg2, ...) {
			/* brief description of how your implementation works */
			int var1 = Expr1;
			...
			int varM = ExprM;

			varJ = ExprJ;
			...
			varN = ExprN;
			return ExprR;
	}

	Each "Expr" is an expression using ONLY the following:
	1. Integer constants 0 through 255 (0xFF), inclusive. You are
			not allowed to use big constants such as 0xffffffff.
	2. Function arguments and local variables (no global variables).
	3. Unary integer operations ! ~
	4. Binary integer operations & ^ | + << >>

	Some of the problems restrict the set of allowed operators even further.
	Each "Expr" may consist of multiple operators. You are not restricted to
	one operator per line.

	You are expressly forbidden to:
	1. Use any control constructs such as if, do, while, for, switch, etc.
	2. Define or use any macros.
	3. Define any additional functions in this file.
	4. Call any functions.
	5. Use any other operations, such as &&, ||, -, or ?:
	6. Use any form of casting.
	7. Use any data type other than int.  This implies that you
		 cannot use arrays, structs, or unions.


	You may assume that your machine:
	1. Uses 2s complement, 32-bit representations of integers.
	2. Performs right shifts arithmetically.
	3. Has unpredictable behavior when shifting if the shift amount
		 is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
	/*
	 * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
	 */
	int pow2plus1(int x) {
		 /* exploit ability of shifts to compute powers of 2 */
		 return (1 << x) + 1;
	}

	/*
	 * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
	 */
	int pow2plus4(int x) {
		 /* exploit ability of shifts to compute powers of 2 */
		 int result = (1 << x);
		 result += 4;
		 return result;
	}

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
	1. Define or use any macros.
	2. Define any additional functions in this file.
	3. Call any functions.
	4. Use any form of casting.
	5. Use any data type other than int or unsigned.  This means that you
		 cannot use arrays, structs, or unions.
	6. Use any floating point data types, operations, or constants.


NOTES:
	1. Use the dlc (data lab checker) compiler (described in the handout) to
		 check the legality of your solutions.
	2. Each function has a maximum number of operations (integer, logical,
		 or comparison) that you are allowed to use for your implementation
		 of the function.  The max operator count is checked by dlc.
		 Note that assignment ('=') is not counted; you may use as many of
		 these as you want without penalty.
	3. Use the btest test harness to check your functions for correctness.
	4. Use the BDD checker to formally verify your functions
	5. The maximum number of ops for each function is given in the
		 header comment for each function. If there are any inconsistencies
		 between the maximum ops in the writeup and in this file, consider
		 this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce
 *      the correct answers.
 */

#endif
/* Copyright (C) 1991-2020 Free Software Foundation, Inc.
	 This file is part of the GNU C Library.

	 The GNU C Library is free software; you can redistribute it and/or
	 modify it under the terms of the GNU Lesser General Public
	 License as published by the Free Software Foundation; either
	 version 2.1 of the License, or (at your option) any later version.

	 The GNU C Library is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	 Lesser General Public License for more details.

	 You should have received a copy of the GNU Lesser General Public
	 License along with the GNU C Library; if not, see
	 <https://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
	 include it implicitly at the start of every compilation.  It must
	 not itself include <features.h> or any other header that includes
	 <features.h> because the implicit include comes before any feature
	 test macros that may be defined in a source file before it first
	 explicitly includes a system header.  GCC knows the name of this
	 header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
	 and complex.  If the GCC (4.9 and later) predefined macros
	 specifying compiler intent are available, use them to determine
	 whether the overall intent is to support these features; otherwise,
	 presume an older compiler has intent to support these features and
	 define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
	 synchronized with ISO/IEC 10646:2017, fifth edition, plus
	 the following additions from Amendment 1 to the fifth edition:
	 - 56 emoji characters
	 - 285 hentaigana
	 - 3 additional Zanabazar Square characters */
//1
/* 
 * anyOddBit - return 1 if any odd-numbered bit in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples anyOddBit(0x5) = 0, anyOddBit(0x7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int anyOddBit(int x) {
	int mask = 0xaa;
	mask = mask | (mask << 8);
	mask = mask | (mask << 16);
	return !!(mask & x);
}
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) {
	int tmin = x + 0x1; // tmax + 1 = tmin
	int is_tmin = !(tmin ^ (~tmin + 0x1));
	int is_umax = !(~x);
	return is_tmin & !is_umax;
}
/*
 * isTmin - returns 1 if x is the minimum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmin(int x) {
	int is_tmin = !(x ^ (~x + 0x1)); // 0x1 if x = tmin
	int is_zero = !x;
	return is_tmin & !is_zero;
}
/*
 * isZero - returns 1 if x == 0, and 0 otherwise 
 *   Examples: isZero(5) = 0, isZero(0) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 2
 *   Rating: 1
 */
int isZero(int x) {
	return !x;
}
/* 
 * oddBits - return word with all odd-numbered bits set to 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 2
 */
int oddBits(void) {
	int res = 0xaa;
	res = res | (res << 8);
	res = res | (res << 16);
	return res;
}
//2
/* 
 * allEvenBits - return 1 if all even-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allEvenBits(0xFFFFFFFE) = 0, allEvenBits(0x55555555) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allEvenBits(int x) {
	int mask = 0x55;
	mask = mask | (mask << 8);
	mask = mask | (mask << 16);
	return !((mask & x) ^ mask);
}
/* 
 * anyEvenBit - return 1 if any even-numbered bit in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples anyEvenBit(0xA) = 0, anyEvenBit(0xE) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int anyEvenBit(int x) {
	int mask = 0x55;
	mask = mask | (mask << 8);
	mask = mask | (mask << 16);
	return !!(mask & x);
}
/* 
 * copyLSB - set all bits of result to least significant bit of x
 *   Example: copyLSB(5) = 0xFFFFFFFF, copyLSB(6) = 0x00000000
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int copyLSB(int x) {
	return (x << 31) >> 31;
}
/* 
 * isEqual - return 1 if x == y, and 0 otherwise 
 *   Examples: isEqual(5,5) = 1, isEqual(4,5) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int isEqual(int x, int y) {
	return !(x ^ y);
}
/* 
 * isNotEqual - return 0 if x == y, and 1 otherwise 
 *   Examples: isNotEqual(5,5) = 0, isNotEqual(4,5) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int isNotEqual(int x, int y) {
	return !!(x ^ y);
}
/* 
 * leastBitPos - return a mask that marks the position of the
 *               least significant 1 bit. If x == 0, return 0
 *   Example: leastBitPos(96) = 0x20
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2 
 */
int leastBitPos(int x) {
	int x_neg = ~x + 1;
	return x_neg & x;
}
/* 
 * sign - return 1 if positive, 0 if zero, and -1 if negative
 *  Examples: sign(130) = 1
 *            sign(-23) = -1
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 10
 *  Rating: 2
 */
int sign(int x) {
	int var = (x >> 31) << 1;
	return var | (!!x);
}
//3
/* 
 * isLess - if x < y  then return 1, else return 0 
 *   Example: isLess(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLess(int x, int y) {
	int sign_x = (x >> 31) & 0x1;
	int sign_y = (y >> 31) & 0x1;
	int dif_sign = sign_x ^ sign_y;
	int x_less_sign = dif_sign & sign_x;
	int y_less_sign = dif_sign & sign_y;

	int dif = y + (~x + 1);
	int positive_dif = !(dif >> 31 & 0x1);
	int x_is_less = x_less_sign | positive_dif;

	int equals = !(x ^ y);
	
	return (!y_less_sign) & (!equals) & x_is_less;
}
/* 
 * isNegative - return 1 if x < 0, return 0 otherwise 
 *   Example: isNegative(-1) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int isNegative(int x) {
	return (x >> 31) & 1;
}
/* 
 * rotateLeft - Rotate x to the left by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateLeft(0x87654321,4) = 0x76543218
 *   Legal ops: ~ & ^ | + << >> !
 *   Max ops: 25
 *   Rating: 3 
 */
int rotateLeft(int x, int n) {
	int shift = x << n;
	int left_mask = ~0 << n;
	int left_part = left_mask & shift;

	int right_mask = ((1 << 31) >> n) << 1;
	int right_part = right_mask & x;
	right_part = (right_part >> (33 + ~n)) & ~left_mask;

	return left_part | right_part;
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
	int arit_shift = x >> n;
	int mask = (1 << 31) >> n;
	mask = mask << 1;
	return ~mask & arit_shift;
}
//4
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
	int mask, res;

	mask = 0x11 | (0x11 << 8);
	mask = mask | (mask << 16); // 00010001000100010001000100010001

	// grupos de 4
	res = x & mask;
	res = res + (mask & (x >> 1));
	res = res + (mask & (x >> 2));
	res = res + (mask & (x >> 3));

	// sumo con el grupo de 4 de "al lado"
	mask = 0x0f | 0x0f << 8; 
	mask = mask | mask << 16; // 00001111000011110000111100001111
	res = (mask & res) + (mask & (res >> 4));

	// sumo los dos grupos de 16;
	mask = 0xff | 0xff << 8; // 00000000000000001111111111111111
	res = (mask & res) + (mask & (res >> 16));

	// sumo con el grupo de 8 de al lado
	mask = 0xff | 0xff << 16; // 00000000111111110000000011111111
	res = (mask & res) + (mask & (res >> 8));

	return res;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
	int sign_x, res, bits_16, bits_8, bits_4, bits_2, bits_1, bits_0;

	sign_x = x >> 31;
	x = (sign_x & (~x)) | (~sign_x & x); // only positive

	res = 0x0;
	// x positive, msb = 0 and shift doesn't replicate 1's

	bits_16 = !!(x >> 16); // 1 if 16 bits
	bits_16 = bits_16 << 4; // bits_16 -> 16 or 0
	x = x >> bits_16; // bits_16 = 0/16

	bits_8 = !!(x >> 8);
	bits_8 = bits_8 << 3; // if bits_8 = 1 -> bits_8 = 8
	x = x >> bits_8;

	bits_4 = !!(x >> 4);
	bits_4 = bits_4 << 2;
	x = x >> bits_4; // bits_4 = 4 or 0

	bits_2 = !!(x >> 2);
	bits_2 = bits_2 << 1;
	x = x >> bits_2;

	bits_1 = !!(x >> 1);
	
	bits_0 = x >> bits_1;

	res = bits_16 + bits_8 + bits_4 + bits_2 + bits_1 + bits_0 + 1;

	return res;
}
/*
 * isPower2 - returns 1 if x is a power of 2, and 0 otherwise
 *   Examples: isPower2(5) = 0, isPower2(8) = 1, isPower2(0) = 0
 *   Note that no negative number is a power of 2.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int isPower2(int x) {
	int is_negative = (x >> 31) & 0x1;
	int var = x & (~x + 1); // if != x -> more than 1 bit
	int is_pow2 = !(x ^ var);
	int is_zero = !x;

	return is_pow2 & !is_negative & !is_zero;
}
/*
 * leftBitCount - returns count of number of consective 1's in
 *     left-hand (most significant) end of word.
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
int leftBitCount(int x) {
	int mask_one, res, mask, bits_16, bits_8, bits_4, bits_2, bits_1;

	x = ~x;
	mask_one = 1 << 31;
	res = 0x0;

	mask = ~(0xff | (0xff << 8));
	bits_16 = !(x & mask); // 1 if 16 bits
	bits_16 = (bits_16 << 4) ; //  bits_16 -> 16 or 0
	res += bits_16;

	mask = (mask_one >> (res + 8)) << 1;
	bits_8 = !(x & mask);
	bits_8 = bits_8 << 3; // if bits_8 = 1 -> bits_8 = 8
	res += bits_8;

	mask = (mask_one >> (res + 4)) << 1;
	bits_4 = !(x & mask);
	bits_4 = bits_4 << 2;
	res += bits_4;

	mask = (mask_one >> (res + 2)) << 1;
	bits_2 = !(x & mask);
	bits_2 = bits_2 << 1;
	res += bits_2;
	
	mask = (mask_one >> (res + 1)) << 1;
	bits_1 = !(x & mask);
	res += bits_1;

	return res + (!(x));
}
//float
/* 
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf) {
	int sign = (uf >> 31) & 0x1; // 1 bit
	int exp = (0xff & (uf >> 23)) - 127; // 8 bits
	int mask_mant = ~((1 << 31) >> 8); // 23 bits
	int mant = ((uf & mask_mant) | (0x1 << 23));

	if (exp > 31) return (0x1 << 31);
	if (exp < 0) return 0;

	if (exp > 23) {
		mant = mant << (exp - 23);
	} else {
		mant = mant >> (23 - exp);
	}

	return sign ? (~mant + 1) : mant;
}
/* 
 * floatUnsigned2Float - Return bit-level equivalent of expression (float) u
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */

unsigned floatUnsigned2Float(unsigned u) {
	int first_bit_pos, mask_mant, mant, aux, c, exp;
	int guard_bit, round_bit, sticky_bit;
	unsigned res;

	if (!u) return u;

	first_bit_pos = 31; // msb = 31
	while (!((1 << first_bit_pos) & u)) first_bit_pos--; // find first bit
	mask_mant = ~(~0 << first_bit_pos);
	mant = u & mask_mant;

	c = 0;

	if (first_bit_pos > 23) {
		aux = first_bit_pos - 23;
		// GRS
		guard_bit = mant & (1 << aux);
		round_bit = mant & (1 << (aux - 1));
		sticky_bit = mant << (33 - aux);
		mant = mant >> aux;
		if (round_bit) {
			c = sticky_bit || guard_bit;
		}
	} else {
		aux = 23 - first_bit_pos;
		mant = mant << aux;
	}

	exp = 127 + first_bit_pos;
	res = ((exp << 23) | mant) + c;
	
	return res;
}
/* 
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 * 
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while 
 *   Max ops: 30 
 *   Rating: 4
 */
unsigned floatPower2(int x) {
	int exp;
	if (x < 0) return 0;
	exp = 127 + x;
	if (exp > 0xff) return (0xff << 23);
	return (exp << 23);
}
/* 
 * floatScale64 - Return bit-level equivalent of expression 64*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 35
 *   Rating: 4
 */
unsigned floatScale64(unsigned uf) {
	int sign = (0x1 << 31) & uf;
	int shift_64 = 6; // x << 6 = x ^ 6 = 64

	int mask_ultimo_num_exp = 0x1 << 23;
	int mask_mant = (0x1 << 31) >> 8; 
	int mask_exp = 0xff << 23;

	while (shift_64--) {
		int exp = mask_exp & uf;
		if (exp) {
			if (exp != mask_exp) {
				uf += mask_ultimo_num_exp; // exp += 1
				exp = uf & mask_exp;
				if (exp == mask_exp) uf = uf & mask_mant; // exp = 0xff -> clean frac
			}
		} else { // desnorm. exp = 0x00
			uf <<= 1;
		}
	}
	
	return sign | uf;
}