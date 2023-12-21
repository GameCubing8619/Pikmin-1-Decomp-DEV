.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.fn AmcEXIImm, global
/* 802207EC 0021D74C  7C 08 02 A6 */	mflr r0
/* 802207F0 0021D750  90 01 00 04 */	stw r0, 4(r1)
/* 802207F4 0021D754  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 802207F8 0021D758  BE A1 00 24 */	stmw r21, 0x24(r1)
/* 802207FC 0021D75C  3B 83 00 00 */	addi r28, r3, 0
/* 80220800 0021D760  3B A4 00 00 */	addi r29, r4, 0
/* 80220804 0021D764  3B C5 00 00 */	addi r30, r5, 0
/* 80220808 0021D768  3A C6 00 00 */	addi r22, r6, 0
/* 8022080C 0021D76C  3A A0 00 02 */	li r21, 2
/* 80220810 0021D770  4B FD 87 6D */	bl OSDisableInterrupts
/* 80220814 0021D774  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220818 0021D778  3B E3 00 00 */	addi r31, r3, 0
/* 8022081C 0021D77C  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80220820 0021D780  38 64 00 0C */	addi r3, r4, 0xc
/* 80220824 0021D784  54 00 07 BF */	clrlwi. r0, r0, 0x1e
/* 80220828 0021D788  40 82 00 10 */	bne .L_80220838
/* 8022082C 0021D78C  80 03 00 00 */	lwz r0, 0(r3)
/* 80220830 0021D790  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 80220834 0021D794  40 82 00 14 */	bne .L_80220848
.L_80220838:
/* 80220838 0021D798  7F E3 FB 78 */	mr r3, r31
/* 8022083C 0021D79C  4B FD 87 69 */	bl OSRestoreInterrupts
/* 80220840 0021D7A0  38 60 00 00 */	li r3, 0
/* 80220844 0021D7A4  48 00 01 D8 */	b .L_80220A1C
.L_80220848:
/* 80220848 0021D7A8  92 C4 00 04 */	stw r22, 4(r4)
/* 8022084C 0021D7AC  80 6D 2A E8 */	lwz r3, exi@sda21(r13)
/* 80220850 0021D7B0  80 03 00 04 */	lwz r0, 4(r3)
/* 80220854 0021D7B4  28 00 00 00 */	cmplwi r0, 0
/* 80220858 0021D7B8  41 82 00 20 */	beq .L_80220878
/* 8022085C 0021D7BC  38 60 00 00 */	li r3, 0
/* 80220860 0021D7C0  38 80 00 01 */	li r4, 1
/* 80220864 0021D7C4  48 00 03 65 */	bl AmcEXIClearInterrupts
/* 80220868 0021D7C8  1C 15 00 03 */	mulli r0, r21, 3
/* 8022086C 0021D7CC  3C 60 00 20 */	lis r3, 0x20
/* 80220870 0021D7D0  7C 63 04 30 */	srw r3, r3, r0
/* 80220874 0021D7D4  4B FD 8B 31 */	bl __OSUnmaskInterrupts
.L_80220878:
/* 80220878 0021D7D8  80 6D 2A E8 */	lwz r3, exi@sda21(r13)
/* 8022087C 0021D7DC  28 1E 00 00 */	cmplwi r30, 0
/* 80220880 0021D7E0  80 03 00 0C */	lwz r0, 0xc(r3)
/* 80220884 0021D7E4  60 00 00 02 */	ori r0, r0, 2
/* 80220888 0021D7E8  90 03 00 0C */	stw r0, 0xc(r3)
/* 8022088C 0021D7EC  41 82 01 38 */	beq .L_802209C4
/* 80220890 0021D7F0  39 80 00 00 */	li r12, 0
/* 80220894 0021D7F4  7C 0C E8 00 */	cmpw r12, r29
/* 80220898 0021D7F8  39 60 00 00 */	li r11, 0
/* 8022089C 0021D7FC  40 80 01 20 */	bge .L_802209BC
/* 802208A0 0021D800  2C 1D 00 08 */	cmpwi r29, 8
/* 802208A4 0021D804  38 7D FF F8 */	addi r3, r29, -8
/* 802208A8 0021D808  40 81 01 6C */	ble .L_80220A14
/* 802208AC 0021D80C  38 03 00 07 */	addi r0, r3, 7
/* 802208B0 0021D810  54 00 E8 FE */	srwi r0, r0, 3
/* 802208B4 0021D814  2C 03 00 00 */	cmpwi r3, 0
/* 802208B8 0021D818  7C 09 03 A6 */	mtctr r0
/* 802208BC 0021D81C  39 5C 00 00 */	addi r10, r28, 0
/* 802208C0 0021D820  40 81 01 54 */	ble .L_80220A14
.L_802208C4:
/* 802208C4 0021D824  20 6C 00 03 */	subfic r3, r12, 3
/* 802208C8 0021D828  89 2A 00 00 */	lbz r9, 0(r10)
/* 802208CC 0021D82C  38 0C 00 01 */	addi r0, r12, 1
/* 802208D0 0021D830  89 0A 00 01 */	lbz r8, 1(r10)
/* 802208D4 0021D834  54 67 18 38 */	slwi r7, r3, 3
/* 802208D8 0021D838  88 CA 00 02 */	lbz r6, 2(r10)
/* 802208DC 0021D83C  20 A0 00 03 */	subfic r5, r0, 3
/* 802208E0 0021D840  88 8A 00 03 */	lbz r4, 3(r10)
/* 802208E4 0021D844  38 6C 00 02 */	addi r3, r12, 2
/* 802208E8 0021D848  88 0A 00 04 */	lbz r0, 4(r10)
/* 802208EC 0021D84C  7D 29 38 30 */	slw r9, r9, r7
/* 802208F0 0021D850  8A CA 00 05 */	lbz r22, 5(r10)
/* 802208F4 0021D854  54 A7 18 38 */	slwi r7, r5, 3
/* 802208F8 0021D858  8B 0A 00 06 */	lbz r24, 6(r10)
/* 802208FC 0021D85C  20 63 00 03 */	subfic r3, r3, 3
/* 80220900 0021D860  8B 4A 00 07 */	lbz r26, 7(r10)
/* 80220904 0021D864  54 65 18 38 */	slwi r5, r3, 3
/* 80220908 0021D868  7C 6C 00 D0 */	neg r3, r12
/* 8022090C 0021D86C  3A AC 00 04 */	addi r21, r12, 4
/* 80220910 0021D870  54 63 18 38 */	slwi r3, r3, 3
/* 80220914 0021D874  22 B5 00 03 */	subfic r21, r21, 3
/* 80220918 0021D878  3A EC 00 05 */	addi r23, r12, 5
/* 8022091C 0021D87C  56 B5 18 38 */	slwi r21, r21, 3
/* 80220920 0021D880  22 F7 00 03 */	subfic r23, r23, 3
/* 80220924 0021D884  3B 2C 00 06 */	addi r25, r12, 6
/* 80220928 0021D888  56 F7 18 38 */	slwi r23, r23, 3
/* 8022092C 0021D88C  23 39 00 03 */	subfic r25, r25, 3
/* 80220930 0021D890  3B 6C 00 07 */	addi r27, r12, 7
/* 80220934 0021D894  57 39 18 38 */	slwi r25, r25, 3
/* 80220938 0021D898  23 7B 00 03 */	subfic r27, r27, 3
/* 8022093C 0021D89C  57 7B 18 38 */	slwi r27, r27, 3
/* 80220940 0021D8A0  7D 6B 4B 78 */	or r11, r11, r9
/* 80220944 0021D8A4  7D 07 38 30 */	slw r7, r8, r7
/* 80220948 0021D8A8  7D 6B 3B 78 */	or r11, r11, r7
/* 8022094C 0021D8AC  7C C5 28 30 */	slw r5, r6, r5
/* 80220950 0021D8B0  7D 6B 2B 78 */	or r11, r11, r5
/* 80220954 0021D8B4  7C 83 18 30 */	slw r3, r4, r3
/* 80220958 0021D8B8  7D 6B 1B 78 */	or r11, r11, r3
/* 8022095C 0021D8BC  7C 00 A8 30 */	slw r0, r0, r21
/* 80220960 0021D8C0  7D 6B 03 78 */	or r11, r11, r0
/* 80220964 0021D8C4  7E C0 B8 30 */	slw r0, r22, r23
/* 80220968 0021D8C8  7D 6B 03 78 */	or r11, r11, r0
/* 8022096C 0021D8CC  7F 00 C8 30 */	slw r0, r24, r25
/* 80220970 0021D8D0  7D 6B 03 78 */	or r11, r11, r0
/* 80220974 0021D8D4  7F 40 D8 30 */	slw r0, r26, r27
/* 80220978 0021D8D8  7D 6B 03 78 */	or r11, r11, r0
/* 8022097C 0021D8DC  39 4A 00 08 */	addi r10, r10, 8
/* 80220980 0021D8E0  39 8C 00 08 */	addi r12, r12, 8
/* 80220984 0021D8E4  42 00 FF 40 */	bdnz .L_802208C4
/* 80220988 0021D8E8  48 00 00 8C */	b .L_80220A14
.L_8022098C:
/* 8022098C 0021D8EC  7C 0C E8 50 */	subf r0, r12, r29
/* 80220990 0021D8F0  7C 0C E8 00 */	cmpw r12, r29
/* 80220994 0021D8F4  7C 09 03 A6 */	mtctr r0
/* 80220998 0021D8F8  40 80 00 24 */	bge .L_802209BC
.L_8022099C:
/* 8022099C 0021D8FC  20 0C 00 03 */	subfic r0, r12, 3
/* 802209A0 0021D900  88 64 00 00 */	lbz r3, 0(r4)
/* 802209A4 0021D904  54 00 18 38 */	slwi r0, r0, 3
/* 802209A8 0021D908  7C 60 00 30 */	slw r0, r3, r0
/* 802209AC 0021D90C  7D 6B 03 78 */	or r11, r11, r0
/* 802209B0 0021D910  38 84 00 01 */	addi r4, r4, 1
/* 802209B4 0021D914  39 8C 00 01 */	addi r12, r12, 1
/* 802209B8 0021D918  42 00 FF E4 */	bdnz .L_8022099C
.L_802209BC:
/* 802209BC 0021D91C  3C 60 CC 00 */	lis r3, 0xCC006838@ha
/* 802209C0 0021D920  91 63 68 38 */	stw r11, 0xCC006838@l(r3)
.L_802209C4:
/* 802209C4 0021D924  80 6D 2A E8 */	lwz r3, exi@sda21(r13)
/* 802209C8 0021D928  28 1E 00 01 */	cmplwi r30, 1
/* 802209CC 0021D92C  93 83 00 14 */	stw r28, 0x14(r3)
/* 802209D0 0021D930  41 82 00 0C */	beq .L_802209DC
/* 802209D4 0021D934  7F A6 EB 78 */	mr r6, r29
/* 802209D8 0021D938  48 00 00 08 */	b .L_802209E0
.L_802209DC:
/* 802209DC 0021D93C  38 C0 00 00 */	li r6, 0
.L_802209E0:
/* 802209E0 0021D940  80 AD 2A E8 */	lwz r5, exi@sda21(r13)
/* 802209E4 0021D944  57 C4 10 3A */	slwi r4, r30, 2
/* 802209E8 0021D948  38 1D FF FF */	addi r0, r29, -1
/* 802209EC 0021D94C  90 C5 00 10 */	stw r6, 0x10(r5)
/* 802209F0 0021D950  60 84 00 01 */	ori r4, r4, 1
/* 802209F4 0021D954  54 00 20 36 */	slwi r0, r0, 4
/* 802209F8 0021D958  3C 60 CC 00 */	lis r3, 0xCC006834@ha
/* 802209FC 0021D95C  7C 80 03 78 */	or r0, r4, r0
/* 80220A00 0021D960  90 03 68 34 */	stw r0, 0xCC006834@l(r3)
/* 80220A04 0021D964  7F E3 FB 78 */	mr r3, r31
/* 80220A08 0021D968  4B FD 85 9D */	bl OSRestoreInterrupts
/* 80220A0C 0021D96C  38 60 00 01 */	li r3, 1
/* 80220A10 0021D970  48 00 00 0C */	b .L_80220A1C
.L_80220A14:
/* 80220A14 0021D974  7C 9C 62 14 */	add r4, r28, r12
/* 80220A18 0021D978  4B FF FF 74 */	b .L_8022098C
.L_80220A1C:
/* 80220A1C 0021D97C  BA A1 00 24 */	lmw r21, 0x24(r1)
/* 80220A20 0021D980  80 01 00 54 */	lwz r0, 0x54(r1)
/* 80220A24 0021D984  38 21 00 50 */	addi r1, r1, 0x50
/* 80220A28 0021D988  7C 08 03 A6 */	mtlr r0
/* 80220A2C 0021D98C  4E 80 00 20 */	blr 
.endfn AmcEXIImm

.fn AmcEXISync, global
/* 80220A30 0021D990  7C 08 02 A6 */	mflr r0
/* 80220A34 0021D994  90 01 00 04 */	stw r0, 4(r1)
/* 80220A38 0021D998  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80220A3C 0021D99C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80220A40 0021D9A0  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220A44 0021D9A4  48 00 01 5C */	b .L_80220BA0
.L_80220A48:
/* 80220A48 0021D9A8  80 03 00 34 */	lwz r0, 0x34(r3)
/* 80220A4C 0021D9AC  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80220A50 0021D9B0  40 82 01 58 */	bne .L_80220BA8
/* 80220A54 0021D9B4  4B FD 85 29 */	bl OSDisableInterrupts
/* 80220A58 0021D9B8  80 CD 2A E8 */	lwz r6, exi@sda21(r13)
/* 80220A5C 0021D9BC  80 06 00 0C */	lwz r0, 0xc(r6)
/* 80220A60 0021D9C0  38 86 00 0C */	addi r4, r6, 0xc
/* 80220A64 0021D9C4  54 00 07 BF */	clrlwi. r0, r0, 0x1e
/* 80220A68 0021D9C8  41 82 01 30 */	beq .L_80220B98
/* 80220A6C 0021D9CC  80 04 00 00 */	lwz r0, 0(r4)
/* 80220A70 0021D9D0  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 80220A74 0021D9D4  41 82 01 14 */	beq .L_80220B88
/* 80220A78 0021D9D8  80 86 00 10 */	lwz r4, 0x10(r6)
/* 80220A7C 0021D9DC  2C 04 00 00 */	cmpwi r4, 0
/* 80220A80 0021D9E0  41 82 01 08 */	beq .L_80220B88
/* 80220A84 0021D9E4  3C A0 CC 00 */	lis r5, 0xCC006838@ha
/* 80220A88 0021D9E8  80 E6 00 14 */	lwz r7, 0x14(r6)
/* 80220A8C 0021D9EC  80 C5 68 38 */	lwz r6, 0xCC006838@l(r5)
/* 80220A90 0021D9F0  38 A0 00 00 */	li r5, 0
/* 80220A94 0021D9F4  40 81 00 F4 */	ble .L_80220B88
/* 80220A98 0021D9F8  2C 04 00 08 */	cmpwi r4, 8
/* 80220A9C 0021D9FC  39 04 FF F8 */	addi r8, r4, -8
/* 80220AA0 0021DA00  40 81 00 BC */	ble .L_80220B5C
/* 80220AA4 0021DA04  38 08 00 07 */	addi r0, r8, 7
/* 80220AA8 0021DA08  54 00 E8 FE */	srwi r0, r0, 3
/* 80220AAC 0021DA0C  2C 08 00 00 */	cmpwi r8, 0
/* 80220AB0 0021DA10  7C 09 03 A6 */	mtctr r0
/* 80220AB4 0021DA14  40 81 00 A8 */	ble .L_80220B5C
.L_80220AB8:
/* 80220AB8 0021DA18  20 05 00 03 */	subfic r0, r5, 3
/* 80220ABC 0021DA1C  54 08 18 38 */	slwi r8, r0, 3
/* 80220AC0 0021DA20  38 05 00 01 */	addi r0, r5, 1
/* 80220AC4 0021DA24  7C C8 44 30 */	srw r8, r6, r8
/* 80220AC8 0021DA28  20 00 00 03 */	subfic r0, r0, 3
/* 80220ACC 0021DA2C  99 07 00 00 */	stb r8, 0(r7)
/* 80220AD0 0021DA30  54 00 18 38 */	slwi r0, r0, 3
/* 80220AD4 0021DA34  39 05 00 02 */	addi r8, r5, 2
/* 80220AD8 0021DA38  7C C0 04 30 */	srw r0, r6, r0
/* 80220ADC 0021DA3C  21 08 00 03 */	subfic r8, r8, 3
/* 80220AE0 0021DA40  98 07 00 01 */	stb r0, 1(r7)
/* 80220AE4 0021DA44  55 08 18 38 */	slwi r8, r8, 3
/* 80220AE8 0021DA48  7C DF 44 30 */	srw r31, r6, r8
/* 80220AEC 0021DA4C  7D 05 00 D0 */	neg r8, r5
/* 80220AF0 0021DA50  9B E7 00 02 */	stb r31, 2(r7)
/* 80220AF4 0021DA54  55 09 18 38 */	slwi r9, r8, 3
/* 80220AF8 0021DA58  39 05 00 04 */	addi r8, r5, 4
/* 80220AFC 0021DA5C  7C CC 4C 30 */	srw r12, r6, r9
/* 80220B00 0021DA60  21 08 00 03 */	subfic r8, r8, 3
/* 80220B04 0021DA64  99 87 00 03 */	stb r12, 3(r7)
/* 80220B08 0021DA68  55 09 18 38 */	slwi r9, r8, 3
/* 80220B0C 0021DA6C  39 05 00 05 */	addi r8, r5, 5
/* 80220B10 0021DA70  7C CB 4C 30 */	srw r11, r6, r9
/* 80220B14 0021DA74  21 08 00 03 */	subfic r8, r8, 3
/* 80220B18 0021DA78  99 67 00 04 */	stb r11, 4(r7)
/* 80220B1C 0021DA7C  55 09 18 38 */	slwi r9, r8, 3
/* 80220B20 0021DA80  7C CA 4C 30 */	srw r10, r6, r9
/* 80220B24 0021DA84  39 05 00 06 */	addi r8, r5, 6
/* 80220B28 0021DA88  99 47 00 05 */	stb r10, 5(r7)
/* 80220B2C 0021DA8C  21 28 00 03 */	subfic r9, r8, 3
/* 80220B30 0021DA90  39 05 00 07 */	addi r8, r5, 7
/* 80220B34 0021DA94  55 29 18 38 */	slwi r9, r9, 3
/* 80220B38 0021DA98  7C C9 4C 30 */	srw r9, r6, r9
/* 80220B3C 0021DA9C  21 08 00 03 */	subfic r8, r8, 3
/* 80220B40 0021DAA0  99 27 00 06 */	stb r9, 6(r7)
/* 80220B44 0021DAA4  55 08 18 38 */	slwi r8, r8, 3
/* 80220B48 0021DAA8  7C C8 44 30 */	srw r8, r6, r8
/* 80220B4C 0021DAAC  99 07 00 07 */	stb r8, 7(r7)
/* 80220B50 0021DAB0  38 E7 00 08 */	addi r7, r7, 8
/* 80220B54 0021DAB4  38 A5 00 08 */	addi r5, r5, 8
/* 80220B58 0021DAB8  42 00 FF 60 */	bdnz .L_80220AB8
.L_80220B5C:
/* 80220B5C 0021DABC  7C 05 20 50 */	subf r0, r5, r4
/* 80220B60 0021DAC0  7C 05 20 00 */	cmpw r5, r4
/* 80220B64 0021DAC4  7C 09 03 A6 */	mtctr r0
/* 80220B68 0021DAC8  40 80 00 20 */	bge .L_80220B88
.L_80220B6C:
/* 80220B6C 0021DACC  20 05 00 03 */	subfic r0, r5, 3
/* 80220B70 0021DAD0  54 00 18 38 */	slwi r0, r0, 3
/* 80220B74 0021DAD4  7C C0 04 30 */	srw r0, r6, r0
/* 80220B78 0021DAD8  98 07 00 00 */	stb r0, 0(r7)
/* 80220B7C 0021DADC  38 E7 00 01 */	addi r7, r7, 1
/* 80220B80 0021DAE0  38 A5 00 01 */	addi r5, r5, 1
/* 80220B84 0021DAE4  42 00 FF E8 */	bdnz .L_80220B6C
.L_80220B88:
/* 80220B88 0021DAE8  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220B8C 0021DAEC  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80220B90 0021DAF0  54 00 00 3A */	rlwinm r0, r0, 0, 0, 0x1d
/* 80220B94 0021DAF4  90 04 00 0C */	stw r0, 0xc(r4)
.L_80220B98:
/* 80220B98 0021DAF8  4B FD 84 0D */	bl OSRestoreInterrupts
/* 80220B9C 0021DAFC  48 00 00 18 */	b .L_80220BB4
.L_80220BA0:
/* 80220BA0 0021DB00  3C 60 CC 00 */	lis r3, 0xCC006800@ha
/* 80220BA4 0021DB04  38 63 68 00 */	addi r3, r3, 0xCC006800@l
.L_80220BA8:
/* 80220BA8 0021DB08  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80220BAC 0021DB0C  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 80220BB0 0021DB10  40 82 FE 98 */	bne .L_80220A48
.L_80220BB4:
/* 80220BB4 0021DB14  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80220BB8 0021DB18  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80220BBC 0021DB1C  38 21 00 18 */	addi r1, r1, 0x18
/* 80220BC0 0021DB20  7C 08 03 A6 */	mtlr r0
/* 80220BC4 0021DB24  4E 80 00 20 */	blr 
.endfn AmcEXISync

.fn AmcEXIClearInterrupts, global
/* 80220BC8 0021DB28  2C 03 00 00 */	cmpwi r3, 0
/* 80220BCC 0021DB2C  41 82 00 18 */	beq .L_80220BE4
/* 80220BD0 0021DB30  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 80220BD4 0021DB34  80 03 30 00 */	lwz r0, 0xCC003000@l(r3)
/* 80220BD8 0021DB38  54 00 04 E6 */	rlwinm r0, r0, 0, 0x13, 0x13
/* 80220BDC 0021DB3C  60 00 10 00 */	ori r0, r0, 0x1000
/* 80220BE0 0021DB40  90 03 30 00 */	stw r0, 0x3000(r3)
.L_80220BE4:
/* 80220BE4 0021DB44  2C 04 00 00 */	cmpwi r4, 0
/* 80220BE8 0021DB48  4D 82 00 20 */	beqlr 
/* 80220BEC 0021DB4C  3C 60 CC 00 */	lis r3, 0xCC006800@ha
/* 80220BF0 0021DB50  38 63 68 00 */	addi r3, r3, 0xCC006800@l
/* 80220BF4 0021DB54  80 03 00 28 */	lwz r0, 0x28(r3)
/* 80220BF8 0021DB58  70 00 07 F5 */	andi. r0, r0, 0x7f5
/* 80220BFC 0021DB5C  60 00 00 08 */	ori r0, r0, 8
/* 80220C00 0021DB60  90 03 00 28 */	stw r0, 0x28(r3)
/* 80220C04 0021DB64  4E 80 00 20 */	blr 
.endfn AmcEXIClearInterrupts

.fn AmcEXISetExiCallback, global
/* 80220C08 0021DB68  7C 08 02 A6 */	mflr r0
/* 80220C0C 0021DB6C  90 01 00 04 */	stw r0, 4(r1)
/* 80220C10 0021DB70  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80220C14 0021DB74  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80220C18 0021DB78  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80220C1C 0021DB7C  7C 7E 1B 78 */	mr r30, r3
/* 80220C20 0021DB80  4B FD 83 5D */	bl OSDisableInterrupts
/* 80220C24 0021DB84  28 1E 00 00 */	cmplwi r30, 0
/* 80220C28 0021DB88  3B E3 00 00 */	addi r31, r3, 0
/* 80220C2C 0021DB8C  41 82 00 10 */	beq .L_80220C3C
/* 80220C30 0021DB90  38 60 00 40 */	li r3, 0x40
/* 80220C34 0021DB94  4B FD 87 71 */	bl __OSUnmaskInterrupts
/* 80220C38 0021DB98  48 00 00 0C */	b .L_80220C44
.L_80220C3C:
/* 80220C3C 0021DB9C  38 60 00 40 */	li r3, 0x40
/* 80220C40 0021DBA0  4B FD 86 DD */	bl __OSMaskInterrupts
.L_80220C44:
/* 80220C44 0021DBA4  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220C48 0021DBA8  7F E3 FB 78 */	mr r3, r31
/* 80220C4C 0021DBAC  83 E4 00 00 */	lwz r31, 0(r4)
/* 80220C50 0021DBB0  93 C4 00 00 */	stw r30, 0(r4)
/* 80220C54 0021DBB4  4B FD 83 51 */	bl OSRestoreInterrupts
/* 80220C58 0021DBB8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80220C5C 0021DBBC  7F E3 FB 78 */	mr r3, r31
/* 80220C60 0021DBC0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80220C64 0021DBC4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80220C68 0021DBC8  7C 08 03 A6 */	mtlr r0
/* 80220C6C 0021DBCC  38 21 00 18 */	addi r1, r1, 0x18
/* 80220C70 0021DBD0  4E 80 00 20 */	blr 
.endfn AmcEXISetExiCallback

.fn AmcEXISelect, global
/* 80220C74 0021DBD4  7C 08 02 A6 */	mflr r0
/* 80220C78 0021DBD8  90 01 00 04 */	stw r0, 4(r1)
/* 80220C7C 0021DBDC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80220C80 0021DBE0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80220C84 0021DBE4  7C 7F 1B 78 */	mr r31, r3
/* 80220C88 0021DBE8  4B FD 82 F5 */	bl OSDisableInterrupts
/* 80220C8C 0021DBEC  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220C90 0021DBF0  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80220C94 0021DBF4  38 A4 00 0C */	addi r5, r4, 0xc
/* 80220C98 0021DBF8  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 80220C9C 0021DBFC  41 82 00 10 */	beq .L_80220CAC
/* 80220CA0 0021DC00  4B FD 83 05 */	bl OSRestoreInterrupts
/* 80220CA4 0021DC04  38 60 00 00 */	li r3, 0
/* 80220CA8 0021DC08  48 00 00 38 */	b .L_80220CE0
.L_80220CAC:
/* 80220CAC 0021DC0C  80 05 00 00 */	lwz r0, 0(r5)
/* 80220CB0 0021DC10  3C 80 CC 00 */	lis r4, 0xCC006800@ha
/* 80220CB4 0021DC14  38 84 68 00 */	addi r4, r4, 0xCC006800@l
/* 80220CB8 0021DC18  60 00 00 04 */	ori r0, r0, 4
/* 80220CBC 0021DC1C  90 05 00 00 */	stw r0, 0(r5)
/* 80220CC0 0021DC20  57 E0 20 36 */	slwi r0, r31, 4
/* 80220CC4 0021DC24  60 00 00 80 */	ori r0, r0, 0x80
/* 80220CC8 0021DC28  80 A4 00 28 */	lwz r5, 0x28(r4)
/* 80220CCC 0021DC2C  70 A5 04 05 */	andi. r5, r5, 0x405
/* 80220CD0 0021DC30  7C A5 03 78 */	or r5, r5, r0
/* 80220CD4 0021DC34  90 A4 00 28 */	stw r5, 0x28(r4)
/* 80220CD8 0021DC38  4B FD 82 CD */	bl OSRestoreInterrupts
/* 80220CDC 0021DC3C  38 60 00 01 */	li r3, 1
.L_80220CE0:
/* 80220CE0 0021DC40  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80220CE4 0021DC44  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80220CE8 0021DC48  38 21 00 18 */	addi r1, r1, 0x18
/* 80220CEC 0021DC4C  7C 08 03 A6 */	mtlr r0
/* 80220CF0 0021DC50  4E 80 00 20 */	blr 
.endfn AmcEXISelect

.fn AmcEXIDeselect, global
/* 80220CF4 0021DC54  7C 08 02 A6 */	mflr r0
/* 80220CF8 0021DC58  90 01 00 04 */	stw r0, 4(r1)
/* 80220CFC 0021DC5C  94 21 FF F8 */	stwu r1, -8(r1)
/* 80220D00 0021DC60  4B FD 82 7D */	bl OSDisableInterrupts
/* 80220D04 0021DC64  80 8D 2A E8 */	lwz r4, exi@sda21(r13)
/* 80220D08 0021DC68  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80220D0C 0021DC6C  38 A4 00 0C */	addi r5, r4, 0xc
/* 80220D10 0021DC70  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 80220D14 0021DC74  40 82 00 10 */	bne .L_80220D24
/* 80220D18 0021DC78  4B FD 82 8D */	bl OSRestoreInterrupts
/* 80220D1C 0021DC7C  38 60 00 00 */	li r3, 0
/* 80220D20 0021DC80  48 00 00 2C */	b .L_80220D4C
.L_80220D24:
/* 80220D24 0021DC84  80 05 00 00 */	lwz r0, 0(r5)
/* 80220D28 0021DC88  3C 80 CC 00 */	lis r4, 0xCC006800@ha
/* 80220D2C 0021DC8C  38 84 68 00 */	addi r4, r4, 0xCC006800@l
/* 80220D30 0021DC90  54 00 07 B8 */	rlwinm r0, r0, 0, 0x1e, 0x1c
/* 80220D34 0021DC94  90 05 00 00 */	stw r0, 0(r5)
/* 80220D38 0021DC98  80 04 00 28 */	lwz r0, 0x28(r4)
/* 80220D3C 0021DC9C  70 00 04 05 */	andi. r0, r0, 0x405
/* 80220D40 0021DCA0  90 04 00 28 */	stw r0, 0x28(r4)
/* 80220D44 0021DCA4  4B FD 82 61 */	bl OSRestoreInterrupts
/* 80220D48 0021DCA8  38 60 00 01 */	li r3, 1
.L_80220D4C:
/* 80220D4C 0021DCAC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80220D50 0021DCB0  38 21 00 08 */	addi r1, r1, 8
/* 80220D54 0021DCB4  7C 08 03 A6 */	mtlr r0
/* 80220D58 0021DCB8  4E 80 00 20 */	blr 
.endfn AmcEXIDeselect

.fn AmcDebugIntHandler, local
/* 80220D5C 0021DCBC  7C 08 02 A6 */	mflr r0
/* 80220D60 0021DCC0  3C A0 CC 00 */	lis r5, 0xCC003000@ha
/* 80220D64 0021DCC4  90 01 00 04 */	stw r0, 4(r1)
/* 80220D68 0021DCC8  80 05 30 00 */	lwz r0, 0xCC003000@l(r5)
/* 80220D6C 0021DCCC  94 21 FF F8 */	stwu r1, -8(r1)
/* 80220D70 0021DCD0  54 00 04 E6 */	rlwinm r0, r0, 0, 0x13, 0x13
/* 80220D74 0021DCD4  80 6D 2A E8 */	lwz r3, exi@sda21(r13)
/* 80220D78 0021DCD8  60 00 10 00 */	ori r0, r0, 0x1000
/* 80220D7C 0021DCDC  90 05 30 00 */	stw r0, 0x3000(r5)
/* 80220D80 0021DCE0  80 63 00 00 */	lwz r3, 0(r3)
/* 80220D84 0021DCE4  28 03 00 00 */	cmplwi r3, 0
/* 80220D88 0021DCE8  7C 6C 1B 78 */	mr r12, r3
/* 80220D8C 0021DCEC  41 82 00 10 */	beq .L_80220D9C
/* 80220D90 0021DCF0  7D 88 03 A6 */	mtlr r12
/* 80220D94 0021DCF4  38 60 00 02 */	li r3, 2
/* 80220D98 0021DCF8  4E 80 00 21 */	blrl 
.L_80220D9C:
/* 80220D9C 0021DCFC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80220DA0 0021DD00  38 21 00 08 */	addi r1, r1, 8
/* 80220DA4 0021DD04  7C 08 03 A6 */	mtlr r0
/* 80220DA8 0021DD08  4E 80 00 20 */	blr 
.endfn AmcDebugIntHandler

.fn AmcEXIEnableInterrupts, global
/* 80220DAC 0021DD0C  7C 08 02 A6 */	mflr r0
/* 80220DB0 0021DD10  3C 60 00 01 */	lis r3, 0x00008000@ha
/* 80220DB4 0021DD14  90 01 00 04 */	stw r0, 4(r1)
/* 80220DB8 0021DD18  38 63 80 00 */	addi r3, r3, 0x00008000@l
/* 80220DBC 0021DD1C  94 21 FF F8 */	stwu r1, -8(r1)
/* 80220DC0 0021DD20  4B FD 85 5D */	bl __OSMaskInterrupts
/* 80220DC4 0021DD24  3C 60 80 22 */	lis r3, AmcDebugIntHandler@ha
/* 80220DC8 0021DD28  38 83 0D 5C */	addi r4, r3, AmcDebugIntHandler@l
/* 80220DCC 0021DD2C  38 60 00 19 */	li r3, 0x19
/* 80220DD0 0021DD30  4B FD 81 F9 */	bl __OSSetInterruptHandler
/* 80220DD4 0021DD34  38 60 00 40 */	li r3, 0x40
/* 80220DD8 0021DD38  4B FD 85 CD */	bl __OSUnmaskInterrupts
/* 80220DDC 0021DD3C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80220DE0 0021DD40  38 21 00 08 */	addi r1, r1, 8
/* 80220DE4 0021DD44  7C 08 03 A6 */	mtlr r0
/* 80220DE8 0021DD48  4E 80 00 20 */	blr 
.endfn AmcEXIEnableInterrupts

.fn AmcEXIInit, global
/* 80220DEC 0021DD4C  7C 08 02 A6 */	mflr r0
/* 80220DF0 0021DD50  3C 60 80 3D */	lis r3, Ecb@ha
/* 80220DF4 0021DD54  90 01 00 04 */	stw r0, 4(r1)
/* 80220DF8 0021DD58  38 63 62 80 */	addi r3, r3, Ecb@l
/* 80220DFC 0021DD5C  38 80 00 00 */	li r4, 0
/* 80220E00 0021DD60  94 21 FF F8 */	stwu r1, -8(r1)
/* 80220E04 0021DD64  38 A0 00 18 */	li r5, 0x18
/* 80220E08 0021DD68  4B DE 25 19 */	bl memset
/* 80220E0C 0021DD6C  3C 80 CC 00 */	lis r4, 0xCC006828@ha
/* 80220E10 0021DD70  38 00 00 00 */	li r0, 0
/* 80220E14 0021DD74  90 04 68 28 */	stw r0, 0xCC006828@l(r4)
/* 80220E18 0021DD78  90 04 64 3C */	stw r0, 0x643c(r4)
/* 80220E1C 0021DD7C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80220E20 0021DD80  38 21 00 08 */	addi r1, r1, 8
/* 80220E24 0021DD84  7C 08 03 A6 */	mtlr r0
/* 80220E28 0021DD88  4E 80 00 20 */	blr 
.endfn AmcEXIInit

.section .sdata, "wa"  # 0x803DCD20 - 0x803E7820
.balign 8
.obj exi, local
	.4byte Ecb
.endobj exi

.section .bss, "wa"  # 0x802E9640 - 0x803E81E5
.balign 8
.obj Ecb, local
	.skip 0x18
.endobj Ecb
