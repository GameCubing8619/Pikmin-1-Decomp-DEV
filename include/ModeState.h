#ifndef _GAMESTATE_H
#define _GAMESTATE_H

#include "types.h"

struct Graphics;
struct Controller;

/**
 * @brief TODO
 */
struct ModeState {
	ModeState(Controller* c)
	    : mController(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C
	virtual void postUpdate();          // _10

	// _00 = VTBL
	Controller* mController;
};

/**
 * @brief TODO
 */
struct DayOverModeState : public ModeState {
	DayOverModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C

	void makeTotalScoreWindow();
	ModeState* initialisePhaseOne();
	ModeState* initialisePhaseTwo();
	ModeState* initialisePhaseThree();
	ModeState* initialisePhaseFour();

	// _00     = VTBL?
	// _00-_04 = ModeState?
	// TODO: members
};

/**
 * @brief TODO
 */
struct IntroModeState : public ModeState {
	IntroModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C

	// _00     = VTBL
	// _00-_04 = ModeState
};

/**
 * @brief TODO
 */
struct IntroGameModeState : public ModeState {
	IntroGameModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C

	// _00     = VTBL?
	// _00-_04 = ModeState?
	// TODO: members
};

/**
 * @brief TODO
 */
struct MessageModeState : public ModeState {
	MessageModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C

	// _00     = VTBL?
	// _00-_04 = ModeState?
	// TODO: members
};

/**
 * @brief TODO
 */
struct QuittingModeState : public ModeState {
	QuittingModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&); // _08
	virtual void postUpdate(); // _10

	// _00     = VTBL?
	// _00-_04 = ModeState?
};

/**
 * @brief TODO
 */
struct QuittingGameModeState : public ModeState {
	QuittingGameModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&); // _08
	virtual void postUpdate(); // _10

	// _00     = VTBL?
	// _00-_04 = ModeState?
	// TODO: members
};

/**
 * @brief TODO
 */
struct RunningModeState : public ModeState {
	RunningModeState(Controller* c)
	    : ModeState(c)
	{
	}

	virtual void update(u32&);          // _08
	virtual void postRender(Graphics&); // _0C

	// _00     = VTBL?
	// _00-_04 = ModeState?
	// TODO: members
};

#endif
