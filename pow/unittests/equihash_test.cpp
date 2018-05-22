#include "core/common.h"
#include <iostream>

int main()
{
    uint8_t pInput[] = {1, 2, 3, 4, 56};

	beam::Block::PoW pow;
	pow.m_Difficulty = 0; // d=0, runtime ~48 sec. d=1,2 - almost close to this. d=4 - runtime 4 miuntes, several cycles until solution is achieved.
	pow.m_Nonce = 0x010204U;
	pow.Solve(pInput, sizeof(pInput));

    if (!pow.IsValid(pInput, sizeof(pInput)))
		return -1;

    std::cout << "Solution is correct\n";
    return 0;
}