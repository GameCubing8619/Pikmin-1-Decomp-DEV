.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.global getResource__9P2DStreamFi
getResource__9P2DStreamFi:
/* 801B3274 001B01D4  7C 08 02 A6 */	mflr r0
/* 801B3278 001B01D8  90 01 00 04 */	stw r0, 4(r1)
/* 801B327C 001B01DC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 801B3280 001B01E0  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 801B3284 001B01E4  7C 7B 1B 78 */	mr r27, r3
/* 801B3288 001B01E8  80 63 00 00 */	lwz r3, 0(r3)
/* 801B328C 001B01EC  81 83 00 04 */	lwz r12, 4(r3)
/* 801B3290 001B01F0  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 801B3294 001B01F4  7D 88 03 A6 */	mtlr r12
/* 801B3298 001B01F8  4E 80 00 21 */	blrl 
/* 801B329C 001B01FC  7C 7E 1B 78 */	mr r30, r3
/* 801B32A0 001B0200  80 7B 00 00 */	lwz r3, 0(r27)
/* 801B32A4 001B0204  81 83 00 04 */	lwz r12, 4(r3)
/* 801B32A8 001B0208  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 801B32AC 001B020C  7D 88 03 A6 */	mtlr r12
/* 801B32B0 001B0210  4E 80 00 21 */	blrl 
/* 801B32B4 001B0214  54 7D 06 3F */	clrlwi. r29, r3, 0x18
/* 801B32B8 001B0218  3B E3 00 00 */	addi r31, r3, 0
/* 801B32BC 001B021C  3B 80 00 00 */	li r28, 0
/* 801B32C0 001B0220  41 82 00 60 */	beq lbl_801B3320
/* 801B32C4 001B0224  38 7D 00 01 */	addi r3, r29, 1
/* 801B32C8 001B0228  4B E9 3D 3D */	bl alloc__6SystemFUl
/* 801B32CC 001B022C  57 C0 06 3E */	clrlwi r0, r30, 0x18
/* 801B32D0 001B0230  2C 00 00 01 */	cmpwi r0, 1
/* 801B32D4 001B0234  3B C3 00 00 */	addi r30, r3, 0
/* 801B32D8 001B0238  3B 9E 00 00 */	addi r28, r30, 0
/* 801B32DC 001B023C  41 82 00 44 */	beq lbl_801B3320
/* 801B32E0 001B0240  40 80 00 10 */	bge lbl_801B32F0
/* 801B32E4 001B0244  2C 00 00 00 */	cmpwi r0, 0
/* 801B32E8 001B0248  40 80 00 10 */	bge lbl_801B32F8
/* 801B32EC 001B024C  48 00 00 34 */	b lbl_801B3320
lbl_801B32F0:
/* 801B32F0 001B0250  2C 00 00 03 */	cmpwi r0, 3
/* 801B32F4 001B0254  40 80 00 2C */	bge lbl_801B3320
lbl_801B32F8:
/* 801B32F8 001B0258  80 7B 00 00 */	lwz r3, 0(r27)
/* 801B32FC 001B025C  38 9C 00 00 */	addi r4, r28, 0
/* 801B3300 001B0260  38 BD 00 00 */	addi r5, r29, 0
/* 801B3304 001B0264  81 83 00 04 */	lwz r12, 4(r3)
/* 801B3308 001B0268  81 8C 00 3C */	lwz r12, 0x3c(r12)
/* 801B330C 001B026C  7D 88 03 A6 */	mtlr r12
/* 801B3310 001B0270  4E 80 00 21 */	blrl 
/* 801B3314 001B0274  57 E0 06 3E */	clrlwi r0, r31, 0x18
/* 801B3318 001B0278  38 60 00 00 */	li r3, 0
/* 801B331C 001B027C  7C 7E 01 AE */	stbx r3, r30, r0
lbl_801B3320:
/* 801B3320 001B0280  7F 83 E3 78 */	mr r3, r28
/* 801B3324 001B0284  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 801B3328 001B0288  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 801B332C 001B028C  38 21 00 28 */	addi r1, r1, 0x28
/* 801B3330 001B0290  7C 08 03 A6 */	mtlr r0
/* 801B3334 001B0294  4E 80 00 20 */	blr 

.global align__9P2DStreamFi
align__9P2DStreamFi:
/* 801B3338 001B0298  7C 08 02 A6 */	mflr r0
/* 801B333C 001B029C  90 01 00 04 */	stw r0, 4(r1)
/* 801B3340 001B02A0  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 801B3344 001B02A4  93 E1 00 24 */	stw r31, 0x24(r1)
/* 801B3348 001B02A8  93 C1 00 20 */	stw r30, 0x20(r1)
/* 801B334C 001B02AC  7C 9E 23 78 */	mr r30, r4
/* 801B3350 001B02B0  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 801B3354 001B02B4  7C 7D 1B 78 */	mr r29, r3
/* 801B3358 001B02B8  80 63 00 00 */	lwz r3, 0(r3)
/* 801B335C 001B02BC  81 83 00 04 */	lwz r12, 4(r3)
/* 801B3360 001B02C0  81 8C 00 58 */	lwz r12, 0x58(r12)
/* 801B3364 001B02C4  7D 88 03 A6 */	mtlr r12
/* 801B3368 001B02C8  4E 80 00 21 */	blrl 
/* 801B336C 001B02CC  38 1E FF FF */	addi r0, r30, -1
/* 801B3370 001B02D0  7C 9E 1A 14 */	add r4, r30, r3
/* 801B3374 001B02D4  7C 05 00 F8 */	nor r5, r0, r0
/* 801B3378 001B02D8  38 04 FF FF */	addi r0, r4, -1
/* 801B337C 001B02DC  7C A0 00 38 */	and r0, r5, r0
/* 801B3380 001B02E0  7F E3 00 50 */	subf r31, r3, r0
/* 801B3384 001B02E4  3B C0 00 00 */	li r30, 0
/* 801B3388 001B02E8  48 00 00 1C */	b lbl_801B33A4
lbl_801B338C:
/* 801B338C 001B02EC  80 7D 00 00 */	lwz r3, 0(r29)
/* 801B3390 001B02F0  81 83 00 04 */	lwz r12, 4(r3)
/* 801B3394 001B02F4  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 801B3398 001B02F8  7D 88 03 A6 */	mtlr r12
/* 801B339C 001B02FC  4E 80 00 21 */	blrl 
/* 801B33A0 001B0300  3B DE 00 01 */	addi r30, r30, 1
lbl_801B33A4:
/* 801B33A4 001B0304  7C 1E F8 00 */	cmpw r30, r31
/* 801B33A8 001B0308  41 80 FF E4 */	blt lbl_801B338C
/* 801B33AC 001B030C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 801B33B0 001B0310  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 801B33B4 001B0314  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 801B33B8 001B0318  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 801B33BC 001B031C  38 21 00 28 */	addi r1, r1, 0x28
/* 801B33C0 001B0320  7C 08 03 A6 */	mtlr r0
/* 801B33C4 001B0324  4E 80 00 20 */	blr 