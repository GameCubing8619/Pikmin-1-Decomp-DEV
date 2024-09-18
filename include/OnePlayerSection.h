#ifndef _ONEPLAYERSECTION_H
#define _ONEPLAYERSECTION_H

#include "types.h"
#include "Section.h"

struct CmdStream;

/*
 * @brief TODO
 *
 * @note Size: 0x25C.
 */
struct FlowController {
	void readMapList(char*);

	// unused/inlined:
	void setStage(char*);

	// TODO: members
	u8 _00[0x244];          // _00, unknown
	int _244;               // _244
	u8 _248[0x24C - 0x248]; // _248, unknown
	u32 _24C;               // _24C, unknown
	u32 _250;               // _250, unknown
	u8 _254[0x25C - 0x254]; // _254, unknown
};

/**
 * @brief TODO
 */
struct StageInfo : public CoreNode {
	virtual void read(RandomAccessStream&); // _0C

	void parseGenerators(CmdStream*);

	// unused/inlined:
	void write(RandomAccessStream&);

	// _00     = VTBL
	// _00-_14 = CoreNode
	// TODO: members
};

/**
 * @brief TODO
 */
struct OnePlayerSection : public Section {
	virtual void init(); // _30

	// _00     = VTBL
	// _00-_20 = Section?
	// TODO: members
};

extern FlowController flowCont;

#endif