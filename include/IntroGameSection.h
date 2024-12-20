#ifndef _INTROGAMESECTION_H
#define _INTROGAMESECTION_H

#include "types.h"
#include "Section.h"

/**
 * @brief TODO
 *
 * @note Size: 0x20.
 */
struct IntroGameSection : public Section {
	IntroGameSection();

	virtual void init(); // _30 (weak)

	// _00     = VTBL
	// _00-_20 = Section
};

/**
 * @brief TODO
 */
struct IntroGameSetupSection : public BaseGameSection {
	virtual void update();        // _10
	virtual void draw(Graphics&); // _14

	// _00     = VTBL
	// _00-_44 = BaseGameSection
	// TODO: members
};

#endif
