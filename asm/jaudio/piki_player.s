.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.balign 32, 0
.fn Jac_Orima_Walk, global
/* 80018120 00015080  7C 08 02 A6 */	mflr r0
/* 80018124 00015084  90 01 00 04 */	stw r0, 4(r1)
/* 80018128 00015088  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001812C 0001508C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80018130 00015090  3B E3 00 00 */	addi r31, r3, 0
/* 80018134 00015094  88 0D 2C 98 */	lbz r0, init$72@sda21(r13)
/* 80018138 00015098  7C 00 07 75 */	extsb. r0, r0
/* 8001813C 0001509C  40 82 00 14 */	bne .L_80018150
/* 80018140 000150A0  38 60 00 00 */	li r3, 0
/* 80018144 000150A4  38 00 00 01 */	li r0, 1
/* 80018148 000150A8  90 6D 2C 94 */	stw r3, seqp$71@sda21(r13)
/* 8001814C 000150AC  98 0D 2C 98 */	stb r0, init$72@sda21(r13)
.L_80018150:
/* 80018150 000150B0  88 0D 2C 9A */	lbz r0, init$75@sda21(r13)
/* 80018154 000150B4  7C 00 07 75 */	extsb. r0, r0
/* 80018158 000150B8  40 82 00 14 */	bne .L_8001816C
/* 8001815C 000150BC  38 60 00 00 */	li r3, 0
/* 80018160 000150C0  38 00 00 01 */	li r0, 1
/* 80018164 000150C4  98 6D 2C 99 */	stb r3, status$74@sda21(r13)
/* 80018168 000150C8  98 0D 2C 9A */	stb r0, init$75@sda21(r13)
.L_8001816C:
/* 8001816C 000150CC  80 0D 2C 94 */	lwz r0, seqp$71@sda21(r13)
/* 80018170 000150D0  38 60 00 00 */	li r3, 0
/* 80018174 000150D4  90 6D 2C 90 */	stw r3, gaya_timer@sda21(r13)
/* 80018178 000150D8  28 00 00 00 */	cmplwi r0, 0
/* 8001817C 000150DC  40 82 00 20 */	bne .L_8001819C
/* 80018180 000150E0  3C 60 00 01 */	lis r3, 0x00010008@ha
/* 80018184 000150E4  38 63 00 08 */	addi r3, r3, 0x00010008@l
/* 80018188 000150E8  4B FF 84 D9 */	bl Jam_GetTrackHandle
/* 8001818C 000150EC  90 6D 2C 94 */	stw r3, seqp$71@sda21(r13)
/* 80018190 000150F0  80 0D 2C 94 */	lwz r0, seqp$71@sda21(r13)
/* 80018194 000150F4  28 00 00 00 */	cmplwi r0, 0
/* 80018198 000150F8  41 82 00 50 */	beq .L_800181E8
.L_8001819C:
/* 8001819C 000150FC  48 00 20 45 */	bl Jac_DemoWalkCheck__Fv
/* 800181A0 00015100  2C 03 00 00 */	cmpwi r3, 0
/* 800181A4 00015104  41 82 00 44 */	beq .L_800181E8
/* 800181A8 00015108  88 0D 2C 99 */	lbz r0, status$74@sda21(r13)
/* 800181AC 0001510C  28 00 00 00 */	cmplwi r0, 0
/* 800181B0 00015110  40 82 00 20 */	bne .L_800181D0
/* 800181B4 00015114  80 6D 2C 94 */	lwz r3, seqp$71@sda21(r13)
/* 800181B8 00015118  57 E5 04 3E */	clrlwi r5, r31, 0x10
/* 800181BC 0001511C  38 80 00 00 */	li r4, 0
/* 800181C0 00015120  4B FF 81 C1 */	bl Jam_WritePortAppDirect
/* 800181C4 00015124  38 00 00 01 */	li r0, 1
/* 800181C8 00015128  98 0D 2C 99 */	stb r0, status$74@sda21(r13)
/* 800181CC 0001512C  48 00 00 1C */	b .L_800181E8
.L_800181D0:
/* 800181D0 00015130  80 6D 2C 94 */	lwz r3, seqp$71@sda21(r13)
/* 800181D4 00015134  57 E5 04 3E */	clrlwi r5, r31, 0x10
/* 800181D8 00015138  38 80 00 00 */	li r4, 0
/* 800181DC 0001513C  4B FF 81 A5 */	bl Jam_WritePortAppDirect
/* 800181E0 00015140  38 00 00 00 */	li r0, 0
/* 800181E4 00015144  98 0D 2C 99 */	stb r0, status$74@sda21(r13)
.L_800181E8:
/* 800181E8 00015148  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800181EC 0001514C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800181F0 00015150  38 21 00 18 */	addi r1, r1, 0x18
/* 800181F4 00015154  7C 08 03 A6 */	mtlr r0
/* 800181F8 00015158  4E 80 00 20 */	blr 
.endfn Jac_Orima_Walk

.balign 32, 0
.fn Jac_Orima_Formation, global
/* 80018200 00015160  7C 08 02 A6 */	mflr r0
/* 80018204 00015164  90 01 00 04 */	stw r0, 4(r1)
/* 80018208 00015168  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8001820C 0001516C  BF C1 00 28 */	stmw r30, 0x28(r1)
/* 80018210 00015170  3B C3 00 00 */	addi r30, r3, 0
/* 80018214 00015174  3B E4 00 00 */	addi r31, r4, 0
/* 80018218 00015178  88 0D 2C A4 */	lbz r0, init$88@sda21(r13)
/* 8001821C 0001517C  7C 00 07 75 */	extsb. r0, r0
/* 80018220 00015180  40 82 00 14 */	bne .L_80018234
/* 80018224 00015184  38 60 00 00 */	li r3, 0
/* 80018228 00015188  38 00 00 01 */	li r0, 1
/* 8001822C 0001518C  90 6D 2C A0 */	stw r3, flag$87@sda21(r13)
/* 80018230 00015190  98 0D 2C A4 */	stb r0, init$88@sda21(r13)
.L_80018234:
/* 80018234 00015194  80 0D 2C 9C */	lwz r0, stick_seqp@sda21(r13)
/* 80018238 00015198  28 00 00 00 */	cmplwi r0, 0
/* 8001823C 0001519C  40 82 00 20 */	bne .L_8001825C
/* 80018240 000151A0  3C 60 00 01 */	lis r3, 0x00010007@ha
/* 80018244 000151A4  38 63 00 07 */	addi r3, r3, 0x00010007@l
/* 80018248 000151A8  4B FF 84 19 */	bl Jam_GetTrackHandle
/* 8001824C 000151AC  90 6D 2C 9C */	stw r3, stick_seqp@sda21(r13)
/* 80018250 000151B0  80 0D 2C 9C */	lwz r0, stick_seqp@sda21(r13)
/* 80018254 000151B4  28 00 00 00 */	cmplwi r0, 0
/* 80018258 000151B8  41 82 01 24 */	beq .L_8001837C
.L_8001825C:
/* 8001825C 000151BC  48 00 1F 25 */	bl Jac_DemoCheck__Fv
/* 80018260 000151C0  2C 03 00 01 */	cmpwi r3, 1
/* 80018264 000151C4  40 82 00 0C */	bne .L_80018270
/* 80018268 000151C8  3B C0 00 00 */	li r30, 0
/* 8001826C 000151CC  3B E0 00 00 */	li r31, 0
.L_80018270:
/* 80018270 000151D0  4B FF E8 91 */	bl Jac_PauseCheck
/* 80018274 000151D4  2C 03 00 01 */	cmpwi r3, 1
/* 80018278 000151D8  40 82 00 0C */	bne .L_80018284
/* 8001827C 000151DC  3B C0 00 00 */	li r30, 0
/* 80018280 000151E0  3B E0 00 00 */	li r31, 0
.L_80018284:
/* 80018284 000151E4  2C 1E FF 81 */	cmpwi r30, -127
/* 80018288 000151E8  40 80 00 08 */	bge .L_80018290
/* 8001828C 000151EC  3B C0 FF 81 */	li r30, -127
.L_80018290:
/* 80018290 000151F0  2C 1E 00 7F */	cmpwi r30, 0x7f
/* 80018294 000151F4  40 81 00 08 */	ble .L_8001829C
/* 80018298 000151F8  3B C0 00 7F */	li r30, 0x7f
.L_8001829C:
/* 8001829C 000151FC  2C 1F FF 81 */	cmpwi r31, -127
/* 800182A0 00015200  40 80 00 08 */	bge .L_800182A8
/* 800182A4 00015204  3B E0 FF 81 */	li r31, -127
.L_800182A8:
/* 800182A8 00015208  2C 1F 00 7F */	cmpwi r31, 0x7f
/* 800182AC 0001520C  40 81 00 08 */	ble .L_800182B4
/* 800182B0 00015210  3B E0 00 7F */	li r31, 0x7f
.L_800182B4:
/* 800182B4 00015214  2C 1F 00 00 */	cmpwi r31, 0
/* 800182B8 00015218  40 80 00 08 */	bge .L_800182C0
/* 800182BC 0001521C  7F FF 00 D0 */	neg r31, r31
.L_800182C0:
/* 800182C0 00015220  7C 9E F1 D6 */	mullw r4, r30, r30
/* 800182C4 00015224  3C 00 43 30 */	lis r0, 0x4330
/* 800182C8 00015228  C8 22 81 B8 */	lfd f1, lbl_803E83B8@sda21(r2)
/* 800182CC 0001522C  7C 7F F9 D6 */	mullw r3, r31, r31
/* 800182D0 00015230  7C 64 1A 14 */	add r3, r4, r3
/* 800182D4 00015234  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 800182D8 00015238  90 61 00 24 */	stw r3, 0x24(r1)
/* 800182DC 0001523C  90 01 00 20 */	stw r0, 0x20(r1)
/* 800182E0 00015240  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 800182E4 00015244  EC 20 08 28 */	fsubs f1, f0, f1
/* 800182E8 00015248  4B FF 59 39 */	bl sqrtf2__Ff
/* 800182EC 0001524C  FC 00 08 1E */	fctiwz f0, f1
/* 800182F0 00015250  80 6D 2C 9C */	lwz r3, stick_seqp@sda21(r13)
/* 800182F4 00015254  57 C5 04 3E */	clrlwi r5, r30, 0x10
/* 800182F8 00015258  38 80 00 02 */	li r4, 2
/* 800182FC 0001525C  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80018300 00015260  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80018304 00015264  4B FF 80 7D */	bl Jam_WritePortAppDirect
/* 80018308 00015268  80 6D 2C 9C */	lwz r3, stick_seqp@sda21(r13)
/* 8001830C 0001526C  57 E5 04 3E */	clrlwi r5, r31, 0x10
/* 80018310 00015270  38 80 00 03 */	li r4, 3
/* 80018314 00015274  4B FF 80 6D */	bl Jam_WritePortAppDirect
/* 80018318 00015278  2C 1E 00 00 */	cmpwi r30, 0
/* 8001831C 0001527C  40 82 00 34 */	bne .L_80018350
/* 80018320 00015280  2C 1F 00 00 */	cmpwi r31, 0
/* 80018324 00015284  40 82 00 2C */	bne .L_80018350
/* 80018328 00015288  80 0D 2C A0 */	lwz r0, flag$87@sda21(r13)
/* 8001832C 0001528C  2C 00 00 00 */	cmpwi r0, 0
/* 80018330 00015290  41 82 00 4C */	beq .L_8001837C
/* 80018334 00015294  80 6D 2C 9C */	lwz r3, stick_seqp@sda21(r13)
/* 80018338 00015298  38 80 00 00 */	li r4, 0
/* 8001833C 0001529C  38 A0 00 00 */	li r5, 0
/* 80018340 000152A0  4B FF 80 41 */	bl Jam_WritePortAppDirect
/* 80018344 000152A4  38 00 00 00 */	li r0, 0
/* 80018348 000152A8  90 0D 2C A0 */	stw r0, flag$87@sda21(r13)
/* 8001834C 000152AC  48 00 00 30 */	b .L_8001837C
.L_80018350:
/* 80018350 000152B0  80 0D 2C A0 */	lwz r0, flag$87@sda21(r13)
/* 80018354 000152B4  2C 00 00 00 */	cmpwi r0, 0
/* 80018358 000152B8  40 82 00 1C */	bne .L_80018374
/* 8001835C 000152BC  80 6D 2C 9C */	lwz r3, stick_seqp@sda21(r13)
/* 80018360 000152C0  38 80 00 00 */	li r4, 0
/* 80018364 000152C4  38 A0 00 01 */	li r5, 1
/* 80018368 000152C8  4B FF 80 19 */	bl Jam_WritePortAppDirect
/* 8001836C 000152CC  38 00 00 01 */	li r0, 1
/* 80018370 000152D0  90 0D 2C A0 */	stw r0, flag$87@sda21(r13)
.L_80018374:
/* 80018374 000152D4  38 00 00 00 */	li r0, 0
/* 80018378 000152D8  90 0D 2C 90 */	stw r0, gaya_timer@sda21(r13)
.L_8001837C:
/* 8001837C 000152DC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80018380 000152E0  BB C1 00 28 */	lmw r30, 0x28(r1)
/* 80018384 000152E4  38 21 00 30 */	addi r1, r1, 0x30
/* 80018388 000152E8  7C 08 03 A6 */	mtlr r0
/* 8001838C 000152EC  4E 80 00 20 */	blr 
.endfn Jac_Orima_Formation

.balign 32, 0
.fn Jac_PlayOrimaSe, global
/* 800183A0 00015300  7C 08 02 A6 */	mflr r0
/* 800183A4 00015304  90 01 00 04 */	stw r0, 4(r1)
/* 800183A8 00015308  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800183AC 0001530C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800183B0 00015310  3B E3 00 00 */	addi r31, r3, 0
/* 800183B4 00015314  88 0D 2C AD */	lbz r0, init$121@sda21(r13)
/* 800183B8 00015318  7C 00 07 75 */	extsb. r0, r0
/* 800183BC 0001531C  40 82 00 14 */	bne .L_800183D0
/* 800183C0 00015320  38 60 00 00 */	li r3, 0
/* 800183C4 00015324  38 00 00 01 */	li r0, 1
/* 800183C8 00015328  98 6D 2C AC */	stb r3, status$120@sda21(r13)
/* 800183CC 0001532C  98 0D 2C AD */	stb r0, init$121@sda21(r13)
.L_800183D0:
/* 800183D0 00015330  88 0D 2C B4 */	lbz r0, init$125@sda21(r13)
/* 800183D4 00015334  7C 00 07 75 */	extsb. r0, r0
/* 800183D8 00015338  40 82 00 14 */	bne .L_800183EC
/* 800183DC 0001533C  38 60 00 00 */	li r3, 0
/* 800183E0 00015340  38 00 00 01 */	li r0, 1
/* 800183E4 00015344  90 6D 2C B0 */	stw r3, cmdqueue_reset$124@sda21(r13)
/* 800183E8 00015348  98 0D 2C B4 */	stb r0, init$125@sda21(r13)
.L_800183EC:
/* 800183EC 0001534C  80 0D 2C A8 */	lwz r0, orima_seqp@sda21(r13)
/* 800183F0 00015350  28 00 00 00 */	cmplwi r0, 0
/* 800183F4 00015354  40 82 00 20 */	bne .L_80018414
/* 800183F8 00015358  3C 60 00 01 */	lis r3, 0x0001000A@ha
/* 800183FC 0001535C  38 63 00 0A */	addi r3, r3, 0x0001000A@l
/* 80018400 00015360  4B FF 82 61 */	bl Jam_GetTrackHandle
/* 80018404 00015364  90 6D 2C A8 */	stw r3, orima_seqp@sda21(r13)
/* 80018408 00015368  80 0D 2C A8 */	lwz r0, orima_seqp@sda21(r13)
/* 8001840C 0001536C  28 00 00 00 */	cmplwi r0, 0
/* 80018410 00015370  41 82 01 CC */	beq .L_800185DC
.L_80018414:
/* 80018414 00015374  80 0D 2C B0 */	lwz r0, cmdqueue_reset$124@sda21(r13)
/* 80018418 00015378  2C 00 00 00 */	cmpwi r0, 0
/* 8001841C 0001537C  40 82 00 20 */	bne .L_8001843C
/* 80018420 00015380  3C 60 80 36 */	lis r3, player_se$123@ha
/* 80018424 00015384  80 8D 2C A8 */	lwz r4, orima_seqp@sda21(r13)
/* 80018428 00015388  38 63 37 C8 */	addi r3, r3, player_se$123@l
/* 8001842C 0001538C  38 A0 00 00 */	li r5, 0
/* 80018430 00015390  48 00 35 71 */	bl Jal_AddCmdQueue
/* 80018434 00015394  38 00 00 01 */	li r0, 1
/* 80018438 00015398  90 0D 2C B0 */	stw r0, cmdqueue_reset$124@sda21(r13)
.L_8001843C:
/* 8001843C 0001539C  57 E0 04 21 */	rlwinm. r0, r31, 0, 0x10, 0x10
/* 80018440 000153A0  41 82 00 74 */	beq .L_800184B4
/* 80018444 000153A4  88 0D 2C BC */	lbz r0, init$136@sda21(r13)
/* 80018448 000153A8  7C 00 07 75 */	extsb. r0, r0
/* 8001844C 000153AC  40 82 00 14 */	bne .L_80018460
/* 80018450 000153B0  38 60 00 00 */	li r3, 0
/* 80018454 000153B4  38 00 00 01 */	li r0, 1
/* 80018458 000153B8  90 6D 2C B8 */	stw r3, flyready$135@sda21(r13)
/* 8001845C 000153BC  98 0D 2C BC */	stb r0, init$136@sda21(r13)
.L_80018460:
/* 80018460 000153C0  48 00 1D 21 */	bl Jac_DemoCheck__Fv
/* 80018464 000153C4  2C 03 00 01 */	cmpwi r3, 1
/* 80018468 000153C8  41 82 01 74 */	beq .L_800185DC
/* 8001846C 000153CC  80 0D 2C B8 */	lwz r0, flyready$135@sda21(r13)
/* 80018470 000153D0  2C 00 00 00 */	cmpwi r0, 0
/* 80018474 000153D4  41 82 00 0C */	beq .L_80018480
/* 80018478 000153D8  28 1F 80 04 */	cmplwi r31, 0x8004
/* 8001847C 000153DC  41 82 01 60 */	beq .L_800185DC
.L_80018480:
/* 80018480 000153E0  80 6D 2C A8 */	lwz r3, orima_seqp@sda21(r13)
/* 80018484 000153E4  57 E5 04 7E */	clrlwi r5, r31, 0x11
/* 80018488 000153E8  38 80 00 01 */	li r4, 1
/* 8001848C 000153EC  4B FF 7E F5 */	bl Jam_WritePortAppDirect
/* 80018490 000153F0  28 1F 80 02 */	cmplwi r31, 0x8002
/* 80018494 000153F4  40 82 00 0C */	bne .L_800184A0
/* 80018498 000153F8  38 00 00 00 */	li r0, 0
/* 8001849C 000153FC  90 0D 2C B8 */	stw r0, flyready$135@sda21(r13)
.L_800184A0:
/* 800184A0 00015400  28 1F 80 04 */	cmplwi r31, 0x8004
/* 800184A4 00015404  40 82 01 38 */	bne .L_800185DC
/* 800184A8 00015408  38 00 00 01 */	li r0, 1
/* 800184AC 0001540C  90 0D 2C B8 */	stw r0, flyready$135@sda21(r13)
/* 800184B0 00015410  48 00 01 2C */	b .L_800185DC
.L_800184B4:
/* 800184B4 00015414  3C 60 80 36 */	lis r3, player_se$123@ha
/* 800184B8 00015418  57 E4 04 3E */	clrlwi r4, r31, 0x10
/* 800184BC 0001541C  38 63 37 C8 */	addi r3, r3, player_se$123@l
/* 800184C0 00015420  48 00 35 41 */	bl Jal_SendCmdQueue_Noblock
/* 800184C4 00015424  28 1F 00 04 */	cmplwi r31, 4
/* 800184C8 00015428  40 82 00 EC */	bne .L_800185B4
/* 800184CC 0001542C  38 60 00 04 */	li r3, 4
/* 800184D0 00015430  4B FF 53 31 */	bl GetRandom_ulimit
/* 800184D4 00015434  88 0D 2C C0 */	lbz r0, init$152@sda21(r13)
/* 800184D8 00015438  3C 80 00 01 */	lis r4, 0x0000800B@ha
/* 800184DC 0001543C  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800184E0 00015440  38 C4 80 0B */	addi r6, r4, 0x0000800B@l
/* 800184E4 00015444  7C 00 07 75 */	extsb. r0, r0
/* 800184E8 00015448  40 82 00 14 */	bne .L_800184FC
/* 800184EC 0001544C  38 60 00 04 */	li r3, 4
/* 800184F0 00015450  38 00 00 01 */	li r0, 1
/* 800184F4 00015454  B0 6D 2C BE */	sth r3, old1$151@sda21(r13)
/* 800184F8 00015458  98 0D 2C C0 */	stb r0, init$152@sda21(r13)
.L_800184FC:
/* 800184FC 0001545C  88 0D 2C C4 */	lbz r0, init$155@sda21(r13)
/* 80018500 00015460  7C 00 07 75 */	extsb. r0, r0
/* 80018504 00015464  40 82 00 14 */	bne .L_80018518
/* 80018508 00015468  38 60 00 05 */	li r3, 5
/* 8001850C 0001546C  38 00 00 01 */	li r0, 1
/* 80018510 00015470  B0 6D 2C C2 */	sth r3, old2$154@sda21(r13)
/* 80018514 00015474  98 0D 2C C4 */	stb r0, init$155@sda21(r13)
.L_80018518:
/* 80018518 00015478  88 0D 2C C8 */	lbz r0, init$158@sda21(r13)
/* 8001851C 0001547C  7C 00 07 75 */	extsb. r0, r0
/* 80018520 00015480  40 82 00 14 */	bne .L_80018534
/* 80018524 00015484  38 60 00 06 */	li r3, 6
/* 80018528 00015488  38 00 00 01 */	li r0, 1
/* 8001852C 0001548C  B0 6D 2C C6 */	sth r3, old3$157@sda21(r13)
/* 80018530 00015490  98 0D 2C C8 */	stb r0, init$158@sda21(r13)
.L_80018534:
/* 80018534 00015494  54 A0 07 BE */	clrlwi r0, r5, 0x1e
/* 80018538 00015498  B0 01 00 10 */	sth r0, 0x10(r1)
/* 8001853C 0001549C  A0 81 00 10 */	lhz r4, 0x10(r1)
/* 80018540 000154A0  2C 04 00 03 */	cmpwi r4, 3
/* 80018544 000154A4  41 82 00 0C */	beq .L_80018550
/* 80018548 000154A8  3C C4 00 01 */	addis r6, r4, 1
/* 8001854C 000154AC  38 C6 80 0D */	addi r6, r6, -32755
.L_80018550:
/* 80018550 000154B0  A0 0D 2C C6 */	lhz r0, old3$157@sda21(r13)
/* 80018554 000154B4  A0 6D 2C C2 */	lhz r3, old2$154@sda21(r13)
/* 80018558 000154B8  7C 00 18 40 */	cmplw r0, r3
/* 8001855C 000154BC  40 82 00 38 */	bne .L_80018594
/* 80018560 000154C0  A0 0D 2C BE */	lhz r0, old1$151@sda21(r13)
/* 80018564 000154C4  7C 03 00 40 */	cmplw r3, r0
/* 80018568 000154C8  40 82 00 2C */	bne .L_80018594
/* 8001856C 000154CC  7C 00 20 40 */	cmplw r0, r4
/* 80018570 000154D0  41 82 00 10 */	beq .L_80018580
/* 80018574 000154D4  3C C4 00 01 */	addis r6, r4, 1
/* 80018578 000154D8  38 C6 80 10 */	addi r6, r6, -32752
/* 8001857C 000154DC  48 00 00 0C */	b .L_80018588
.L_80018580:
/* 80018580 000154E0  3C 60 00 01 */	lis r3, 0x00008014@ha
/* 80018584 000154E4  38 C3 80 14 */	addi r6, r3, 0x00008014@l
.L_80018588:
/* 80018588 000154E8  38 00 00 05 */	li r0, 5
/* 8001858C 000154EC  B0 0D 2C BE */	sth r0, old1$151@sda21(r13)
/* 80018590 000154F0  48 00 00 14 */	b .L_800185A4
.L_80018594:
/* 80018594 000154F4  A0 0D 2C BE */	lhz r0, old1$151@sda21(r13)
/* 80018598 000154F8  B0 6D 2C C6 */	sth r3, old3$157@sda21(r13)
/* 8001859C 000154FC  B0 0D 2C C2 */	sth r0, old2$154@sda21(r13)
/* 800185A0 00015500  B0 8D 2C BE */	sth r4, old1$151@sda21(r13)
.L_800185A4:
/* 800185A4 00015504  80 6D 2C A8 */	lwz r3, orima_seqp@sda21(r13)
/* 800185A8 00015508  54 C5 04 7E */	clrlwi r5, r6, 0x11
/* 800185AC 0001550C  38 80 00 01 */	li r4, 1
/* 800185B0 00015510  4B FF 7D D1 */	bl Jam_WritePortAppDirect
.L_800185B4:
/* 800185B4 00015514  28 1F 00 0C */	cmplwi r31, 0xc
/* 800185B8 00015518  40 82 00 24 */	bne .L_800185DC
/* 800185BC 0001551C  38 60 00 00 */	li r3, 0
/* 800185C0 00015520  38 80 00 64 */	li r4, 0x64
/* 800185C4 00015524  48 00 05 7D */	bl Jac_FadeOutBgm
/* 800185C8 00015528  38 60 00 01 */	li r3, 1
/* 800185CC 0001552C  38 80 00 64 */	li r4, 0x64
/* 800185D0 00015530  48 00 05 71 */	bl Jac_FadeOutBgm
/* 800185D4 00015534  38 60 00 28 */	li r3, 0x28
/* 800185D8 00015538  4B FF E5 C9 */	bl Jac_PlaySystemSe
.L_800185DC:
/* 800185DC 0001553C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800185E0 00015540  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800185E4 00015544  38 21 00 20 */	addi r1, r1, 0x20
/* 800185E8 00015548  7C 08 03 A6 */	mtlr r0
/* 800185EC 0001554C  4E 80 00 20 */	blr 
.endfn Jac_PlayOrimaSe

.balign 32, 0
.fn Jac_PauseOrimaSe__Fv, global
/* 80018600 00015560  7C 08 02 A6 */	mflr r0
/* 80018604 00015564  90 01 00 04 */	stw r0, 4(r1)
/* 80018608 00015568  94 21 FF F8 */	stwu r1, -8(r1)
/* 8001860C 0001556C  80 6D 2C A8 */	lwz r3, orima_seqp@sda21(r13)
/* 80018610 00015570  28 03 00 00 */	cmplwi r3, 0
/* 80018614 00015574  41 82 00 0C */	beq .L_80018620
/* 80018618 00015578  38 80 00 01 */	li r4, 1
/* 8001861C 0001557C  4B FF 8E C5 */	bl Jam_PauseTrack
.L_80018620:
/* 80018620 00015580  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80018624 00015584  38 21 00 08 */	addi r1, r1, 8
/* 80018628 00015588  7C 08 03 A6 */	mtlr r0
/* 8001862C 0001558C  4E 80 00 20 */	blr 
.endfn Jac_PauseOrimaSe__Fv

.balign 32, 0
.fn Jac_UnPauseOrimaSe__Fv, global
/* 80018640 000155A0  7C 08 02 A6 */	mflr r0
/* 80018644 000155A4  90 01 00 04 */	stw r0, 4(r1)
/* 80018648 000155A8  94 21 FF F8 */	stwu r1, -8(r1)
/* 8001864C 000155AC  80 6D 2C A8 */	lwz r3, orima_seqp@sda21(r13)
/* 80018650 000155B0  28 03 00 00 */	cmplwi r3, 0
/* 80018654 000155B4  41 82 00 0C */	beq .L_80018660
/* 80018658 000155B8  38 80 00 01 */	li r4, 1
/* 8001865C 000155BC  4B FF 8F C5 */	bl Jam_UnPauseTrack
.L_80018660:
/* 80018660 000155C0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80018664 000155C4  38 21 00 08 */	addi r1, r1, 8
/* 80018668 000155C8  7C 08 03 A6 */	mtlr r0
/* 8001866C 000155CC  4E 80 00 20 */	blr 
.endfn Jac_UnPauseOrimaSe__Fv

.balign 32, 0
.fn Jac_StopOrimaSe, global
/* 80018680 000155E0  7C 08 02 A6 */	mflr r0
/* 80018684 000155E4  90 01 00 04 */	stw r0, 4(r1)
/* 80018688 000155E8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001868C 000155EC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80018690 000155F0  3B E3 00 00 */	addi r31, r3, 0
/* 80018694 000155F4  88 0D 2C D0 */	lbz r0, init$187@sda21(r13)
/* 80018698 000155F8  7C 00 07 75 */	extsb. r0, r0
/* 8001869C 000155FC  40 82 00 14 */	bne .L_800186B0
/* 800186A0 00015600  38 60 00 00 */	li r3, 0
/* 800186A4 00015604  38 00 00 01 */	li r0, 1
/* 800186A8 00015608  90 6D 2C CC */	stw r3, seqp$186@sda21(r13)
/* 800186AC 0001560C  98 0D 2C D0 */	stb r0, init$187@sda21(r13)
.L_800186B0:
/* 800186B0 00015610  88 0D 2C D8 */	lbz r0, init$191@sda21(r13)
/* 800186B4 00015614  7C 00 07 75 */	extsb. r0, r0
/* 800186B8 00015618  40 82 00 14 */	bne .L_800186CC
/* 800186BC 0001561C  38 60 00 00 */	li r3, 0
/* 800186C0 00015620  38 00 00 01 */	li r0, 1
/* 800186C4 00015624  90 6D 2C D4 */	stw r3, cmdqueue_reset$190@sda21(r13)
/* 800186C8 00015628  98 0D 2C D8 */	stb r0, init$191@sda21(r13)
.L_800186CC:
/* 800186CC 0001562C  80 0D 2C D4 */	lwz r0, cmdqueue_reset$190@sda21(r13)
/* 800186D0 00015630  2C 00 00 00 */	cmpwi r0, 0
/* 800186D4 00015634  40 82 00 38 */	bne .L_8001870C
/* 800186D8 00015638  3C 60 00 01 */	lis r3, 0x0001000A@ha
/* 800186DC 0001563C  38 63 00 0A */	addi r3, r3, 0x0001000A@l
/* 800186E0 00015640  4B FF 7F 81 */	bl Jam_GetTrackHandle
/* 800186E4 00015644  90 6D 2C CC */	stw r3, seqp$186@sda21(r13)
/* 800186E8 00015648  80 8D 2C CC */	lwz r4, seqp$186@sda21(r13)
/* 800186EC 0001564C  28 04 00 00 */	cmplwi r4, 0
/* 800186F0 00015650  41 82 00 34 */	beq .L_80018724
/* 800186F4 00015654  3C 60 80 36 */	lis r3, player_se_stop$189@ha
/* 800186F8 00015658  38 A0 00 02 */	li r5, 2
/* 800186FC 0001565C  38 63 38 34 */	addi r3, r3, player_se_stop$189@l
/* 80018700 00015660  48 00 32 A1 */	bl Jal_AddCmdQueue
/* 80018704 00015664  38 00 00 01 */	li r0, 1
/* 80018708 00015668  90 0D 2C D4 */	stw r0, cmdqueue_reset$190@sda21(r13)
.L_8001870C:
/* 8001870C 0001566C  57 E0 04 21 */	rlwinm. r0, r31, 0, 0x10, 0x10
/* 80018710 00015670  40 82 00 14 */	bne .L_80018724
/* 80018714 00015674  3C 60 80 36 */	lis r3, player_se_stop$189@ha
/* 80018718 00015678  57 E4 04 3E */	clrlwi r4, r31, 0x10
/* 8001871C 0001567C  38 63 38 34 */	addi r3, r3, player_se_stop$189@l
/* 80018720 00015680  48 00 32 E1 */	bl Jal_SendCmdQueue_Noblock
.L_80018724:
/* 80018724 00015684  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80018728 00015688  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001872C 0001568C  38 21 00 18 */	addi r1, r1, 0x18
/* 80018730 00015690  7C 08 03 A6 */	mtlr r0
/* 80018734 00015694  4E 80 00 20 */	blr 
.endfn Jac_StopOrimaSe

.balign 32, 0
.fn Jac_Piki_Number, global
/* 80018740 000156A0  28 03 00 64 */	cmplwi r3, 0x64
/* 80018744 000156A4  41 80 00 10 */	blt .L_80018754
/* 80018748 000156A8  38 00 00 1D */	li r0, 0x1d
/* 8001874C 000156AC  90 0D 2C DC */	stw r0, pikis@sda21(r13)
/* 80018750 000156B0  4E 80 00 20 */	blr 
.L_80018754:
/* 80018754 000156B4  28 03 00 32 */	cmplwi r3, 0x32
/* 80018758 000156B8  41 80 00 1C */	blt .L_80018774
/* 8001875C 000156BC  38 63 FF CE */	addi r3, r3, -50
/* 80018760 000156C0  38 00 00 0A */	li r0, 0xa
/* 80018764 000156C4  7C 63 03 96 */	divwu r3, r3, r0
/* 80018768 000156C8  38 03 00 19 */	addi r0, r3, 0x19
/* 8001876C 000156CC  90 0D 2C DC */	stw r0, pikis@sda21(r13)
/* 80018770 000156D0  4E 80 00 20 */	blr 
.L_80018774:
/* 80018774 000156D4  28 03 00 19 */	cmplwi r3, 0x19
/* 80018778 000156D8  41 80 00 1C */	blt .L_80018794
/* 8001877C 000156DC  38 63 FF E7 */	addi r3, r3, -25
/* 80018780 000156E0  38 00 00 05 */	li r0, 5
/* 80018784 000156E4  7C 63 03 96 */	divwu r3, r3, r0
/* 80018788 000156E8  38 03 00 14 */	addi r0, r3, 0x14
/* 8001878C 000156EC  90 0D 2C DC */	stw r0, pikis@sda21(r13)
/* 80018790 000156F0  4E 80 00 20 */	blr 
.L_80018794:
/* 80018794 000156F4  28 03 00 0F */	cmplwi r3, 0xf
/* 80018798 000156F8  41 80 00 18 */	blt .L_800187B0
/* 8001879C 000156FC  38 03 FF F1 */	addi r0, r3, -15
/* 800187A0 00015700  54 03 F8 7E */	srwi r3, r0, 1
/* 800187A4 00015704  38 03 00 0F */	addi r0, r3, 0xf
/* 800187A8 00015708  90 0D 2C DC */	stw r0, pikis@sda21(r13)
/* 800187AC 0001570C  4E 80 00 20 */	blr 
.L_800187B0:
/* 800187B0 00015710  90 6D 2C DC */	stw r3, pikis@sda21(r13)
/* 800187B4 00015714  4E 80 00 20 */	blr 
.endfn Jac_Piki_Number

.balign 32, 0
.fn Jac_UpdatePikiGaya__Fv, global
/* 800187C0 00015720  7C 08 02 A6 */	mflr r0
/* 800187C4 00015724  3C 60 80 36 */	lis r3, player_se$123@ha
/* 800187C8 00015728  90 01 00 04 */	stw r0, 4(r1)
/* 800187CC 0001572C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800187D0 00015730  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800187D4 00015734  3B E3 37 C8 */	addi r31, r3, player_se$123@l
/* 800187D8 00015738  88 0D 2C E8 */	lbz r0, init$217@sda21(r13)
/* 800187DC 0001573C  7C 00 07 75 */	extsb. r0, r0
/* 800187E0 00015740  40 82 00 14 */	bne .L_800187F4
/* 800187E4 00015744  38 60 00 00 */	li r3, 0
/* 800187E8 00015748  38 00 00 01 */	li r0, 1
/* 800187EC 0001574C  90 6D 2C E4 */	stw r3, init$216@sda21(r13)
/* 800187F0 00015750  98 0D 2C E8 */	stb r0, init$217@sda21(r13)
.L_800187F4:
/* 800187F4 00015754  88 0D 2C F0 */	lbz r0, init$221@sda21(r13)
/* 800187F8 00015758  7C 00 07 75 */	extsb. r0, r0
/* 800187FC 0001575C  40 82 00 14 */	bne .L_80018810
/* 80018800 00015760  C0 02 81 C0 */	lfs f0, lbl_803E83C0@sda21(r2)
/* 80018804 00015764  38 00 00 01 */	li r0, 1
/* 80018808 00015768  98 0D 2C F0 */	stb r0, init$221@sda21(r13)
/* 8001880C 0001576C  D0 0D 2C EC */	stfs f0, volume$220@sda21(r13)
.L_80018810:
/* 80018810 00015770  48 00 10 31 */	bl Jac_GetCurrentScene
/* 80018814 00015774  28 03 00 05 */	cmplwi r3, 5
/* 80018818 00015778  41 82 00 18 */	beq .L_80018830
/* 8001881C 0001577C  C0 22 81 C0 */	lfs f1, lbl_803E83C0@sda21(r2)
/* 80018820 00015780  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 80018824 00015784  38 80 00 01 */	li r4, 1
/* 80018828 00015788  4B FF 7F B9 */	bl Jam_SetExtParamD
/* 8001882C 0001578C  48 00 01 34 */	b .L_80018960
.L_80018830:
/* 80018830 00015790  48 00 19 51 */	bl Jac_DemoCheck__Fv
/* 80018834 00015794  2C 03 00 01 */	cmpwi r3, 1
/* 80018838 00015798  40 82 00 18 */	bne .L_80018850
/* 8001883C 0001579C  C0 22 81 C0 */	lfs f1, lbl_803E83C0@sda21(r2)
/* 80018840 000157A0  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 80018844 000157A4  38 80 00 01 */	li r4, 1
/* 80018848 000157A8  4B FF 7F 99 */	bl Jam_SetExtParamD
/* 8001884C 000157AC  48 00 01 14 */	b .L_80018960
.L_80018850:
/* 80018850 000157B0  80 0D 2C E4 */	lwz r0, init$216@sda21(r13)
/* 80018854 000157B4  2C 00 00 00 */	cmpwi r0, 0
/* 80018858 000157B8  40 82 00 44 */	bne .L_8001889C
/* 8001885C 000157BC  3C 60 00 01 */	lis r3, 0x00010003@ha
/* 80018860 000157C0  38 63 00 03 */	addi r3, r3, 0x00010003@l
/* 80018864 000157C4  4B FF 7D FD */	bl Jam_GetTrackHandle
/* 80018868 000157C8  90 6D 2C E0 */	stw r3, seqp$215@sda21(r13)
/* 8001886C 000157CC  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 80018870 000157D0  4B FF 7E 51 */	bl Jam_InitExtBuffer
/* 80018874 000157D4  80 6D 2C E0 */	lwz r3, seqp$215@sda21(r13)
/* 80018878 000157D8  38 9F 00 D8 */	addi r4, r31, 0xd8
/* 8001887C 000157DC  4B FF 7E 65 */	bl Jam_AssignExtBuffer
/* 80018880 000157E0  90 6D 2C E4 */	stw r3, init$216@sda21(r13)
/* 80018884 000157E4  80 0D 2C E4 */	lwz r0, init$216@sda21(r13)
/* 80018888 000157E8  2C 00 00 00 */	cmpwi r0, 0
/* 8001888C 000157EC  41 82 00 D4 */	beq .L_80018960
/* 80018890 000157F0  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 80018894 000157F4  38 80 00 01 */	li r4, 1
/* 80018898 000157F8  4B FF 80 09 */	bl Jam_OnExtSwitchD
.L_8001889C:
/* 8001889C 000157FC  80 0D 2C 90 */	lwz r0, gaya_timer@sda21(r13)
/* 800188A0 00015800  28 00 00 96 */	cmplwi r0, 0x96
/* 800188A4 00015804  41 80 00 10 */	blt .L_800188B4
/* 800188A8 00015808  80 8D 2C DC */	lwz r4, pikis@sda21(r13)
/* 800188AC 0001580C  28 04 00 01 */	cmplwi r4, 1
/* 800188B0 00015810  40 80 00 58 */	bge .L_80018908
.L_800188B4:
/* 800188B4 00015814  C0 2D 2C EC */	lfs f1, volume$220@sda21(r13)
/* 800188B8 00015818  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 800188BC 0001581C  38 80 00 01 */	li r4, 1
/* 800188C0 00015820  4B FF 7F 21 */	bl Jam_SetExtParamD
/* 800188C4 00015824  C0 4D 2C EC */	lfs f2, volume$220@sda21(r13)
/* 800188C8 00015828  C0 22 81 C4 */	lfs f1, lbl_803E83C4@sda21(r2)
/* 800188CC 0001582C  C0 02 81 C0 */	lfs f0, lbl_803E83C0@sda21(r2)
/* 800188D0 00015830  EC 22 08 28 */	fsubs f1, f2, f1
/* 800188D4 00015834  D0 2D 2C EC */	stfs f1, volume$220@sda21(r13)
/* 800188D8 00015838  C0 2D 2C EC */	lfs f1, volume$220@sda21(r13)
/* 800188DC 0001583C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800188E0 00015840  40 80 00 08 */	bge .L_800188E8
/* 800188E4 00015844  D0 0D 2C EC */	stfs f0, volume$220@sda21(r13)
.L_800188E8:
/* 800188E8 00015848  80 0D 2C DC */	lwz r0, pikis@sda21(r13)
/* 800188EC 0001584C  28 00 00 00 */	cmplwi r0, 0
/* 800188F0 00015850  40 82 00 64 */	bne .L_80018954
/* 800188F4 00015854  80 6D 2C E0 */	lwz r3, seqp$215@sda21(r13)
/* 800188F8 00015858  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 800188FC 0001585C  38 80 00 00 */	li r4, 0
/* 80018900 00015860  4B FF 7A 81 */	bl Jam_WritePortAppDirect
/* 80018904 00015864  48 00 00 50 */	b .L_80018954
.L_80018908:
/* 80018908 00015868  28 00 00 F0 */	cmplwi r0, 0xf0
/* 8001890C 0001586C  41 80 00 48 */	blt .L_80018954
/* 80018910 00015870  80 6D 2C E0 */	lwz r3, seqp$215@sda21(r13)
/* 80018914 00015874  54 85 04 3E */	clrlwi r5, r4, 0x10
/* 80018918 00015878  38 80 00 00 */	li r4, 0
/* 8001891C 0001587C  4B FF 7A 65 */	bl Jam_WritePortAppDirect
/* 80018920 00015880  C0 4D 2C EC */	lfs f2, volume$220@sda21(r13)
/* 80018924 00015884  C0 22 81 C4 */	lfs f1, lbl_803E83C4@sda21(r2)
/* 80018928 00015888  C0 02 81 C8 */	lfs f0, lbl_803E83C8@sda21(r2)
/* 8001892C 0001588C  EC 22 08 2A */	fadds f1, f2, f1
/* 80018930 00015890  D0 2D 2C EC */	stfs f1, volume$220@sda21(r13)
/* 80018934 00015894  C0 2D 2C EC */	lfs f1, volume$220@sda21(r13)
/* 80018938 00015898  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8001893C 0001589C  40 81 00 08 */	ble .L_80018944
/* 80018940 000158A0  D0 0D 2C EC */	stfs f0, volume$220@sda21(r13)
.L_80018944:
/* 80018944 000158A4  C0 2D 2C EC */	lfs f1, volume$220@sda21(r13)
/* 80018948 000158A8  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 8001894C 000158AC  38 80 00 01 */	li r4, 1
/* 80018950 000158B0  4B FF 7E 91 */	bl Jam_SetExtParamD
.L_80018954:
/* 80018954 000158B4  80 6D 2C 90 */	lwz r3, gaya_timer@sda21(r13)
/* 80018958 000158B8  38 03 00 01 */	addi r0, r3, 1
/* 8001895C 000158BC  90 0D 2C 90 */	stw r0, gaya_timer@sda21(r13)
.L_80018960:
/* 80018960 000158C0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80018964 000158C4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80018968 000158C8  38 21 00 18 */	addi r1, r1, 0x18
/* 8001896C 000158CC  7C 08 03 A6 */	mtlr r0
/* 80018970 000158D0  4E 80 00 20 */	blr 
.endfn Jac_UpdatePikiGaya__Fv

.section .sbss, "wa"
.balign 8
.obj gaya_timer, local
	.skip 4
.endobj gaya_timer
.obj seqp$71, local
	.skip 4
.endobj seqp$71
.obj init$72, local
	.skip 1
.endobj init$72
.obj status$74, local
	.skip 1
.endobj status$74
.obj init$75, local
	.skip 1
.endobj init$75
.balign 4
.obj stick_seqp, local
	.skip 4
.endobj stick_seqp
.obj flag$87, local
	.skip 4
.endobj flag$87
.obj init$88, local
	.skip 1
.endobj init$88
.balign 4
.obj orima_seqp, local
	.skip 4
.endobj orima_seqp
.obj status$120, local
	.skip 1
.endobj status$120
.obj init$121, local
	.skip 1
.endobj init$121
.balign 4
.obj cmdqueue_reset$124, local
	.skip 4
.endobj cmdqueue_reset$124
.obj init$125, local
	.skip 1
.endobj init$125
.balign 4
.obj flyready$135, local
	.skip 4
.endobj flyready$135
.obj init$136, local
	.skip 1
.endobj init$136
.balign 2
.obj old1$151, local
	.skip 2
.endobj old1$151
.obj init$152, local
	.skip 1
.endobj init$152
.balign 2
.obj old2$154, local
	.skip 2
.endobj old2$154
.obj init$155, local
	.skip 1
.endobj init$155
.balign 2
.obj old3$157, local
	.skip 2
.endobj old3$157
.obj init$158, local
	.skip 1
.endobj init$158
.balign 4
.obj seqp$186, local
	.skip 4
.endobj seqp$186
.obj init$187, local
	.skip 1
.endobj init$187
.balign 4
.obj cmdqueue_reset$190, local
	.skip 4
.endobj cmdqueue_reset$190
.obj init$191, local
	.skip 1
.endobj init$191
.balign 4
.obj pikis, local
	.skip 4
.endobj pikis
.obj seqp$215, local
	.skip 4
.endobj seqp$215
.obj init$216, local
	.skip 4
.endobj init$216
.obj init$217, local
	.skip 1
.endobj init$217
.balign 4
.obj volume$220, local
	.skip 4
.endobj volume$220
.obj init$221, local
	.skip 1
.endobj init$221

.section .sdata2, "a"  # 0x803E8200 - 0x803EC840
.balign 8
.obj lbl_803E83B8, local
	.8byte 0x4330000080000000
.endobj lbl_803E83B8
.obj lbl_803E83C0, local
	.float 0.0
.endobj lbl_803E83C0
.obj lbl_803E83C4, local
	.float 0.05
.endobj lbl_803E83C4
.obj lbl_803E83C8, local
	.float 1.0
.endobj lbl_803E83C8

.section .bss, "wa"  # 0x802E9640 - 0x803E81E5
.balign 8
.obj player_se$123, local
	.skip 0x6C
.endobj player_se$123
.balign 4
.obj player_se_stop$189, local
	.skip 0x6C
.endobj player_se_stop$189
.balign 4
.obj outerparam$219, local
	.skip 0x40
.endobj outerparam$219
