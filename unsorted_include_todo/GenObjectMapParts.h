#ifndef _GENOBJECTMAPPARTS_H
#define _GENOBJECTMAPPARTS_H

/**
 * .obj __vt__17GenObjectMapParts, global
 * .4byte __RTTI__17GenObjectMapParts
 * .4byte 0
 * .4byte doWrite__7GenBaseFR18RandomAccessStream
 * .4byte ramSaveParameters__7GenBaseFR18RandomAccessStream
 * .4byte ramLoadParameters__7GenBaseFR18RandomAccessStream
 * .4byte doRead__17GenObjectMapPartsFR18RandomAccessStream
 * .4byte update__7GenBaseFv
 * .4byte render__7GenBaseFR8Graphics
 * .4byte getLatestVersion__9GenObjectFv
 * .4byte updateUseList__9GenObjectFP9Generatori
 * .4byte init__9GenObjectFP9Generator
 * .4byte update__9GenObjectFP9Generator
 * .4byte render__17GenObjectMapPartsFR8GraphicsP9Generator
 * .4byte birth__17GenObjectMapPartsFR9BirthInfo
*/

struct GenBase {
	virtual void doWrite(RandomAccessStream &);            // _08
	virtual void ramSaveParameters(RandomAccessStream &);  // _0C
	virtual void ramLoadParameters(RandomAccessStream &);  // _10
	virtual void doRead(RandomAccessStream &);             // _14
	virtual void update();                                 // _18
	virtual void render(Graphics &);                       // _1C
};

struct GenObject {
	virtual void _08() = 0;                        // _08
	virtual void _0C() = 0;                        // _0C
	virtual void _10() = 0;                        // _10
	virtual void doRead(RandomAccessStream &);     // _14
	virtual void _18() = 0;                        // _18
	virtual void _1C() = 0;                        // _1C
	virtual void getLatestVersion();               // _20
	virtual void updateUseList(Generator *, int);  // _24
	virtual void init(Generator *);                // _28
	virtual void update(Generator *);              // _2C
};

/**
 * @brief TODO
 */
struct GenObjectMapParts : public GenBase, public GenObject {
	virtual void doRead(RandomAccessStream &);     // _14
	virtual void render(Graphics &, Generator *);  // _30
	virtual void birth(BirthInfo &);               // _34

};

#endif