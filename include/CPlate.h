#ifndef _CPLATE_H
#define _CPLATE_H

#include "types.h"
#include "Traversable.h"
#include "Parameters.h"
#include "Node.h"
#include "ComplexCreature.h"

struct MapMgr;
struct Piki;
struct SlotChangeListner;

/**
 * @brief TODO
 */
struct CPlate : public Traversable, public Node {

	/**
	 * @brief TODO
	 *
	 * @note Offsets are relative to CPlate for ease of use.
	 */
	struct Parms : public Parameters {
		Parms()
		    : mStartOffset(this, 30.0f, 0.0f, 100.0f, "p00", nullptr)    // 'start offset'
		    , mLengthLimit(this, 150.0f, 10.0f, 1000.0f, "p01", nullptr) // 'length limit'
		    , mMaxPosSize(this, 12.0f, 1.0f, 50.0f, "p02", nullptr)      // 'position size (maximum)'
		{
		}

		// _28-_2C = Parameters
		Parm<f32> mStartOffset; // _2C, p00
		Parm<f32> mLengthLimit; // _3C, p01
		Parm<f32> mMaxPosSize;  // _4C, p02
	};

	/**
	 * @brief TODO
	 */
	struct Slot {
		Slot()
		{
			mOccupant.clear();
			mListener = nullptr;
		}

		Vector3f mPosition;           // _00
		Vector3f _0C;                 // _0C
		SmartPtr<Creature> mOccupant; // _18
		SlotChangeListner* mListener; // _1C
	};

	CPlate(MapMgr*);

	virtual void read(RandomAccessStream& input) { mCPlateParms.read(input); } // _48
	virtual void update();                                                     // _4C
	virtual void render(Graphics&);                                            // _50
	// these need to go last to spawn the vtable further down in cPlate.cpp
	virtual Creature* getCreature(int);                 // _08
	virtual int getFirst() { return 0; }                // _0C
	virtual int getNext(int idx) { return idx + 1; }    // _10
	virtual bool isDone(int idx) { return idx >= _74; } // _14

	bool canNaviRunFast();
	void init(Vector3f&);
	void setPos(Vector3f&, f32, Vector3f&);
	void setPosGray(Vector3f&, f32, Vector3f&);
	int getSlot(Creature*, SlotChangeListner*);
	void changeFlower(Piki*);
	void releaseSlot(Creature*, int);
	bool validSlot(int);
	void sortByColor(Piki*);
	void rearrangeSlot(Vector3f&, f32, Vector3f&);
	void refresh(int, f32);
	void refreshSlot();

	// unused/inlined:
	void setPosNeutral(Vector3f&, f32, Vector3f&);
	void swapSlot(int, int);
	void postUpdate(f32);

	// _00 = VTBL 1
	// _08 = VTBL 2
	// _00-_08 = Traversable
	// _08-_28 = Node
	Parms mCPlateParms;      // _28
	Vector3f _5C;            // _5C, denoted by a markerShape in debug mode
	f32 _68;                 // _68
	f32 _6C;                 // _6C
	f32 _70;                 // _70
	int _74;                 // _74
	u32 _78;                 // _78
	int mCurrSlotCount;      // _7C, no. used slots
	CPlate::Slot* mSlotList; // _80
	int mMaxSlotCount;       // _84, max slots
	Vector3f _88;            // _88
	Vector3f _94;            // _94, denoted by a markerShape in debug mode
	Vector3f _A0;            // _A0
	f32 _AC;                 // _AC
	Vector3f _B0;            // _B0
	int mHappaCounts[3];     // _BC, indexed by PikiHappa
	u8 _C8;                  // _C8
	u8 _C9;                  // _C9
};

#endif
