#ifndef _AICREATURE_H
#define _AICREATURE_H

/**
 * .obj __vt__10AICreature, global
 * .4byte __RTTI__10AICreature
 * .4byte 0
 * .4byte addCntCallback__12RefCountableFv
 * .4byte subCntCallback__12RefCountableFv
 * .4byte insideSafeArea__8CreatureFR8Vector3f
 * .4byte platAttachable__8CreatureFv
 * .4byte alwaysUpdatePlatform__8CreatureFv
 * .4byte doDoAI__8CreatureFv
 * .4byte setRouteTracer__8CreatureFP11RouteTracer
 * .4byte init__8CreatureFv
 * .4byte init__8CreatureFR8Vector3f
 * .4byte resetPosition__8CreatureFR8Vector3f
 * .4byte initParam__8CreatureFi
 * .4byte startAI__8CreatureFi
 * .4byte getiMass__8CreatureFv
 * .4byte getSize__8CreatureFv
 * .4byte getHeight__8CreatureFv
 * .4byte getCylinderHeight__8CreatureFv
 * .4byte doStore__8CreatureFP11CreatureInf
 * .4byte doRestore__8CreatureFP11CreatureInf
 * .4byte doSave__8CreatureFR18RandomAccessStream
 * .4byte doLoad__8CreatureFR18RandomAccessStream
 * .4byte getCentre__8CreatureFv
 * .4byte getCentreSize__8CreatureFv
 * .4byte getBoundingSphereCentre__8CreatureFv
 * .4byte getBoundingSphereRadius__8CreatureFv
 * .4byte getShadowPos__8CreatureFv
 * .4byte setCentre__8CreatureFR8Vector3f
 * .4byte getShadowSize__8CreatureFv
 * .4byte isVisible__8CreatureFv
 * .4byte isOrganic__8CreatureFv
 * .4byte isTerrible__8CreatureFv
 * .4byte isBuried__8CreatureFv
 * .4byte isAtari__8CreatureFv
 * .4byte isAlive__8CreatureFv
 * .4byte isFixed__8CreatureFv
 * .4byte needShadow__8CreatureFv
 * .4byte needFlick__8CreatureFP8Creature
 * .4byte ignoreAtari__8CreatureFP8Creature
 * .4byte isFree__8CreatureFv
 * .4byte stimulate__8CreatureFR11Interaction
 * .4byte sendMsg__8CreatureFP3Msg
 * .4byte collisionCallback__10AICreatureFR9CollEvent
 * .4byte bounceCallback__10AICreatureFv
 * .4byte jumpCallback__8CreatureFv
 * .4byte wallCallback__8CreatureFR5PlaneP13DynCollObject
 * .4byte offwallCallback__8CreatureFP13DynCollObject
 * .4byte stickCallback__8CreatureFP8Creature
 * .4byte offstickCallback__8CreatureFP8Creature
 * .4byte stickToCallback__8CreatureFP8Creature
 * .4byte dump__8CreatureFv
 * .4byte startWaterEffect__8CreatureFv
 * .4byte finishWaterEffect__8CreatureFv
 * .4byte isRopable__8CreatureFv
 * .4byte mayIstick__8CreatureFv
 * .4byte getFormationPri__8CreatureFv
 * .4byte update__8CreatureFv
 * .4byte postUpdate__8CreatureFif
 * .4byte stickUpdate__8CreatureFv
 * .4byte 0
 * .4byte refresh2d__8CreatureFR8Graphics
 * .4byte renderAtari__8CreatureFR8Graphics
 * .4byte drawShadow__8CreatureFR8Graphics
 * .4byte demoDraw__8CreatureFR8GraphicsP8Matrix4f
 * .4byte getCatchPos__8CreatureFP8Creature
 * .4byte doAI__8CreatureFv
 * .4byte doAnimation__8CreatureFv
 * .4byte 0
 * .4byte exitCourse__8CreatureFv
 * .4byte __RTTI__10AICreature
 * .4byte 0xFFFFFD48
 * .4byte "@696@animationKeyUpdated__10AICreatureFR16PaniAnimKeyEvent"
 * .4byte getCurrState__10AICreatureFv
 * .4byte "setCurrState__10AICreatureFP20AState<10AICreature>"
 * .4byte playSound__10AICreatureFi
 * .4byte playEffect__10AICreatureFi
 * .4byte startMotion__10AICreatureFi
 * .4byte finishMotion__10AICreatureFv
 * .4byte finishMotion__10AICreatureFf
 * .4byte startMotion__10AICreatureFif
 * .4byte getCurrentMotionName__10AICreatureFv
 * .4byte getCurrentMotionCounter__10AICreatureFv
 * .4byte getMotionSpeed__10AICreatureFv
 * .4byte setMotionSpeed__10AICreatureFf
 * .4byte stopMotion__10AICreatureFv
 * .4byte animationKeyUpdated__10AICreatureFR16PaniAnimKeyEvent
 */

struct RefCountable {
	virtual void addCntCallback(); // _08 (weak)
	virtual void subCntCallback(); // _0C (weak)
};

struct Creature {
	virtual void _08() = 0;                            // _08
	virtual void _0C() = 0;                            // _0C
	virtual void insideSafeArea(Vector3f&);            // _10 (weak)
	virtual void platAttachable();                     // _14 (weak)
	virtual void alwaysUpdatePlatform();               // _18
	virtual void doDoAI();                             // _1C (weak)
	virtual void setRouteTracer(RouteTracer*);         // _20 (weak)
	virtual void init();                               // _24
	virtual void init(Vector3f&);                      // _28
	virtual void resetPosition(Vector3f&);             // _2C
	virtual void initParam(int);                       // _30 (weak)
	virtual void startAI(int);                         // _34 (weak)
	virtual void getiMass();                           // _38 (weak)
	virtual void getSize();                            // _3C (weak)
	virtual void getHeight();                          // _40 (weak)
	virtual void getCylinderHeight();                  // _44 (weak)
	virtual void doStore(CreatureInf*);                // _48 (weak)
	virtual void doRestore(CreatureInf*);              // _4C (weak)
	virtual void doSave(RandomAccessStream&);          // _50 (weak)
	virtual void doLoad(RandomAccessStream&);          // _54 (weak)
	virtual void getCentre();                          // _58
	virtual void getCentreSize();                      // _5C
	virtual void getBoundingSphereCentre();            // _60
	virtual void getBoundingSphereRadius();            // _64
	virtual void getShadowPos();                       // _68 (weak)
	virtual void setCentre(Vector3f&);                 // _6C (weak)
	virtual void getShadowSize();                      // _70
	virtual void isVisible();                          // _74
	virtual void isOrganic();                          // _78 (weak)
	virtual void isTerrible();                         // _7C
	virtual void isBuried();                           // _80 (weak)
	virtual void isAtari();                            // _84 (weak)
	virtual void isAlive();                            // _88 (weak)
	virtual void isFixed();                            // _8C (weak)
	virtual void needShadow();                         // _90
	virtual void needFlick(Creature*);                 // _94 (weak)
	virtual void ignoreAtari(Creature*);               // _98 (weak)
	virtual void isFree();                             // _9C (weak)
	virtual void stimulate(Interaction&);              // _A0
	virtual void sendMsg(Msg*);                        // _A4 (weak)
	virtual void collisionCallback(CollEvent&);        // _A8
	virtual void bounceCallback();                     // _AC
	virtual void jumpCallback();                       // _B0 (weak)
	virtual void wallCallback(Plane&, DynCollObject*); // _B4
	virtual void offwallCallback(DynCollObject*);      // _B8 (weak)
	virtual void stickCallback(Creature*);             // _BC (weak)
	virtual void offstickCallback(Creature*);          // _C0 (weak)
	virtual void stickToCallback(Creature*);           // _C4 (weak)
	virtual void dump();                               // _C8 (weak)
	virtual void startWaterEffect();                   // _CC (weak)
	virtual void finishWaterEffect();                  // _D0 (weak)
	virtual void isRopable();                          // _D4 (weak)
	virtual void mayIstick();                          // _D8 (weak)
	virtual void getFormationPri();                    // _DC (weak)
	virtual void update();                             // _E0
	virtual void postUpdate(int, f32);                 // _E4
	virtual void stickUpdate();                        // _E8
	virtual void _EC() = 0;                            // _EC
	virtual void refresh2d(Graphics&);                 // _F0 (weak)
	virtual void renderAtari(Graphics&);               // _F4
	virtual void drawShadow(Graphics&);                // _F8
	virtual void demoDraw(Graphics&, Matrix4f*);       // _FC
	virtual void getCatchPos(Creature*);               // _100
	virtual void doAI();                               // _104 (weak)
	virtual void doAnimation();                        // _108 (weak)
	virtual void _10C() = 0;                           // _10C
	virtual void exitCourse();                         // _110 (weak)
};

/**
 * @brief TODO
 */
struct AICreature : public RefCountable, public Creature {
	virtual void collisionCallback(CollEvent&);          // _A8
	virtual void bounceCallback();                       // _AC
	virtual void _EC()  = 0;                             // _EC
	virtual void _10C() = 0;                             // _10C
	virtual void getCurrState();                         // _120 (weak)
	virtual void setCurrState(AState<AICreature>*);      // _124 (weak)
	virtual void playSound(int);                         // _128 (weak)
	virtual void playEffect(int);                        // _12C (weak)
	virtual void startMotion(int);                       // _130 (weak)
	virtual void finishMotion();                         // _134 (weak)
	virtual void finishMotion(f32);                      // _138 (weak)
	virtual void startMotion(int, f32);                  // _13C (weak)
	virtual void getCurrentMotionName();                 // _140 (weak)
	virtual void getCurrentMotionCounter();              // _144 (weak)
	virtual void getMotionSpeed();                       // _148 (weak)
	virtual void setMotionSpeed(f32);                    // _14C (weak)
	virtual void stopMotion();                           // _150 (weak)
	virtual void animationKeyUpdated(PaniAnimKeyEvent&); // _154 (weak)
};

#endif
