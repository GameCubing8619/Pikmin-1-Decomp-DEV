#include "ResultFlags.h"
#include "DebugLog.h"
#include "PlayerState.h"
#include "sysNew.h"

/*
 * --INFO--
 * Address:	........
 * Size:	00009C
 */
DEFINE_ERROR()

/*
 * --INFO--
 * Address:	........
 * Size:	0000F4
 */
DEFINE_PRINT("resultFlag");

ResultFlags::FlagInfo ResultFlags::flagTable[] = {
	// .blo index, auto-enable, priority, store type
	{ 1, false, 1, ResultFlags::FlagInfo::Store_Forget },    // End of Day 1
	{ 3, false, 3, ResultFlags::FlagInfo::Store_Forget },    // First Visit Forest of Hope
	{ 5, false, 9, ResultFlags::FlagInfo::Store_Forget },    // Open Forest Navel
	{ 6, false, 10, ResultFlags::FlagInfo::Store_Forget },   // First Visit Forest Navel
	{ 7, false, 11, ResultFlags::FlagInfo::Store_Forget },   // Open Distant Spring
	{ 8, false, 12, ResultFlags::FlagInfo::Store_Reset },    // First Visit Distant Spring
	{ 10, false, 13, ResultFlags::FlagInfo::Store_Forget },  // Final Day
	{ 11, false, 14, ResultFlags::FlagInfo::Store_Forget },  // 25 parts
	{ 12, false, 15, ResultFlags::FlagInfo::Store_Forget },  // 29 parts
	{ 13, false, 5, ResultFlags::FlagInfo::Store_Reset },    // Olimar down
	{ 14, false, 4, ResultFlags::FlagInfo::Store_Reset },    // Pikmin extinction
	{ 15, false, 2, ResultFlags::FlagInfo::Store_Forget },   // All 30 parts (unused)
	{ 17, false, 6, ResultFlags::FlagInfo::Store_Reset },    // Yellow Pikmin with bomb
	{ 18, false, 7, ResultFlags::FlagInfo::Store_Forget },   // Meet Blue Pikmin
	{ 19, false, 16, ResultFlags::FlagInfo::Store_Keep },    // Pikmin Routing
	{ 20, false, 19, ResultFlags::FlagInfo::Store_Reset },   // Olimar's Daydream
	{ 21, false, 20, ResultFlags::FlagInfo::Store_Reset },   // 15 parts
	{ 23, false, 8, ResultFlags::FlagInfo::Store_Reset },    // Pikmin left behind
	{ 24, false, 17, ResultFlags::FlagInfo::Store_Reset },   // Pikmin dies to bomb rock
	{ 26, false, 18, ResultFlags::FlagInfo::Store_Keep },    // 10 parts
	{ 27, true, 200, ResultFlags::FlagInfo::Store_Keep },    // Unused Controls log 1
	{ 29, false, 201, ResultFlags::FlagInfo::Store_Keep },   // Unused Controls log 2
	{ 31, true, 202, ResultFlags::FlagInfo::Store_Keep },    // Unused Controls log 3
	{ 32, false, 203, ResultFlags::FlagInfo::Store_Forget }, // Broken Bridge
	{ 33, false, 204, ResultFlags::FlagInfo::Store_Keep },   // Pikmin seeds
	{ 35, false, 205, ResultFlags::FlagInfo::Store_Keep },   // Pikmin seed grows up
	{ 36, false, 207, ResultFlags::FlagInfo::Store_Keep },   // Pikmin onions
	{ 37, false, 206, ResultFlags::FlagInfo::Store_Forget }, // Meet Yellow Pikmin (no bombs)
	{ 38, false, 208, ResultFlags::FlagInfo::Store_Forget }, // Blue Pikmin touch water (unused)
	{ 39, false, 209, ResultFlags::FlagInfo::Store_Forget }, // Pikmin on fire
	{ 40, false, 400, ResultFlags::FlagInfo::Store_Reset },  // Smoky Progg
	{ 41, false, 401, ResultFlags::FlagInfo::Store_Reset },  // Bulborb
	{ 42, false, 402, ResultFlags::FlagInfo::Store_Reset },  // Puffstool
	{ 43, false, 403, ResultFlags::FlagInfo::Store_Reset },  // Flint Beetle
	{ 44, false, 404, ResultFlags::FlagInfo::Store_Reset },  // Honeywisp
	{ 45, false, 405, ResultFlags::FlagInfo::Store_Reset },  // Candypop Bud
	{ 46, false, 406, ResultFlags::FlagInfo::Store_Reset },  // Beady Long Legs
	{ 47, false, 407, ResultFlags::FlagInfo::Store_Reset },  // Armored Cannon Beetle
	{ 48, false, 408, ResultFlags::FlagInfo::Store_Reset },  // Burrowing Snagret
	{ 49, false, 409, ResultFlags::FlagInfo::Store_Reset },  // Emperor Bulblax
	{ 50, false, 410, ResultFlags::FlagInfo::Store_Reset },  // Goolix
	{ 51, false, 411, ResultFlags::FlagInfo::Store_Reset },  // Mamuta
	{ 52, false, 412, ResultFlags::FlagInfo::Store_Reset },  // Sheargrub
	{ 53, false, 413, ResultFlags::FlagInfo::Store_Reset },  // Fiery Blowhog
	{ 54, false, 414, ResultFlags::FlagInfo::Store_Reset },  // Pearly Clamclamp
	{ 55, false, 415, ResultFlags::FlagInfo::Store_Reset },  // Beadbug
	{ 56, false, 416, ResultFlags::FlagInfo::Store_Reset },  // Puffy Blowhog
	{ 57, false, 417, ResultFlags::FlagInfo::Store_Reset },  // Wollywog
	{ 58, true, 600, ResultFlags::FlagInfo::Store_Keep },    // Misc 1
	{ 59, true, 601, ResultFlags::FlagInfo::Store_Keep },    // Misc 2
	{ 60, true, 602, ResultFlags::FlagInfo::Store_Keep },    // Misc 3
	{ 61, true, 603, ResultFlags::FlagInfo::Store_Keep },    // Misc 4
	{ 62, true, 604, ResultFlags::FlagInfo::Store_Keep },    // Misc 5
	{ 63, true, 605, ResultFlags::FlagInfo::Store_Keep },    // Misc 6
	{ 64, true, 606, ResultFlags::FlagInfo::Store_Keep },    // Misc 7
	{ 65, true, 607, ResultFlags::FlagInfo::Store_Keep },    // Misc 8
	{ 66, true, 608, ResultFlags::FlagInfo::Store_Keep },    // Misc 9
	{ 67, true, 609, ResultFlags::FlagInfo::Store_Keep },    // Misc 10
	{ 68, true, 610, ResultFlags::FlagInfo::Store_Keep },    // Misc 11
	{ 69, true, 611, ResultFlags::FlagInfo::Store_Keep },    // Misc 12
	{ 70, true, 612, ResultFlags::FlagInfo::Store_Keep },    // Misc 13
	{ 71, true, 613, ResultFlags::FlagInfo::Store_Keep },    // Misc 14
	{ 72, true, 614, ResultFlags::FlagInfo::Store_Keep },    // Misc 15
	{ 73, true, 615, ResultFlags::FlagInfo::Store_Keep },    // Misc 16
	{ 74, true, 616, ResultFlags::FlagInfo::Store_Keep },    // Misc 17
	{ 75, true, 617, ResultFlags::FlagInfo::Store_Keep },    // Misc 18
	{ 76, true, 618, ResultFlags::FlagInfo::Store_Keep },    // Misc 19
	{ 77, true, 619, ResultFlags::FlagInfo::Store_Keep },    // Misc 20
	{ 78, true, 620, ResultFlags::FlagInfo::Store_Keep },    // Misc 21
	{ 79, true, 621, ResultFlags::FlagInfo::Store_Keep },    // Misc 22
	{ 80, true, 622, ResultFlags::FlagInfo::Store_Keep },    // Misc 23
	{ 81, true, 623, ResultFlags::FlagInfo::Store_Keep },    // Misc 24
	{ 82, true, 624, ResultFlags::FlagInfo::Store_Keep },    // Misc 25
	{ 83, true, 625, ResultFlags::FlagInfo::Store_Keep },    // Misc 26
	{ 84, true, 626, ResultFlags::FlagInfo::Store_Keep },    // Misc 27
	{ -1, 0, 0, 0 },                                         // END
};

/*
 * --INFO--
 * Address:	8008358C
 * Size:	0001BC
 */
ResultFlags::ResultFlags()
{
	int max    = 38;
	mLength    = max;
	mTableSize = mLength << 2;

	mScreenToTableList = new u32[max + 110];
	mActiveCount       = 0;
	mStates            = new u8[mLength];
	for (int i = 0; i < mLength; i++) {
		mStates[i] = false;
	}

	for (int i = 0; i < mTableSize; i++) {
		if (flagTable[i].mScreenId == -1) {
			break;
		}

		mScreenToTableList[flagTable[i].mScreenId] = i;

		if (flagTable[i].mIsAutoSet) {
			setOn(flagTable[i].mScreenId);
		}

		mActiveCount++;
	}

	for (int i = 0; i < 30; i++) {
		mDaysSeen[i] = -1;
	}

	setSeen(27);
	setSeen(29);
	setSeen(31);
	setSeen(38);
}

/*
 * --INFO--
 * Address:	80083748
 * Size:	000178
 */
void ResultFlags::initGame()
{
	for (int i = 0; i < mLength; i++) {
		mStates[i] = false;
	}

	for (int i = 0; i < mTableSize; i++) {
		if (flagTable[i].mScreenId == -1) {
			break;
		}
		mScreenToTableList[flagTable[i].mScreenId] = i;

		if (flagTable[i].mIsAutoSet) {
			setOn(flagTable[i].mScreenId);
		}
	}

	for (int i = 0; i < 30; i++) {
		mDaysSeen[i] = -1;
	}

	setSeen(27);
	setSeen(29);
	setSeen(31);
	setSeen(38);
}

/*
 * --INFO--
 * Address:	800838C0
 * Size:	0000A4
 */
void ResultFlags::saveCard(RandomAccessStream& stream)
{
	int i = 0;
	for (i = 0; i < mLength; i++) {
		stream.writeByte(mStates[i]);
	}

	for (i = 0; i < 30; i++) {
		stream.writeShort(mDaysSeen[i]);
	}
}

/*
 * --INFO--
 * Address:	80083964
 * Size:	00009C
 */
void ResultFlags::loadCard(RandomAccessStream& stream)
{
	int i = 0;
	for (i = 0; i < mLength; i++) {
		mStates[i] = stream.readByte();
	}

	for (i = 0; i < 30; i++) {
		mDaysSeen[i] = stream.readShort();
	}
}

/*
 * --INFO--
 * Address:	80083A00
 * Size:	000050
 */
void ResultFlags::setOn(int flag)
{
	if (!getFlag(flag)) {
		setFlag(flag, 1);
	}
}

/*
 * --INFO--
 * Address:	80083A50
 * Size:	000024
 */
void ResultFlags::setSeen(int flag)
{
	setFlag(flag, 2);
}

/*
 * --INFO--
 * Address:	80083A74
 * Size:	0000A0
 */
int ResultFlags::getDayDocument(int day, int& res)
{
	int id = mDaysSeen[day];
	if (id == -1) {
		res = 0;
		return -1;
	}

	for (int i = 0; i < mActiveCount; i++) {
		int temp = flagTable[i].mScreenId;
		if (temp == id) {
			if (flagTable[i + 1].mScreenId == -1) {
				res = 1;
				return temp;
			}
			res = flagTable[i + 1].mScreenId - flagTable[i].mScreenId;
			return temp;
		}
	}

	res = 0;
	return -1;
}

/*
 * --INFO--
 * Address:	80083B14
 * Size:	000180
 */
int ResultFlags::getDocument(int& out)
{

	int minimumPriority = 0x1f400;
	int index           = -1;
	FlagInfo* flagData  = flagTable;

	for (int i = 0; i < mActiveCount; i++) {
		int id = flagData[i].mScreenId;
		if (getFlag(id) == true && minimumPriority > flagData[i].mPriority) {
			minimumPriority = flagData[i].mPriority;
			index           = i;
		}
	}

	if (index != -1) {
		int nextScreenId = flagData[index + 2].mStore;
		if (nextScreenId == -1) {
			out = 1;
		} else {
			out = nextScreenId - flagData[index].mScreenId;
		}

		setFlag(flagTable[index].mScreenId, 2);

		for (int i = 0; i < mActiveCount; i++) {
			int id = flagData[i].mScreenId;
			if (getFlag(id) == true) {
				switch (flagData[i].mStore) {
				case FlagInfo::Store_Forget:
					setFlag(id, 2);
					break;
				case FlagInfo::Store_Reset:
					setFlag(id, 0);
					break;
				}
			}
		}

		mDaysSeen[playerState->getCurrDay()] = flagTable[index].mScreenId;
		return flagTable[index].mScreenId;

	} else {
		dump();
		ERROR("cannot happen !\n");
		return -1;
	}

	f32 badcompiler[2];
	/*
	.loc_0x0:
	  mflr      r0
	  lis       r5, 0x802B
	  stw       r0, 0x4(r1)
	  stwu      r1, -0x38(r1)
	  stmw      r24, 0x18(r1)
	  subi      r28, r5, 0x1E20
	  addi      r31, r28, 0x1C
	  lis       r5, 0x2
	  addi      r29, r3, 0
	  addi      r30, r4, 0
	  addi      r27, r31, 0
	  subi      r26, r5, 0xC00
	  li        r25, -0x1
	  li        r24, 0
	  b         .loc_0x70

	.loc_0x3C:
	  lwz       r4, 0x0(r27)
	  mr        r3, r29
	  bl        0x248
	  rlwinm    r0,r3,0,24,31
	  cmplwi    r0, 0x1
	  bne-      .loc_0x68
	  lwz       r0, 0x8(r27)
	  cmpw      r26, r0
	  ble-      .loc_0x68
	  mr        r26, r0
	  addi      r25, r24, 0

	.loc_0x68:
	  addi      r27, r27, 0x10
	  addi      r24, r24, 0x1

	.loc_0x70:
	  lhz       r0, 0x2(r29)
	  cmpw      r24, r0
	  blt+      .loc_0x3C
	  cmpwi     r25, -0x1
	  beq-      .loc_0x160
	  rlwinm    r4,r25,4,0,27
	  add       r3, r28, r4
	  lwz       r5, 0x2C(r3)
	  cmpwi     r5, -0x1
	  bne-      .loc_0xA4
	  li        r0, 0x1
	  stw       r0, 0x0(r30)
	  b         .loc_0xB0

	.loc_0xA4:
	  lwz       r0, 0x1C(r3)
	  sub       r0, r5, r0
	  stw       r0, 0x0(r30)

	.loc_0xB0:
	  add       r27, r28, r4
	  lwzu      r4, 0x1C(r27)
	  addi      r3, r29, 0
	  li        r5, 0x2
	  bl        0x1FC
	  li        r24, 0
	  b         .loc_0x130

	.loc_0xCC:
	  lwz       r25, 0x0(r31)
	  addi      r3, r29, 0
	  addi      r4, r25, 0
	  bl        0x1B4
	  rlwinm    r0,r3,0,24,31
	  cmplwi    r0, 0x1
	  bne-      .loc_0x128
	  lwz       r0, 0xC(r31)
	  cmpwi     r0, 0x1
	  beq-      .loc_0x118
	  bge-      .loc_0x128
	  cmpwi     r0, 0
	  bge-      .loc_0x104
	  b         .loc_0x128

	.loc_0x104:
	  addi      r3, r29, 0
	  addi      r4, r25, 0
	  li        r5, 0x2
	  bl        0x1AC
	  b         .loc_0x128

	.loc_0x118:
	  addi      r3, r29, 0
	  addi      r4, r25, 0
	  li        r5, 0
	  bl        0x198

	.loc_0x128:
	  addi      r31, r31, 0x10
	  addi      r24, r24, 0x1

	.loc_0x130:
	  lhz       r0, 0x2(r29)
	  cmpw      r24, r0
	  blt+      .loc_0xCC
	  lwz       r0, 0x0(r27)
	  lwz       r3, 0x2F6C(r13)
	  extsh     r30, r0
	  bl        -0x30AC
	  rlwinm    r0,r3,1,0,30
	  add       r3, r29, r0
	  sth       r30, 0xC(r3)
	  lwz       r3, 0x0(r27)
	  b         .loc_0x16C

	.loc_0x160:
	  mr        r3, r29
	  bl        .loc_0x180
	  li        r3, -0x1

	.loc_0x16C:
	  lmw       r24, 0x18(r1)
	  lwz       r0, 0x3C(r1)
	  addi      r1, r1, 0x38
	  mtlr      r0
	  blr

	.loc_0x180:
	*/
}

/*
 * --INFO--
 * Address:	........
 * Size:	00003C
 */
int ResultFlags::FlagInfo::type()
{
	if (mPriority < 200) {
		return 0;
	}
	if (mPriority < 400) {
		return 200;
	}
	if (mPriority < 600) {
		return 400;
	}
	return 600;
}

/*
 * --INFO--
 * Address:	80083C94
 * Size:	00010C
 */
void ResultFlags::dump()
{
	int prev = 0;
	int p    = 0;
	PRINT("******* CURRENT RESULT FLAGS STATUS ***********\n");
	for (int i = 0; i < mTableSize; i++) {
		int id = flagTable[i].mScreenId;
		if (id == -1) {
			break;
		}

		// This all seems to be DLL exclusive
		// char* strs[4];
		// strs[3] = nullptr;
		// int type = info[id].type();
		// if (type < 0x191) {
		//	if (type == 400) {
		//		strs[3] = "TEK";
		//	} else if (type == 0) {
		//		strs[3] = "GEN";
		//	} else if (type == 200) {
		//		strs[3] = "SET";
		//	}
		//} else if (type == 600) {
		//	strs[3] = "ETC";
		//}

		if (prev != flagTable[i].type()) {
			p    = 0;
			prev = flagTable[i].type();
		}
		prev          = flagTable[i].type();
		char* strs[3] = { "OFF", "ON", "SEEN" };

		// The final game version of this print probably cut out the strs[3], since its not set in final
		PRINT(" ENUM_RESULT_%s_G%02d_P00 = %s : %d pages\n", strs[3], p++, strs[getFlag(flagTable[i].mScreenId)],
		      (flagTable[i + 1].mScreenId == -1) ? 1 : flagTable[i + 1].mScreenId - id);
	}
	PRINT("*************************************************\n");
}

/*
 * --INFO--
 * Address:	80083DA0
 * Size:	000030
 */
u8 ResultFlags::getFlag(int index)
{
	int a = mScreenToTableList[index];
	int b = a >> 2;
	return mStates[b] >> ((a - b * 4) * 2) & 3;
}

/*
 * --INFO--
 * Address:	80083DD0
 * Size:	000090
 */
void ResultFlags::setFlag(int index, u8 flag)
{
	int a  = mScreenToTableList[index];
	int b  = a >> 2;
	u8 old = mStates[b];

	a -= b * 4;

	if (flag & 1) {
		old |= (1 << a * 2);
	} else {
		old &= ~(1 << a * 2);
	}

	if (flag & 2) {
		old |= (1 << a * 2 + 1);
	} else {
		old &= ~(1 << a * 2 + 1);
	}

	mStates[b] = old;
	/*
	.loc_0x0:
	  lwz       r6, 0x48(r3)
	  rlwinm    r0,r4,2,0,29
	  lwz       r3, 0x8(r3)
	  rlwinm    r4,r5,0,24,31
	  lwzx      r6, r6, r0
	  rlwinm.   r0,r5,0,31,31
	  srawi     r7, r6, 0x2
	  add       r5, r3, r7
	  rlwinm    r3,r7,2,0,29
	  lbz       r7, 0x0(r5)
	  sub       r6, r6, r3
	  beq-      .loc_0x44
	  rlwinm    r0,r6,1,0,30
	  li        r3, 0x1
	  slw       r0, r3, r0
	  or        r7, r7, r0
	  b         .loc_0x54

	.loc_0x44:
	  rlwinm    r0,r6,1,0,30
	  li        r3, 0x1
	  slw       r0, r3, r0
	  andc      r7, r7, r0

	.loc_0x54:
	  rlwinm.   r0,r4,0,30,30
	  beq-      .loc_0x74
	  rlwinm    r3,r6,1,0,30
	  addi      r0, r3, 0x1
	  li        r3, 0x1
	  slw       r0, r3, r0
	  or        r7, r7, r0
	  b         .loc_0x88

	.loc_0x74:
	  rlwinm    r3,r6,1,0,30
	  addi      r0, r3, 0x1
	  li        r3, 0x1
	  slw       r0, r3, r0
	  andc      r7, r7, r0

	.loc_0x88:
	  stb       r7, 0x0(r5)
	  blr
	*/
}
