#ifndef _WORKOBJECT_H
#define _WORKOBJECT_H

#include "types.h"
#include "ItemMgr.h"
#include "ObjectMgr.h"
#include "Plane.h"
#include "UtEffect.h"
#include "Route.h"
#include "Shape.h"

struct DynBuildShape;

/**
 * @brief TODO
 */
struct WorkObject : public ItemCreature {
	WorkObject(); // unused/inlined

	virtual bool isVisible();                 // _74
	virtual bool isAlive();                   // _88
	virtual void doKill();                    // _10C
	virtual void finalSetup() { }             // _158
	virtual bool isBridge() { return false; } // _15C
	virtual bool isHinderRock();              // _160
	virtual bool isFinished();                // _164
	virtual bool workable(Vector3f&);         // _168

	// _00      = VTBL
	// _00-_3C8 = ItemCreature
};

/**
 * @brief TODO
 */
struct WorkObjectNode : public CoreNode {
	WorkObjectNode()
	    : CoreNode("wo")
	{
	}

	WorkObjectNode(WorkObject* object)
	    : mObject(object)
	{
	}

	// _00     = VTBL
	// _00-_14 = CoreNode
	WorkObject* mObject; // _14
};

/**
 * @brief TODO
 */
struct WorkObjectMgr : public ObjectMgr {
	WorkObjectMgr();

	virtual Creature* getCreature(int); // _08
	virtual int getFirst();             // _0C
	virtual int getNext(int);           // _10
	virtual bool isDone(int);           // _14
	virtual ~WorkObjectMgr();           // _48
	virtual int getSize();              // _60
	virtual int getMax();               // _64

	void finalSetup();
	void loadShapes();
	Creature* birth(int, int);

	// unused/inlined:
	int getNameIndex(char*);
	char* getName(int);
	int getShapeNameIndex(char*);
	char* getShapeName(int);
	void addUseList(int);

	// _00     = VTBL 1
	// _08     = VTBL 2
	// _00-_28 = ObjectMgr
	WorkObjectNode mRootNode; // _28
	Shape** mItemShapes;      // _40, array of 5 shapes
	u8* mShouldThisShapeLoad; // _44, array of 5 bytes/bools
};

/**
 * @brief TODO
 *
 * @note Size: 0x428.
 */
struct Bridge : public WorkObject {
	Bridge(Shape*, bool);

	virtual bool insideSafeArea(Vector3f&);   // _10
	virtual bool alwaysUpdatePlatform();      // _18
	virtual void startAI(int);                // _34
	virtual void doSave(RandomAccessStream&); // _50
	virtual void doLoad(RandomAccessStream&); // _54
	virtual bool stimulate(Interaction&);     // _A0
	virtual void dump();                      // _C8
	virtual void update();                    // _E0
	virtual void refresh(Graphics&);          // _EC
	virtual void finalSetup();                // _158
	virtual bool isBridge();                  // _15C
	virtual bool isFinished();                // _164
	virtual bool workable(Vector3f&);         // _168

	inline int getStage() { return mStageCount; }

	int getFirstUnfinishedStage();
	int getFirstFinishedStage();
	int getJointIndex(int);
	bool isStageFinished(int);
	void flatten();
	void setStageFinished(int, bool);
	Vector3f getStagePos(int);
	f32 getStageZ(int);
	void getBridgePos(Vector3f&, f32&, f32&);
	Vector3f getBridgeZVec();
	Vector3f getBridgeXVec();
	Vector3f getStartPos();
	f32 getStageDepth();
	f32 getStageWidth();
	void startStageFinished(int, bool);

	// _00      = VTBL
	// _00-_3C8 = WorkObject
	bool _3C8;                  // _3C8
	s16 _3CA;                   // _3CA
	u8 _3CC;                    // _3CC
	f32* mStageProgressList;    // _3D0, stage items?
	Joint** mStageJoints;       // _3D4, unknown
	PermanentEffect _3D8;       // _3D8
	PermanentEffect _3E8;       // _3E8
	WayPoint* _3F8;             // _3F8
	WayPoint* _3FC;             // _3FC
	u8 _400;                    // _400
	int mStageCount;            // _404
	DynBuildShape* mBuildShape; // _408
	Shape* _40C;                // _40C
	CollPart* _410;             // _410
	ShapeDynMaterials _414;     // _414
	u8 _424;                    // _424, flags (3 = final setup)
};

/**
 * @brief TODO
 *
 * @note Size: 0x478.
 */
struct HinderRock : public WorkObject {
	HinderRock(Shape*);

	virtual bool insideSafeArea(Vector3f&);   // _10
	virtual void startAI(int);                // _34
	virtual void doSave(RandomAccessStream&); // _50
	virtual void doLoad(RandomAccessStream&); // _54
	virtual f32 getCentreSize();              // _5C
	virtual bool stimulate(Interaction&);     // _A0
	virtual void update();                    // _E0
	virtual void refresh(Graphics&);          // _EC
	virtual bool isHinderRock();              // _160
	virtual bool isFinished();                // _164
	virtual bool workable(Vector3f&);         // _168

	void beginPush();
	void endPush();
	Vector3f getZVector();
	Vector3f getXVector();
	u8 getPlaneFlag(Vector3f&);
	void updatePlanes();
	Vector3f getVertex(int);

	// unused/inlined:
	int getPlaneIndex(Vector3f&);
	Vector3f getTangentPos(f32);

	bool isMoving() { return mIsMoving; }

	// _00      = VTBL
	// _00-_3C8 = WorkObject
	u16 mPushCount;             // _3C8
	Plane _3CC[4];              // _3CC
	Vector3f _40C;              // _40C
	u32 _418;                   // _418
	u32 _41C;                   // _41C
	u32 _420;                   // _420
	WayPoint* mWayPoint;        // _424
	u8 _428[0x8];               // _428, unknown
	f32 _430;                   // _430
	DynBuildShape* mBuildShape; // _434
	Shape* _438;                // _438
	u8 mState;                  // _43C
	f32 _440;                   // _440
	bool mIsMoving;             // _444
	u32 _448;                   // _448
	u32 _44C;                   // _44C
	u32 _450;                   // _450
	Vector3f _454;              // _454
	Vector3f _460[2];           // _460
};

extern WorkObjectMgr* workObjectMgr;

#endif
