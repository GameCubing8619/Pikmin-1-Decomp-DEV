#ifndef _HMRUMBLE_H
#define _HMRUMBLE_H

#include "types.h"

struct Vector3f;

/*
 * @brief TODO
 */
struct RumbleSample {
	RumbleSample(int);

	void simpleStop();
	void simpleStart(f32);

	// unused/inlined:
	void init();

	f32 _00;      // _00
	f32 _04;      // _04
	int mChannel; // _08
};

/*
 * @brief TODO
 */
struct ChannelDataMgr {
	ChannelDataMgr(); // unused/inlined

	// unused/inlined:
	void init();
	void getChannelDataTbl(int);

	// TODO: members
};

/*
 * @brief TODO
 */
struct ChannelMgr {
	ChannelMgr();

	void start(int, f32*);
	void update();

	// unused/inlined:
	void init(ChannelDataMgr*);
	void reset();

	// TODO: members
};

/*
 * @brief TODO
 */
struct ControlerMgr {
	ControlerMgr(); // unused/inlined

	void start(int, f32*);

	// unused/inlined:
	void init();
	void reset();
	void stop();
	void stop(int);
	void update();

	// TODO: members
};

/*
 * @brief TODO
 */
struct RumbleMgr {
	RumbleMgr(bool, bool, bool, bool);

	void reset();
	void start(int, int, f32*);
	void start(int, int, Vector3f&);
	void stop();
	void stop(int, int);
	void update();
	void rumbleOption(bool);

	// unused/inlined:
	void init();
	void rumblePause(bool);

	// TODO: members
};

extern RumbleMgr* rumbleMgr;

#endif