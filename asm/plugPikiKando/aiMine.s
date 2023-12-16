.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.fn __ct__7ActMineFP4Piki, global
/* 800B92C0 000B6220  7C 08 02 A6 */	mflr r0
/* 800B92C4 000B6224  90 01 00 04 */	stw r0, 4(r1)
/* 800B92C8 000B6228  7C 80 07 35 */	extsh. r0, r4
/* 800B92CC 000B622C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800B92D0 000B6230  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800B92D4 000B6234  3B E3 00 00 */	addi r31, r3, 0
/* 800B92D8 000B6238  41 82 00 18 */	beq .L_800B92F0
/* 800B92DC 000B623C  38 1F 00 28 */	addi r0, r31, 0x28
/* 800B92E0 000B6240  3C 60 80 2B */	lis r3, __vt__19PaniAnimKeyListener@ha
/* 800B92E4 000B6244  90 1F 00 14 */	stw r0, 0x14(r31)
/* 800B92E8 000B6248  38 03 DB 94 */	addi r0, r3, __vt__19PaniAnimKeyListener@l
/* 800B92EC 000B624C  90 1F 00 28 */	stw r0, 0x28(r31)
.L_800B92F0:
/* 800B92F0 000B6250  38 7F 00 00 */	addi r3, r31, 0
/* 800B92F4 000B6254  38 85 00 00 */	addi r4, r5, 0
/* 800B92F8 000B6258  38 A0 00 01 */	li r5, 1
/* 800B92FC 000B625C  48 00 AA D5 */	bl __ct__6ActionFP4Pikib
/* 800B9300 000B6260  3C 60 80 2B */	lis r3, __vt__7ActMine@ha
/* 800B9304 000B6264  38 63 68 50 */	addi r3, r3, __vt__7ActMine@l
/* 800B9308 000B6268  90 7F 00 00 */	stw r3, 0(r31)
/* 800B930C 000B626C  38 A3 00 68 */	addi r5, r3, 0x68
/* 800B9310 000B6270  38 1F 00 28 */	addi r0, r31, 0x28
/* 800B9314 000B6274  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 800B9318 000B6278  7F E3 FB 78 */	mr r3, r31
/* 800B931C 000B627C  90 A4 00 00 */	stw r5, 0(r4)
/* 800B9320 000B6280  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 800B9324 000B6284  7C 04 00 50 */	subf r0, r4, r0
/* 800B9328 000B6288  90 04 00 04 */	stw r0, 4(r4)
/* 800B932C 000B628C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800B9330 000B6290  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800B9334 000B6294  38 21 00 20 */	addi r1, r1, 0x20
/* 800B9338 000B6298  7C 08 03 A6 */	mtlr r0
/* 800B933C 000B629C  4E 80 00 20 */	blr 
.endfn __ct__7ActMineFP4Piki

.fn init__7ActMineFP8Creature, global
/* 800B9340 000B62A0  7C 08 02 A6 */	mflr r0
/* 800B9344 000B62A4  90 01 00 04 */	stw r0, 4(r1)
/* 800B9348 000B62A8  38 00 00 00 */	li r0, 0
/* 800B934C 000B62AC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800B9350 000B62B0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800B9354 000B62B4  3B E4 00 00 */	addi r31, r4, 0
/* 800B9358 000B62B8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800B935C 000B62BC  7C 7E 1B 78 */	mr r30, r3
/* 800B9360 000B62C0  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800B9364 000B62C4  98 03 04 08 */	stb r0, 0x408(r3)
/* 800B9368 000B62C8  80 64 00 6C */	lwz r3, 0x6c(r4)
/* 800B936C 000B62CC  2C 03 00 0D */	cmpwi r3, 0xd
/* 800B9370 000B62D0  41 82 00 08 */	beq .L_800B9378
/* 800B9374 000B62D4  4B FD B6 C5 */	bl getName__7ObjTypeFi
.L_800B9378:
/* 800B9378 000B62D8  93 FE 00 18 */	stw r31, 0x18(r30)
/* 800B937C 000B62DC  7F C3 F3 78 */	mr r3, r30
/* 800B9380 000B62E0  48 00 00 25 */	bl initWatch__7ActMineFv
/* 800B9384 000B62E4  38 00 00 02 */	li r0, 2
/* 800B9388 000B62E8  B0 1E 00 1C */	sth r0, 0x1c(r30)
/* 800B938C 000B62EC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800B9390 000B62F0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800B9394 000B62F4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800B9398 000B62F8  38 21 00 18 */	addi r1, r1, 0x18
/* 800B939C 000B62FC  7C 08 03 A6 */	mtlr r0
/* 800B93A0 000B6300  4E 80 00 20 */	blr 
.endfn init__7ActMineFP8Creature

.fn initWatch__7ActMineFv, global
/* 800B93A4 000B6304  7C 08 02 A6 */	mflr r0
/* 800B93A8 000B6308  90 01 00 04 */	stw r0, 4(r1)
/* 800B93AC 000B630C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800B93B0 000B6310  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800B93B4 000B6314  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800B93B8 000B6318  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800B93BC 000B631C  7C 7D 1B 79 */	or. r29, r3, r3
/* 800B93C0 000B6320  3B DD 00 00 */	addi r30, r29, 0
/* 800B93C4 000B6324  41 82 00 08 */	beq .L_800B93CC
/* 800B93C8 000B6328  83 DD 00 14 */	lwz r30, 0x14(r29)
.L_800B93CC:
/* 800B93CC 000B632C  38 61 00 0C */	addi r3, r1, 0xc
/* 800B93D0 000B6330  38 80 00 41 */	li r4, 0x41
/* 800B93D4 000B6334  48 06 5B 85 */	bl __ct__14PaniMotionInfoFi
/* 800B93D8 000B6338  3B E3 00 00 */	addi r31, r3, 0
/* 800B93DC 000B633C  38 BE 00 00 */	addi r5, r30, 0
/* 800B93E0 000B6340  38 61 00 14 */	addi r3, r1, 0x14
/* 800B93E4 000B6344  38 80 00 41 */	li r4, 0x41
/* 800B93E8 000B6348  48 06 5B A5 */	bl __ct__14PaniMotionInfoFiP19PaniAnimKeyListener
/* 800B93EC 000B634C  7C 64 1B 78 */	mr r4, r3
/* 800B93F0 000B6350  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 800B93F4 000B6354  7F E5 FB 78 */	mr r5, r31
/* 800B93F8 000B6358  48 01 15 E1 */	bl startMotion__4PikiFR14PaniMotionInfoR14PaniMotionInfo
/* 800B93FC 000B635C  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 800B9400 000B6360  C0 0D B6 A0 */	lfs f0, lbl_803E03C0@sda21(r13)
/* 800B9404 000B6364  D4 03 00 A4 */	stfsu f0, 0xa4(r3)
/* 800B9408 000B6368  C0 0D B6 A4 */	lfs f0, lbl_803E03C4@sda21(r13)
/* 800B940C 000B636C  D0 03 00 04 */	stfs f0, 4(r3)
/* 800B9410 000B6370  C0 0D B6 A8 */	lfs f0, lbl_803E03C8@sda21(r13)
/* 800B9414 000B6374  D0 03 00 08 */	stfs f0, 8(r3)
/* 800B9418 000B6378  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800B941C 000B637C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800B9420 000B6380  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800B9424 000B6384  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800B9428 000B6388  38 21 00 30 */	addi r1, r1, 0x30
/* 800B942C 000B638C  7C 08 03 A6 */	mtlr r0
/* 800B9430 000B6390  4E 80 00 20 */	blr 
.endfn initWatch__7ActMineFv

.fn exeMine__7ActMineFv, global
/* 800B9434 000B6394  7C 08 02 A6 */	mflr r0
/* 800B9438 000B6398  90 01 00 04 */	stw r0, 4(r1)
/* 800B943C 000B639C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800B9440 000B63A0  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800B9444 000B63A4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800B9448 000B63A8  7C 7E 1B 78 */	mr r30, r3
/* 800B944C 000B63AC  C0 0D B6 AC */	lfs f0, lbl_803E03CC@sda21(r13)
/* 800B9450 000B63B0  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800B9454 000B63B4  D4 03 00 A4 */	stfsu f0, 0xa4(r3)
/* 800B9458 000B63B8  C0 0D B6 B0 */	lfs f0, lbl_803E03D0@sda21(r13)
/* 800B945C 000B63BC  D0 03 00 04 */	stfs f0, 4(r3)
/* 800B9460 000B63C0  C0 0D B6 B4 */	lfs f0, lbl_803E03D4@sda21(r13)
/* 800B9464 000B63C4  D0 03 00 08 */	stfs f0, 8(r3)
/* 800B9468 000B63C8  88 1E 00 24 */	lbz r0, 0x24(r30)
/* 800B946C 000B63CC  28 00 00 00 */	cmplwi r0, 0
/* 800B9470 000B63D0  40 82 00 0C */	bne .L_800B947C
/* 800B9474 000B63D4  38 60 00 00 */	li r3, 0
/* 800B9478 000B63D8  48 00 00 F0 */	b .L_800B9568
.L_800B947C:
/* 800B947C 000B63DC  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 800B9480 000B63E0  48 03 E5 D5 */	bl pick__11BombGenItemFv
/* 800B9484 000B63E4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 800B9488 000B63E8  40 82 00 0C */	bne .L_800B9494
/* 800B948C 000B63EC  38 60 00 01 */	li r3, 1
/* 800B9490 000B63F0  48 00 00 D8 */	b .L_800B9568
.L_800B9494:
/* 800B9494 000B63F4  80 6D 30 AC */	lwz r3, itemMgr@sda21(r13)
/* 800B9498 000B63F8  38 80 00 0E */	li r4, 0xe
/* 800B949C 000B63FC  81 83 00 00 */	lwz r12, 0(r3)
/* 800B94A0 000B6400  81 8C 00 78 */	lwz r12, 0x78(r12)
/* 800B94A4 000B6404  7D 88 03 A6 */	mtlr r12
/* 800B94A8 000B6408  4E 80 00 21 */	blrl 
/* 800B94AC 000B640C  7C 7F 1B 79 */	or. r31, r3, r3
/* 800B94B0 000B6410  41 82 00 A8 */	beq .L_800B9558
/* 800B94B4 000B6414  7F E3 FB 78 */	mr r3, r31
/* 800B94B8 000B6418  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 800B94BC 000B641C  81 9F 00 00 */	lwz r12, 0(r31)
/* 800B94C0 000B6420  38 84 00 94 */	addi r4, r4, 0x94
/* 800B94C4 000B6424  81 8C 00 28 */	lwz r12, 0x28(r12)
/* 800B94C8 000B6428  7D 88 03 A6 */	mtlr r12
/* 800B94CC 000B642C  4E 80 00 21 */	blrl 
/* 800B94D0 000B6430  7F E3 FB 78 */	mr r3, r31
/* 800B94D4 000B6434  81 9F 00 00 */	lwz r12, 0(r31)
/* 800B94D8 000B6438  38 80 00 00 */	li r4, 0
/* 800B94DC 000B643C  81 8C 00 34 */	lwz r12, 0x34(r12)
/* 800B94E0 000B6440  7D 88 03 A6 */	mtlr r12
/* 800B94E4 000B6444  4E 80 00 21 */	blrl 
/* 800B94E8 000B6448  7F E3 FB 78 */	mr r3, r31
/* 800B94EC 000B644C  81 9F 00 00 */	lwz r12, 0(r31)
/* 800B94F0 000B6450  81 8C 00 C8 */	lwz r12, 0xc8(r12)
/* 800B94F4 000B6454  7D 88 03 A6 */	mtlr r12
/* 800B94F8 000B6458  4E 80 00 21 */	blrl 
/* 800B94FC 000B645C  3C 60 80 2B */	lis r3, __vt__11Interaction@ha
/* 800B9500 000B6460  80 BE 00 0C */	lwz r5, 0xc(r30)
/* 800B9504 000B6464  38 03 CF 9C */	addi r0, r3, __vt__11Interaction@l
/* 800B9508 000B6468  90 01 00 14 */	stw r0, 0x14(r1)
/* 800B950C 000B646C  3C 60 80 2B */	lis r3, __vt__12InteractGrab@ha
/* 800B9510 000B6470  38 03 D1 D4 */	addi r0, r3, __vt__12InteractGrab@l
/* 800B9514 000B6474  90 A1 00 18 */	stw r5, 0x18(r1)
/* 800B9518 000B6478  38 81 00 14 */	addi r4, r1, 0x14
/* 800B951C 000B647C  38 7F 00 00 */	addi r3, r31, 0
/* 800B9520 000B6480  90 01 00 14 */	stw r0, 0x14(r1)
/* 800B9524 000B6484  81 9F 00 00 */	lwz r12, 0(r31)
/* 800B9528 000B6488  81 8C 00 A0 */	lwz r12, 0xa0(r12)
/* 800B952C 000B648C  7D 88 03 A6 */	mtlr r12
/* 800B9530 000B6490  4E 80 00 21 */	blrl 
/* 800B9534 000B6494  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 800B9538 000B6498  40 82 00 0C */	bne .L_800B9544
/* 800B953C 000B649C  38 60 00 01 */	li r3, 1
/* 800B9540 000B64A0  48 00 00 28 */	b .L_800B9568
.L_800B9544:
/* 800B9544 000B64A4  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 800B9548 000B64A8  38 00 00 06 */	li r0, 6
/* 800B954C 000B64AC  38 60 00 02 */	li r3, 2
/* 800B9550 000B64B0  98 04 04 00 */	stb r0, 0x400(r4)
/* 800B9554 000B64B4  48 00 00 14 */	b .L_800B9568
.L_800B9558:
/* 800B9558 000B64B8  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 800B955C 000B64BC  38 00 00 01 */	li r0, 1
/* 800B9560 000B64C0  38 60 00 01 */	li r3, 1
/* 800B9564 000B64C4  98 04 04 00 */	stb r0, 0x400(r4)
.L_800B9568:
/* 800B9568 000B64C8  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800B956C 000B64CC  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800B9570 000B64D0  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800B9574 000B64D4  38 21 00 28 */	addi r1, r1, 0x28
/* 800B9578 000B64D8  7C 08 03 A6 */	mtlr r0
/* 800B957C 000B64DC  4E 80 00 20 */	blr 
.endfn exeMine__7ActMineFv

.fn exec__7ActMineFv, global
/* 800B9580 000B64E0  7C 08 02 A6 */	mflr r0
/* 800B9584 000B64E4  90 01 00 04 */	stw r0, 4(r1)
/* 800B9588 000B64E8  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 800B958C 000B64EC  93 E1 00 6C */	stw r31, 0x6c(r1)
/* 800B9590 000B64F0  7C 7F 1B 78 */	mr r31, r3
/* 800B9594 000B64F4  93 C1 00 68 */	stw r30, 0x68(r1)
/* 800B9598 000B64F8  93 A1 00 64 */	stw r29, 0x64(r1)
/* 800B959C 000B64FC  80 63 00 18 */	lwz r3, 0x18(r3)
/* 800B95A0 000B6500  28 03 00 00 */	cmplwi r3, 0
/* 800B95A4 000B6504  40 82 00 0C */	bne .L_800B95B0
/* 800B95A8 000B6508  38 60 00 01 */	li r3, 1
/* 800B95AC 000B650C  48 00 01 B8 */	b .L_800B9764
.L_800B95B0:
/* 800B95B0 000B6510  48 03 E4 75 */	bl pickable__11BombGenItemFv
/* 800B95B4 000B6514  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 800B95B8 000B6518  40 82 00 18 */	bne .L_800B95D0
/* 800B95BC 000B651C  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 800B95C0 000B6520  38 00 00 01 */	li r0, 1
/* 800B95C4 000B6524  38 60 00 01 */	li r3, 1
/* 800B95C8 000B6528  98 04 04 00 */	stb r0, 0x400(r4)
/* 800B95CC 000B652C  48 00 01 98 */	b .L_800B9764
.L_800B95D0:
/* 800B95D0 000B6530  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 800B95D4 000B6534  80 04 02 AC */	lwz r0, 0x2ac(r4)
/* 800B95D8 000B6538  28 00 00 00 */	cmplwi r0, 0
/* 800B95DC 000B653C  41 82 00 14 */	beq .L_800B95F0
/* 800B95E0 000B6540  38 00 00 06 */	li r0, 6
/* 800B95E4 000B6544  98 04 04 00 */	stb r0, 0x400(r4)
/* 800B95E8 000B6548  38 60 00 02 */	li r3, 2
/* 800B95EC 000B654C  48 00 01 78 */	b .L_800B9764
.L_800B95F0:
/* 800B95F0 000B6550  A0 1F 00 1C */	lhz r0, 0x1c(r31)
/* 800B95F4 000B6554  38 60 00 00 */	li r3, 0
/* 800B95F8 000B6558  2C 00 00 01 */	cmpwi r0, 1
/* 800B95FC 000B655C  41 82 01 60 */	beq .L_800B975C
/* 800B9600 000B6560  40 80 00 10 */	bge .L_800B9610
/* 800B9604 000B6564  2C 00 00 00 */	cmpwi r0, 0
/* 800B9608 000B6568  40 80 00 18 */	bge .L_800B9620
/* 800B960C 000B656C  48 00 01 58 */	b .L_800B9764
.L_800B9610:
/* 800B9610 000B6570  2C 00 00 03 */	cmpwi r0, 3
/* 800B9614 000B6574  40 80 01 50 */	bge .L_800B9764
/* 800B9618 000B6578  38 60 00 00 */	li r3, 0
/* 800B961C 000B657C  48 00 01 48 */	b .L_800B9764
.L_800B9620:
/* 800B9620 000B6580  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 800B9624 000B6584  39 04 00 94 */	addi r8, r4, 0x94
/* 800B9628 000B6588  C0 04 00 9C */	lfs f0, 0x9c(r4)
/* 800B962C 000B658C  38 C1 00 1C */	addi r6, r1, 0x1c
/* 800B9630 000B6590  C0 23 00 9C */	lfs f1, 0x9c(r3)
/* 800B9634 000B6594  38 E3 00 94 */	addi r7, r3, 0x94
/* 800B9638 000B6598  EC 01 00 28 */	fsubs f0, f1, f0
/* 800B963C 000B659C  38 A1 00 18 */	addi r5, r1, 0x18
/* 800B9640 000B65A0  38 81 00 14 */	addi r4, r1, 0x14
/* 800B9644 000B65A4  38 61 00 48 */	addi r3, r1, 0x48
/* 800B9648 000B65A8  D0 01 00 1C */	stfs f0, 0x1c(r1)
/* 800B964C 000B65AC  C0 27 00 04 */	lfs f1, 4(r7)
/* 800B9650 000B65B0  C0 08 00 04 */	lfs f0, 4(r8)
/* 800B9654 000B65B4  EC 01 00 28 */	fsubs f0, f1, f0
/* 800B9658 000B65B8  D0 01 00 18 */	stfs f0, 0x18(r1)
/* 800B965C 000B65BC  C0 27 00 00 */	lfs f1, 0(r7)
/* 800B9660 000B65C0  C0 08 00 00 */	lfs f0, 0(r8)
/* 800B9664 000B65C4  EC 01 00 28 */	fsubs f0, f1, f0
/* 800B9668 000B65C8  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 800B966C 000B65CC  4B F7 DA B1 */	bl __ct__8Vector3fFRCfRCfRCf
/* 800B9670 000B65D0  C0 21 00 48 */	lfs f1, 0x48(r1)
/* 800B9674 000B65D4  C0 01 00 4C */	lfs f0, 0x4c(r1)
/* 800B9678 000B65D8  D0 21 00 38 */	stfs f1, 0x38(r1)
/* 800B967C 000B65DC  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 800B9680 000B65E0  C0 01 00 50 */	lfs f0, 0x50(r1)
/* 800B9684 000B65E4  D0 01 00 40 */	stfs f0, 0x40(r1)
/* 800B9688 000B65E8  C0 21 00 38 */	lfs f1, 0x38(r1)
/* 800B968C 000B65EC  C0 01 00 3C */	lfs f0, 0x3c(r1)
/* 800B9690 000B65F0  EC 21 00 72 */	fmuls f1, f1, f1
/* 800B9694 000B65F4  C0 41 00 40 */	lfs f2, 0x40(r1)
/* 800B9698 000B65F8  EC 00 00 32 */	fmuls f0, f0, f0
/* 800B969C 000B65FC  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800B96A0 000B6600  EC 01 00 2A */	fadds f0, f1, f0
/* 800B96A4 000B6604  EC 22 00 2A */	fadds f1, f2, f0
/* 800B96A8 000B6608  4B F5 45 99 */	bl sqrtf__3stdFf
/* 800B96AC 000B660C  C0 02 92 88 */	lfs f0, lbl_803E9488@sda21(r2)
/* 800B96B0 000B6610  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 800B96B4 000B6614  41 82 00 28 */	beq .L_800B96DC
/* 800B96B8 000B6618  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 800B96BC 000B661C  EC 00 08 24 */	fdivs f0, f0, f1
/* 800B96C0 000B6620  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 800B96C4 000B6624  C0 01 00 3C */	lfs f0, 0x3c(r1)
/* 800B96C8 000B6628  EC 00 08 24 */	fdivs f0, f0, f1
/* 800B96CC 000B662C  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 800B96D0 000B6630  C0 01 00 40 */	lfs f0, 0x40(r1)
/* 800B96D4 000B6634  EC 00 08 24 */	fdivs f0, f0, f1
/* 800B96D8 000B6638  D0 01 00 40 */	stfs f0, 0x40(r1)
.L_800B96DC:
/* 800B96DC 000B663C  C0 02 92 8C */	lfs f0, lbl_803E948C@sda21(r2)
/* 800B96E0 000B6640  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800B96E4 000B6644  40 80 00 60 */	bge .L_800B9744
/* 800B96E8 000B6648  28 1F 00 00 */	cmplwi r31, 0
/* 800B96EC 000B664C  3B BF 00 00 */	addi r29, r31, 0
/* 800B96F0 000B6650  41 82 00 08 */	beq .L_800B96F8
/* 800B96F4 000B6654  83 BF 00 14 */	lwz r29, 0x14(r31)
.L_800B96F8:
/* 800B96F8 000B6658  38 61 00 28 */	addi r3, r1, 0x28
/* 800B96FC 000B665C  38 80 00 04 */	li r4, 4
/* 800B9700 000B6660  48 06 58 59 */	bl __ct__14PaniMotionInfoFi
/* 800B9704 000B6664  3B C3 00 00 */	addi r30, r3, 0
/* 800B9708 000B6668  38 BD 00 00 */	addi r5, r29, 0
/* 800B970C 000B666C  38 61 00 20 */	addi r3, r1, 0x20
/* 800B9710 000B6670  38 80 00 04 */	li r4, 4
/* 800B9714 000B6674  48 06 58 79 */	bl __ct__14PaniMotionInfoFiP19PaniAnimKeyListener
/* 800B9718 000B6678  7C 64 1B 78 */	mr r4, r3
/* 800B971C 000B667C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 800B9720 000B6680  7F C5 F3 78 */	mr r5, r30
/* 800B9724 000B6684  48 01 12 B5 */	bl startMotion__4PikiFR14PaniMotionInfoR14PaniMotionInfo
/* 800B9728 000B6688  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 800B972C 000B668C  48 01 14 E1 */	bl enableMotionBlend__4PikiFv
/* 800B9730 000B6690  38 00 00 00 */	li r0, 0
/* 800B9734 000B6694  98 1F 00 24 */	stb r0, 0x24(r31)
/* 800B9738 000B6698  38 00 00 01 */	li r0, 1
/* 800B973C 000B669C  B0 1F 00 1C */	sth r0, 0x1c(r31)
/* 800B9740 000B66A0  48 00 00 14 */	b .L_800B9754
.L_800B9744:
/* 800B9744 000B66A4  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 800B9748 000B66A8  38 81 00 38 */	addi r4, r1, 0x38
/* 800B974C 000B66AC  C0 22 92 90 */	lfs f1, lbl_803E9490@sda21(r2)
/* 800B9750 000B66B0  48 01 26 89 */	bl setSpeed__4PikiFfR8Vector3f
.L_800B9754:
/* 800B9754 000B66B4  38 60 00 00 */	li r3, 0
/* 800B9758 000B66B8  48 00 00 0C */	b .L_800B9764
.L_800B975C:
/* 800B975C 000B66BC  7F E3 FB 78 */	mr r3, r31
/* 800B9760 000B66C0  4B FF FC D5 */	bl exeMine__7ActMineFv
.L_800B9764:
/* 800B9764 000B66C4  80 01 00 74 */	lwz r0, 0x74(r1)
/* 800B9768 000B66C8  83 E1 00 6C */	lwz r31, 0x6c(r1)
/* 800B976C 000B66CC  83 C1 00 68 */	lwz r30, 0x68(r1)
/* 800B9770 000B66D0  83 A1 00 64 */	lwz r29, 0x64(r1)
/* 800B9774 000B66D4  38 21 00 70 */	addi r1, r1, 0x70
/* 800B9778 000B66D8  7C 08 03 A6 */	mtlr r0
/* 800B977C 000B66DC  4E 80 00 20 */	blr 
.endfn exec__7ActMineFv

.fn cleanup__7ActMineFv, global
/* 800B9780 000B66E0  4E 80 00 20 */	blr 
.endfn cleanup__7ActMineFv

.fn animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent, global
/* 800B9784 000B66E4  7C 08 02 A6 */	mflr r0
/* 800B9788 000B66E8  90 01 00 04 */	stw r0, 4(r1)
/* 800B978C 000B66EC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800B9790 000B66F0  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800B9794 000B66F4  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800B9798 000B66F8  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800B979C 000B66FC  3B A3 00 00 */	addi r29, r3, 0
/* 800B97A0 000B6700  80 04 00 00 */	lwz r0, 0(r4)
/* 800B97A4 000B6704  2C 00 00 01 */	cmpwi r0, 1
/* 800B97A8 000B6708  41 82 00 6C */	beq .L_800B9814
/* 800B97AC 000B670C  40 80 00 7C */	bge .L_800B9828
/* 800B97B0 000B6710  2C 00 00 00 */	cmpwi r0, 0
/* 800B97B4 000B6714  40 80 00 08 */	bge .L_800B97BC
/* 800B97B8 000B6718  48 00 00 70 */	b .L_800B9828
.L_800B97BC:
/* 800B97BC 000B671C  A0 1D 00 1C */	lhz r0, 0x1c(r29)
/* 800B97C0 000B6720  28 00 00 02 */	cmplwi r0, 2
/* 800B97C4 000B6724  40 82 00 64 */	bne .L_800B9828
/* 800B97C8 000B6728  28 1D 00 00 */	cmplwi r29, 0
/* 800B97CC 000B672C  3B DD 00 00 */	addi r30, r29, 0
/* 800B97D0 000B6730  41 82 00 08 */	beq .L_800B97D8
/* 800B97D4 000B6734  83 DD 00 14 */	lwz r30, 0x14(r29)
.L_800B97D8:
/* 800B97D8 000B6738  38 61 00 18 */	addi r3, r1, 0x18
/* 800B97DC 000B673C  38 80 00 02 */	li r4, 2
/* 800B97E0 000B6740  48 06 57 79 */	bl __ct__14PaniMotionInfoFi
/* 800B97E4 000B6744  3B E3 00 00 */	addi r31, r3, 0
/* 800B97E8 000B6748  38 BE 00 00 */	addi r5, r30, 0
/* 800B97EC 000B674C  38 61 00 10 */	addi r3, r1, 0x10
/* 800B97F0 000B6750  38 80 00 02 */	li r4, 2
/* 800B97F4 000B6754  48 06 57 99 */	bl __ct__14PaniMotionInfoFiP19PaniAnimKeyListener
/* 800B97F8 000B6758  7C 64 1B 78 */	mr r4, r3
/* 800B97FC 000B675C  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 800B9800 000B6760  7F E5 FB 78 */	mr r5, r31
/* 800B9804 000B6764  48 01 11 D5 */	bl startMotion__4PikiFR14PaniMotionInfoR14PaniMotionInfo
/* 800B9808 000B6768  38 00 00 00 */	li r0, 0
/* 800B980C 000B676C  B0 1D 00 1C */	sth r0, 0x1c(r29)
/* 800B9810 000B6770  48 00 00 18 */	b .L_800B9828
.L_800B9814:
/* 800B9814 000B6774  A0 1D 00 1C */	lhz r0, 0x1c(r29)
/* 800B9818 000B6778  28 00 00 01 */	cmplwi r0, 1
/* 800B981C 000B677C  40 82 00 0C */	bne .L_800B9828
/* 800B9820 000B6780  38 00 00 01 */	li r0, 1
/* 800B9824 000B6784  98 1D 00 24 */	stb r0, 0x24(r29)
.L_800B9828:
/* 800B9828 000B6788  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800B982C 000B678C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800B9830 000B6790  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800B9834 000B6794  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800B9838 000B6798  38 21 00 30 */	addi r1, r1, 0x30
/* 800B983C 000B679C  7C 08 03 A6 */	mtlr r0
/* 800B9840 000B67A0  4E 80 00 20 */	blr 
.endfn animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent

.fn __dt__7ActMineFv, weak
/* 800B9844 000B67A4  7C 08 02 A6 */	mflr r0
/* 800B9848 000B67A8  90 01 00 04 */	stw r0, 4(r1)
/* 800B984C 000B67AC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800B9850 000B67B0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800B9854 000B67B4  3B E4 00 00 */	addi r31, r4, 0
/* 800B9858 000B67B8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800B985C 000B67BC  7C 7E 1B 79 */	or. r30, r3, r3
/* 800B9860 000B67C0  41 82 00 48 */	beq .L_800B98A8
/* 800B9864 000B67C4  3C 60 80 2B */	lis r3, __vt__7ActMine@ha
/* 800B9868 000B67C8  38 63 68 50 */	addi r3, r3, __vt__7ActMine@l
/* 800B986C 000B67CC  90 7E 00 00 */	stw r3, 0(r30)
/* 800B9870 000B67D0  38 C3 00 68 */	addi r6, r3, 0x68
/* 800B9874 000B67D4  38 1E 00 28 */	addi r0, r30, 0x28
/* 800B9878 000B67D8  80 BE 00 14 */	lwz r5, 0x14(r30)
/* 800B987C 000B67DC  38 7E 00 00 */	addi r3, r30, 0
/* 800B9880 000B67E0  38 80 00 00 */	li r4, 0
/* 800B9884 000B67E4  90 C5 00 00 */	stw r6, 0(r5)
/* 800B9888 000B67E8  80 BE 00 14 */	lwz r5, 0x14(r30)
/* 800B988C 000B67EC  7C 05 00 50 */	subf r0, r5, r0
/* 800B9890 000B67F0  90 05 00 04 */	stw r0, 4(r5)
/* 800B9894 000B67F4  48 00 A5 75 */	bl __dt__6ActionFv
/* 800B9898 000B67F8  7F E0 07 35 */	extsh. r0, r31
/* 800B989C 000B67FC  40 81 00 0C */	ble .L_800B98A8
/* 800B98A0 000B6800  7F C3 F3 78 */	mr r3, r30
/* 800B98A4 000B6804  4B F8 D9 09 */	bl __dl__FPv
.L_800B98A8:
/* 800B98A8 000B6808  7F C3 F3 78 */	mr r3, r30
/* 800B98AC 000B680C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800B98B0 000B6810  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800B98B4 000B6814  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800B98B8 000B6818  38 21 00 18 */	addi r1, r1, 0x18
/* 800B98BC 000B681C  7C 08 03 A6 */	mtlr r0
/* 800B98C0 000B6820  4E 80 00 20 */	blr 
.endfn __dt__7ActMineFv

.fn "@40@4@animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent", weak
/* 800B98C4 000B6824  39 60 00 04 */	li r11, 4
/* 800B98C8 000B6828  7D 63 58 2E */	lwzx r11, r3, r11
/* 800B98CC 000B682C  7C 63 5A 14 */	add r3, r3, r11
/* 800B98D0 000B6830  38 63 FF D8 */	addi r3, r3, -40
/* 800B98D4 000B6834  4B FF FE B0 */	b animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent
.endfn "@40@4@animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent"

.section .data, "wa"  # 0x80222DC0 - 0x802E9640
.balign 8
.obj lbl_802B67F8, local
	.asciz "aiMine.cpp"
.endobj lbl_802B67F8
.balign 4
.obj lbl_802B6804, local
	.asciz "PaniAnimKeyListener"
.endobj lbl_802B6804
.balign 4
.obj lbl_802B6818, local
	.asciz "Receiver<Piki>"
.endobj lbl_802B6818
.balign 4
.obj lbl_802B6828, local
	.4byte "__RTTI__15Receiver<4Piki>"
	.4byte 0
	.4byte 0
.endobj lbl_802B6828
.obj lbl_802B6834, local
	.4byte __RTTI__19PaniAnimKeyListener
	.4byte 0x28
	.4byte "__RTTI__15Receiver<4Piki>"
	.4byte 0
	.4byte __RTTI__6Action
	.4byte 0
	.4byte 0
.endobj lbl_802B6834
.obj __vt__7ActMine, global
	.4byte __RTTI__7ActMine
	.4byte 0
	.4byte "procMsg__15Receiver<4Piki>FP4PikiP3Msg"
	.4byte "procBounceMsg__15Receiver<4Piki>FP4PikiP9MsgBounce"
	.4byte "procStickMsg__15Receiver<4Piki>FP4PikiP8MsgStick"
	.4byte "procHangMsg__15Receiver<4Piki>FP4PikiP7MsgHang"
	.4byte "procTargetMsg__15Receiver<4Piki>FP4PikiP9MsgTarget"
	.4byte "procCollideMsg__15Receiver<4Piki>FP4PikiP10MsgCollide"
	.4byte "procAnimMsg__15Receiver<4Piki>FP4PikiP7MsgAnim"
	.4byte "procDamageMsg__15Receiver<4Piki>FP4PikiP9MsgDamage"
	.4byte "procWallMsg__15Receiver<4Piki>FP4PikiP7MsgWall"
	.4byte "procOffWallMsg__15Receiver<4Piki>FP4PikiP10MsgOffWall"
	.4byte "procUserMsg__15Receiver<4Piki>FP4PikiP7MsgUser"
	.4byte "procGroundMsg__15Receiver<4Piki>FP4PikiP9MsgGround"
	.4byte defaultInitialiser__6ActionFv
	.4byte dump__6ActionFv
	.4byte draw__6ActionFR8Graphics
	.4byte __dt__7ActMineFv
	.4byte init__7ActMineFP8Creature
	.4byte exec__7ActMineFv
	.4byte cleanup__7ActMineFv
	.4byte resume__6ActionFv
	.4byte restart__6ActionFv
	.4byte resumable__6ActionFv
	.4byte getInfo__6ActionFPc
	.4byte animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent
	.4byte __RTTI__7ActMine
	.4byte 0xFFFFFFD8
	.4byte "@40@4@animationKeyUpdated__7ActMineFR16PaniAnimKeyEvent"
.endobj __vt__7ActMine
.balign 4
.obj lbl_802B68C4, local
	.asciz "Interaction"
.endobj lbl_802B68C4
.balign 4
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
.obj lbl_802B6908, local
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x30)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x58)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x6C)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x80)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x94)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0xA8)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0xBC)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0xD0)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0x44)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0xF8)
	.4byte ("procMsg__15Receiver<4Piki>FP4PikiP3Msg"+0xE4)
.endobj lbl_802B6908

.section .sdata, "wa"  # 0x803DCD20 - 0x803E7820
.balign 8
.obj lbl_803E03C0, local
	.float 0.0
.endobj lbl_803E03C0
.obj lbl_803E03C4, local
	.float 0.0
.endobj lbl_803E03C4
.obj lbl_803E03C8, local
	.float 0.0
.endobj lbl_803E03C8
.obj lbl_803E03CC, local
	.float 0.0
.endobj lbl_803E03CC
.obj lbl_803E03D0, local
	.float 0.0
.endobj lbl_803E03D0
.obj lbl_803E03D4, local
	.float 0.0
.endobj lbl_803E03D4
.balign 4
.obj lbl_803E03D8, local
	.asciz "ActMine"
.endobj lbl_803E03D8
.balign 4
.obj __RTTI__19PaniAnimKeyListener, local
	.4byte lbl_802B6804
	.4byte 0
.endobj __RTTI__19PaniAnimKeyListener
.obj "__RTTI__15Receiver<4Piki>", local
	.4byte lbl_802B6818
	.4byte 0
.endobj "__RTTI__15Receiver<4Piki>"
.balign 4
.obj lbl_803E03F0, local
	.asciz "Action"
.endobj lbl_803E03F0
.balign 4
.obj __RTTI__6Action, local
	.4byte lbl_803E03F0
	.4byte lbl_802B6828
.endobj __RTTI__6Action
.obj __RTTI__7ActMine, local
	.4byte lbl_803E03D8
	.4byte lbl_802B6834
.endobj __RTTI__7ActMine

.section .sdata2, "a"  # 0x803E8200 - 0x803EC840
.balign 8
.obj lbl_803E9488, local
	.float 0.0
.endobj lbl_803E9488
.obj lbl_803E948C, local
	.float 15.0
.endobj lbl_803E948C
.obj lbl_803E9490, local
	.float 0.7
.endobj lbl_803E9490
