.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.fn WriteSramCallback, local
/* 801FA69C 001F75FC  7C 08 02 A6 */	mflr r0
/* 801FA6A0 001F7600  3C 60 80 3D */	lis r3, Scb@ha
/* 801FA6A4 001F7604  90 01 00 04 */	stw r0, 4(r1)
/* 801FA6A8 001F7608  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 801FA6AC 001F760C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 801FA6B0 001F7610  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FA6B4 001F7614  93 C1 00 10 */	stw r30, 0x10(r1)
/* 801FA6B8 001F7618  3B DF 00 40 */	addi r30, r31, 0x40
/* 801FA6BC 001F761C  80 9F 00 40 */	lwz r4, 0x40(r31)
/* 801FA6C0 001F7620  7C 7F 22 14 */	add r3, r31, r4
/* 801FA6C4 001F7624  20 A4 00 40 */	subfic r5, r4, 0x40
/* 801FA6C8 001F7628  48 00 00 35 */	bl WriteSram
/* 801FA6CC 001F762C  90 7F 00 4C */	stw r3, 0x4c(r31)
/* 801FA6D0 001F7630  80 1F 00 4C */	lwz r0, 0x4c(r31)
/* 801FA6D4 001F7634  2C 00 00 00 */	cmpwi r0, 0
/* 801FA6D8 001F7638  41 82 00 0C */	beq .L_801FA6E4
/* 801FA6DC 001F763C  38 00 00 40 */	li r0, 0x40
/* 801FA6E0 001F7640  90 1E 00 00 */	stw r0, 0(r30)
.L_801FA6E4:
/* 801FA6E4 001F7644  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 801FA6E8 001F7648  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 801FA6EC 001F764C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 801FA6F0 001F7650  7C 08 03 A6 */	mtlr r0
/* 801FA6F4 001F7654  38 21 00 18 */	addi r1, r1, 0x18
/* 801FA6F8 001F7658  4E 80 00 20 */	blr 
.endfn WriteSramCallback

.fn WriteSram, local
/* 801FA6FC 001F765C  7C 08 02 A6 */	mflr r0
/* 801FA700 001F7660  3C C0 80 20 */	lis r6, WriteSramCallback@ha
/* 801FA704 001F7664  90 01 00 04 */	stw r0, 4(r1)
/* 801FA708 001F7668  38 06 A6 9C */	addi r0, r6, WriteSramCallback@l
/* 801FA70C 001F766C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 801FA710 001F7670  93 E1 00 24 */	stw r31, 0x24(r1)
/* 801FA714 001F7674  3B E4 00 00 */	addi r31, r4, 0
/* 801FA718 001F7678  38 80 00 01 */	li r4, 1
/* 801FA71C 001F767C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 801FA720 001F7680  3B C5 00 00 */	addi r30, r5, 0
/* 801FA724 001F7684  7C 05 03 78 */	mr r5, r0
/* 801FA728 001F7688  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 801FA72C 001F768C  3B A3 00 00 */	addi r29, r3, 0
/* 801FA730 001F7690  38 60 00 00 */	li r3, 0
/* 801FA734 001F7694  4B FF E6 09 */	bl EXILock
/* 801FA738 001F7698  2C 03 00 00 */	cmpwi r3, 0
/* 801FA73C 001F769C  40 82 00 0C */	bne .L_801FA748
/* 801FA740 001F76A0  38 60 00 00 */	li r3, 0
/* 801FA744 001F76A4  48 00 00 B4 */	b .L_801FA7F8
.L_801FA748:
/* 801FA748 001F76A8  38 60 00 00 */	li r3, 0
/* 801FA74C 001F76AC  38 80 00 01 */	li r4, 1
/* 801FA750 001F76B0  38 A0 00 03 */	li r5, 3
/* 801FA754 001F76B4  4B FF DF 89 */	bl EXISelect
/* 801FA758 001F76B8  2C 03 00 00 */	cmpwi r3, 0
/* 801FA75C 001F76BC  40 82 00 14 */	bne .L_801FA770
/* 801FA760 001F76C0  38 60 00 00 */	li r3, 0
/* 801FA764 001F76C4  4B FF E6 CD */	bl EXIUnlock
/* 801FA768 001F76C8  38 60 00 00 */	li r3, 0
/* 801FA76C 001F76CC  48 00 00 8C */	b .L_801FA7F8
.L_801FA770:
/* 801FA770 001F76D0  57 FF 30 32 */	slwi r31, r31, 6
/* 801FA774 001F76D4  38 1F 01 00 */	addi r0, r31, 0x100
/* 801FA778 001F76D8  64 00 A0 00 */	oris r0, r0, 0xa000
/* 801FA77C 001F76DC  90 01 00 14 */	stw r0, 0x14(r1)
/* 801FA780 001F76E0  38 81 00 14 */	addi r4, r1, 0x14
/* 801FA784 001F76E4  38 60 00 00 */	li r3, 0
/* 801FA788 001F76E8  38 A0 00 04 */	li r5, 4
/* 801FA78C 001F76EC  38 C0 00 01 */	li r6, 1
/* 801FA790 001F76F0  38 E0 00 00 */	li r7, 0
/* 801FA794 001F76F4  4B FF D5 2D */	bl EXIImm
/* 801FA798 001F76F8  7C 60 00 34 */	cntlzw r0, r3
/* 801FA79C 001F76FC  54 1F D9 7E */	srwi r31, r0, 5
/* 801FA7A0 001F7700  38 60 00 00 */	li r3, 0
/* 801FA7A4 001F7704  4B FF D9 05 */	bl EXISync
/* 801FA7A8 001F7708  7C 60 00 34 */	cntlzw r0, r3
/* 801FA7AC 001F770C  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA7B0 001F7710  38 9D 00 00 */	addi r4, r29, 0
/* 801FA7B4 001F7714  38 BE 00 00 */	addi r5, r30, 0
/* 801FA7B8 001F7718  7F FF 03 78 */	or r31, r31, r0
/* 801FA7BC 001F771C  38 60 00 00 */	li r3, 0
/* 801FA7C0 001F7720  38 C0 00 01 */	li r6, 1
/* 801FA7C4 001F7724  4B FF D7 59 */	bl EXIImmEx
/* 801FA7C8 001F7728  7C 60 00 34 */	cntlzw r0, r3
/* 801FA7CC 001F772C  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA7D0 001F7730  7F FF 03 78 */	or r31, r31, r0
/* 801FA7D4 001F7734  38 60 00 00 */	li r3, 0
/* 801FA7D8 001F7738  4B FF E0 31 */	bl EXIDeselect
/* 801FA7DC 001F773C  7C 60 00 34 */	cntlzw r0, r3
/* 801FA7E0 001F7740  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA7E4 001F7744  7F FF 03 78 */	or r31, r31, r0
/* 801FA7E8 001F7748  38 60 00 00 */	li r3, 0
/* 801FA7EC 001F774C  4B FF E6 45 */	bl EXIUnlock
/* 801FA7F0 001F7750  7F E0 00 34 */	cntlzw r0, r31
/* 801FA7F4 001F7754  54 03 D9 7E */	srwi r3, r0, 5
.L_801FA7F8:
/* 801FA7F8 001F7758  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 801FA7FC 001F775C  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 801FA800 001F7760  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 801FA804 001F7764  7C 08 03 A6 */	mtlr r0
/* 801FA808 001F7768  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 801FA80C 001F776C  38 21 00 28 */	addi r1, r1, 0x28
/* 801FA810 001F7770  4E 80 00 20 */	blr 
.endfn WriteSram

.fn __OSInitSram, global
/* 801FA814 001F7774  7C 08 02 A6 */	mflr r0
/* 801FA818 001F7778  3C 60 80 3D */	lis r3, Scb@ha
/* 801FA81C 001F777C  90 01 00 04 */	stw r0, 4(r1)
/* 801FA820 001F7780  38 80 00 40 */	li r4, 0x40
/* 801FA824 001F7784  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 801FA828 001F7788  93 E1 00 14 */	stw r31, 0x14(r1)
/* 801FA82C 001F778C  3B E0 00 00 */	li r31, 0
/* 801FA830 001F7790  93 C1 00 10 */	stw r30, 0x10(r1)
/* 801FA834 001F7794  3B C3 24 C0 */	addi r30, r3, Scb@l
/* 801FA838 001F7798  38 7E 00 00 */	addi r3, r30, 0
/* 801FA83C 001F779C  93 FE 00 44 */	stw r31, 0x44(r30)
/* 801FA840 001F77A0  93 FE 00 48 */	stw r31, 0x48(r30)
/* 801FA844 001F77A4  4B FF C3 75 */	bl DCInvalidateRange
/* 801FA848 001F77A8  38 60 00 00 */	li r3, 0
/* 801FA84C 001F77AC  38 80 00 01 */	li r4, 1
/* 801FA850 001F77B0  38 A0 00 00 */	li r5, 0
/* 801FA854 001F77B4  4B FF E4 E9 */	bl EXILock
/* 801FA858 001F77B8  2C 03 00 00 */	cmpwi r3, 0
/* 801FA85C 001F77BC  40 82 00 08 */	bne .L_801FA864
/* 801FA860 001F77C0  48 00 00 C4 */	b .L_801FA924
.L_801FA864:
/* 801FA864 001F77C4  38 60 00 00 */	li r3, 0
/* 801FA868 001F77C8  38 80 00 01 */	li r4, 1
/* 801FA86C 001F77CC  38 A0 00 03 */	li r5, 3
/* 801FA870 001F77D0  4B FF DE 6D */	bl EXISelect
/* 801FA874 001F77D4  2C 03 00 00 */	cmpwi r3, 0
/* 801FA878 001F77D8  40 82 00 10 */	bne .L_801FA888
/* 801FA87C 001F77DC  38 60 00 00 */	li r3, 0
/* 801FA880 001F77E0  4B FF E5 B1 */	bl EXIUnlock
/* 801FA884 001F77E4  48 00 00 A0 */	b .L_801FA924
.L_801FA888:
/* 801FA888 001F77E8  3C 60 20 00 */	lis r3, 0x20000100@ha
/* 801FA88C 001F77EC  38 03 01 00 */	addi r0, r3, 0x20000100@l
/* 801FA890 001F77F0  90 01 00 08 */	stw r0, 8(r1)
/* 801FA894 001F77F4  38 81 00 08 */	addi r4, r1, 8
/* 801FA898 001F77F8  38 60 00 00 */	li r3, 0
/* 801FA89C 001F77FC  38 A0 00 04 */	li r5, 4
/* 801FA8A0 001F7800  38 C0 00 01 */	li r6, 1
/* 801FA8A4 001F7804  38 E0 00 00 */	li r7, 0
/* 801FA8A8 001F7808  4B FF D4 19 */	bl EXIImm
/* 801FA8AC 001F780C  7C 60 00 34 */	cntlzw r0, r3
/* 801FA8B0 001F7810  54 1F D9 7E */	srwi r31, r0, 5
/* 801FA8B4 001F7814  38 60 00 00 */	li r3, 0
/* 801FA8B8 001F7818  4B FF D7 F1 */	bl EXISync
/* 801FA8BC 001F781C  7C 60 00 34 */	cntlzw r0, r3
/* 801FA8C0 001F7820  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA8C4 001F7824  38 9E 00 00 */	addi r4, r30, 0
/* 801FA8C8 001F7828  7F FF 03 78 */	or r31, r31, r0
/* 801FA8CC 001F782C  38 60 00 00 */	li r3, 0
/* 801FA8D0 001F7830  38 A0 00 40 */	li r5, 0x40
/* 801FA8D4 001F7834  38 C0 00 00 */	li r6, 0
/* 801FA8D8 001F7838  38 E0 00 00 */	li r7, 0
/* 801FA8DC 001F783C  4B FF D6 E1 */	bl EXIDma
/* 801FA8E0 001F7840  7C 60 00 34 */	cntlzw r0, r3
/* 801FA8E4 001F7844  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA8E8 001F7848  7F FF 03 78 */	or r31, r31, r0
/* 801FA8EC 001F784C  38 60 00 00 */	li r3, 0
/* 801FA8F0 001F7850  4B FF D7 B9 */	bl EXISync
/* 801FA8F4 001F7854  7C 60 00 34 */	cntlzw r0, r3
/* 801FA8F8 001F7858  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA8FC 001F785C  7F FF 03 78 */	or r31, r31, r0
/* 801FA900 001F7860  38 60 00 00 */	li r3, 0
/* 801FA904 001F7864  4B FF DF 05 */	bl EXIDeselect
/* 801FA908 001F7868  7C 60 00 34 */	cntlzw r0, r3
/* 801FA90C 001F786C  54 00 D9 7E */	srwi r0, r0, 5
/* 801FA910 001F7870  7F FF 03 78 */	or r31, r31, r0
/* 801FA914 001F7874  38 60 00 00 */	li r3, 0
/* 801FA918 001F7878  4B FF E5 19 */	bl EXIUnlock
/* 801FA91C 001F787C  7F E0 00 34 */	cntlzw r0, r31
/* 801FA920 001F7880  54 1F D9 7E */	srwi r31, r0, 5
.L_801FA924:
/* 801FA924 001F7884  93 FE 00 4C */	stw r31, 0x4c(r30)
/* 801FA928 001F7888  38 00 00 40 */	li r0, 0x40
/* 801FA92C 001F788C  90 1E 00 40 */	stw r0, 0x40(r30)
/* 801FA930 001F7890  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 801FA934 001F7894  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 801FA938 001F7898  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 801FA93C 001F789C  38 21 00 18 */	addi r1, r1, 0x18
/* 801FA940 001F78A0  7C 08 03 A6 */	mtlr r0
/* 801FA944 001F78A4  4E 80 00 20 */	blr 
.endfn __OSInitSram

.fn __OSLockSram, global
/* 801FA948 001F78A8  7C 08 02 A6 */	mflr r0
/* 801FA94C 001F78AC  3C 60 80 3D */	lis r3, Scb@ha
/* 801FA950 001F78B0  90 01 00 04 */	stw r0, 4(r1)
/* 801FA954 001F78B4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FA958 001F78B8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801FA95C 001F78BC  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FA960 001F78C0  4B FF E6 1D */	bl OSDisableInterrupts
/* 801FA964 001F78C4  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FA968 001F78C8  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FA96C 001F78CC  2C 00 00 00 */	cmpwi r0, 0
/* 801FA970 001F78D0  41 82 00 10 */	beq .L_801FA980
/* 801FA974 001F78D4  4B FF E6 31 */	bl OSRestoreInterrupts
/* 801FA978 001F78D8  3B E0 00 00 */	li r31, 0
/* 801FA97C 001F78DC  48 00 00 10 */	b .L_801FA98C
.L_801FA980:
/* 801FA980 001F78E0  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FA984 001F78E4  38 00 00 01 */	li r0, 1
/* 801FA988 001F78E8  90 04 00 00 */	stw r0, 0(r4)
.L_801FA98C:
/* 801FA98C 001F78EC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FA990 001F78F0  7F E3 FB 78 */	mr r3, r31
/* 801FA994 001F78F4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801FA998 001F78F8  38 21 00 10 */	addi r1, r1, 0x10
/* 801FA99C 001F78FC  7C 08 03 A6 */	mtlr r0
/* 801FA9A0 001F7900  4E 80 00 20 */	blr 
.endfn __OSLockSram

.fn __OSLockSramEx, global
/* 801FA9A4 001F7904  7C 08 02 A6 */	mflr r0
/* 801FA9A8 001F7908  3C 60 80 3D */	lis r3, Scb@ha
/* 801FA9AC 001F790C  90 01 00 04 */	stw r0, 4(r1)
/* 801FA9B0 001F7910  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FA9B4 001F7914  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801FA9B8 001F7918  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FA9BC 001F791C  4B FF E5 C1 */	bl OSDisableInterrupts
/* 801FA9C0 001F7920  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FA9C4 001F7924  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FA9C8 001F7928  2C 00 00 00 */	cmpwi r0, 0
/* 801FA9CC 001F792C  41 82 00 10 */	beq .L_801FA9DC
/* 801FA9D0 001F7930  4B FF E5 D5 */	bl OSRestoreInterrupts
/* 801FA9D4 001F7934  38 60 00 00 */	li r3, 0
/* 801FA9D8 001F7938  48 00 00 14 */	b .L_801FA9EC
.L_801FA9DC:
/* 801FA9DC 001F793C  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FA9E0 001F7940  38 00 00 01 */	li r0, 1
/* 801FA9E4 001F7944  38 7F 00 14 */	addi r3, r31, 0x14
/* 801FA9E8 001F7948  90 04 00 00 */	stw r0, 0(r4)
.L_801FA9EC:
/* 801FA9EC 001F794C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FA9F0 001F7950  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801FA9F4 001F7954  38 21 00 10 */	addi r1, r1, 0x10
/* 801FA9F8 001F7958  7C 08 03 A6 */	mtlr r0
/* 801FA9FC 001F795C  4E 80 00 20 */	blr 
.endfn __OSLockSramEx

.fn UnlockSram, local
/* 801FAA00 001F7960  7C 08 02 A6 */	mflr r0
/* 801FAA04 001F7964  2C 03 00 00 */	cmpwi r3, 0
/* 801FAA08 001F7968  90 01 00 04 */	stw r0, 4(r1)
/* 801FAA0C 001F796C  3C 60 80 3D */	lis r3, Scb@ha
/* 801FAA10 001F7970  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801FAA14 001F7974  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 801FAA18 001F7978  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FAA1C 001F797C  41 82 02 C4 */	beq .L_801FACE0
/* 801FAA20 001F7980  28 04 00 00 */	cmplwi r4, 0
/* 801FAA24 001F7984  40 82 01 B0 */	bne .L_801FABD4
/* 801FAA28 001F7988  88 7F 00 13 */	lbz r3, 0x13(r31)
/* 801FAA2C 001F798C  54 60 07 BE */	clrlwi r0, r3, 0x1e
/* 801FAA30 001F7990  28 00 00 02 */	cmplwi r0, 2
/* 801FAA34 001F7994  40 81 00 0C */	ble .L_801FAA40
/* 801FAA38 001F7998  54 60 00 3A */	rlwinm r0, r3, 0, 0, 0x1d
/* 801FAA3C 001F799C  98 1F 00 13 */	stb r0, 0x13(r31)
.L_801FAA40:
/* 801FAA40 001F79A0  38 00 00 00 */	li r0, 0
/* 801FAA44 001F79A4  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAA48 001F79A8  38 BF 00 14 */	addi r5, r31, 0x14
/* 801FAA4C 001F79AC  38 DF 00 0C */	addi r6, r31, 0xc
/* 801FAA50 001F79B0  38 65 00 01 */	addi r3, r5, 1
/* 801FAA54 001F79B4  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAA58 001F79B8  7C 66 18 50 */	subf r3, r6, r3
/* 801FAA5C 001F79BC  7C 06 28 40 */	cmplw r6, r5
/* 801FAA60 001F79C0  54 63 F8 7E */	srwi r3, r3, 1
/* 801FAA64 001F79C4  40 80 01 70 */	bge .L_801FABD4
/* 801FAA68 001F79C8  54 60 E8 FF */	rlwinm. r0, r3, 0x1d, 3, 0x1f
/* 801FAA6C 001F79CC  7C 09 03 A6 */	mtctr r0
/* 801FAA70 001F79D0  41 82 01 34 */	beq .L_801FABA4
.L_801FAA74:
/* 801FAA74 001F79D4  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAA78 001F79D8  A0 06 00 00 */	lhz r0, 0(r6)
/* 801FAA7C 001F79DC  7C 05 02 14 */	add r0, r5, r0
/* 801FAA80 001F79E0  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAA84 001F79E4  A0 06 00 00 */	lhz r0, 0(r6)
/* 801FAA88 001F79E8  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAA8C 001F79EC  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAA90 001F79F0  7C 05 02 14 */	add r0, r5, r0
/* 801FAA94 001F79F4  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAA98 001F79F8  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAA9C 001F79FC  A0 06 00 02 */	lhz r0, 2(r6)
/* 801FAAA0 001F7A00  7C 05 02 14 */	add r0, r5, r0
/* 801FAAA4 001F7A04  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAAA8 001F7A08  A0 06 00 02 */	lhz r0, 2(r6)
/* 801FAAAC 001F7A0C  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAAB0 001F7A10  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAAB4 001F7A14  7C 05 02 14 */	add r0, r5, r0
/* 801FAAB8 001F7A18  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAABC 001F7A1C  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAAC0 001F7A20  A0 06 00 04 */	lhz r0, 4(r6)
/* 801FAAC4 001F7A24  7C 05 02 14 */	add r0, r5, r0
/* 801FAAC8 001F7A28  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAACC 001F7A2C  A0 06 00 04 */	lhz r0, 4(r6)
/* 801FAAD0 001F7A30  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAAD4 001F7A34  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAAD8 001F7A38  7C 05 02 14 */	add r0, r5, r0
/* 801FAADC 001F7A3C  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAAE0 001F7A40  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAAE4 001F7A44  A0 06 00 06 */	lhz r0, 6(r6)
/* 801FAAE8 001F7A48  7C 05 02 14 */	add r0, r5, r0
/* 801FAAEC 001F7A4C  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAAF0 001F7A50  A0 06 00 06 */	lhz r0, 6(r6)
/* 801FAAF4 001F7A54  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAAF8 001F7A58  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAAFC 001F7A5C  7C 05 02 14 */	add r0, r5, r0
/* 801FAB00 001F7A60  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAB04 001F7A64  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAB08 001F7A68  A0 06 00 08 */	lhz r0, 8(r6)
/* 801FAB0C 001F7A6C  7C 05 02 14 */	add r0, r5, r0
/* 801FAB10 001F7A70  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAB14 001F7A74  A0 06 00 08 */	lhz r0, 8(r6)
/* 801FAB18 001F7A78  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAB1C 001F7A7C  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAB20 001F7A80  7C 05 02 14 */	add r0, r5, r0
/* 801FAB24 001F7A84  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAB28 001F7A88  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAB2C 001F7A8C  A0 06 00 0A */	lhz r0, 0xa(r6)
/* 801FAB30 001F7A90  7C 05 02 14 */	add r0, r5, r0
/* 801FAB34 001F7A94  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAB38 001F7A98  A0 06 00 0A */	lhz r0, 0xa(r6)
/* 801FAB3C 001F7A9C  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAB40 001F7AA0  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAB44 001F7AA4  7C 05 02 14 */	add r0, r5, r0
/* 801FAB48 001F7AA8  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAB4C 001F7AAC  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAB50 001F7AB0  A0 06 00 0C */	lhz r0, 0xc(r6)
/* 801FAB54 001F7AB4  7C 05 02 14 */	add r0, r5, r0
/* 801FAB58 001F7AB8  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAB5C 001F7ABC  A0 06 00 0C */	lhz r0, 0xc(r6)
/* 801FAB60 001F7AC0  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAB64 001F7AC4  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAB68 001F7AC8  7C 05 02 14 */	add r0, r5, r0
/* 801FAB6C 001F7ACC  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAB70 001F7AD0  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FAB74 001F7AD4  A0 06 00 0E */	lhz r0, 0xe(r6)
/* 801FAB78 001F7AD8  7C 05 02 14 */	add r0, r5, r0
/* 801FAB7C 001F7ADC  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FAB80 001F7AE0  A0 06 00 0E */	lhz r0, 0xe(r6)
/* 801FAB84 001F7AE4  38 C6 00 10 */	addi r6, r6, 0x10
/* 801FAB88 001F7AE8  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FAB8C 001F7AEC  7C 00 00 F8 */	nor r0, r0, r0
/* 801FAB90 001F7AF0  7C 05 02 14 */	add r0, r5, r0
/* 801FAB94 001F7AF4  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FAB98 001F7AF8  42 00 FE DC */	bdnz .L_801FAA74
/* 801FAB9C 001F7AFC  70 63 00 07 */	andi. r3, r3, 7
/* 801FABA0 001F7B00  41 82 00 34 */	beq .L_801FABD4
.L_801FABA4:
/* 801FABA4 001F7B04  7C 69 03 A6 */	mtctr r3
.L_801FABA8:
/* 801FABA8 001F7B08  A0 BF 00 00 */	lhz r5, 0(r31)
/* 801FABAC 001F7B0C  A0 06 00 00 */	lhz r0, 0(r6)
/* 801FABB0 001F7B10  7C 05 02 14 */	add r0, r5, r0
/* 801FABB4 001F7B14  B0 1F 00 00 */	sth r0, 0(r31)
/* 801FABB8 001F7B18  A0 06 00 00 */	lhz r0, 0(r6)
/* 801FABBC 001F7B1C  38 C6 00 02 */	addi r6, r6, 2
/* 801FABC0 001F7B20  A0 BF 00 02 */	lhz r5, 2(r31)
/* 801FABC4 001F7B24  7C 00 00 F8 */	nor r0, r0, r0
/* 801FABC8 001F7B28  7C 05 02 14 */	add r0, r5, r0
/* 801FABCC 001F7B2C  B0 1F 00 02 */	sth r0, 2(r31)
/* 801FABD0 001F7B30  42 00 FF D8 */	bdnz .L_801FABA8
.L_801FABD4:
/* 801FABD4 001F7B34  3B DF 00 40 */	addi r30, r31, 0x40
/* 801FABD8 001F7B38  80 1F 00 40 */	lwz r0, 0x40(r31)
/* 801FABDC 001F7B3C  7C 04 00 40 */	cmplw r4, r0
/* 801FABE0 001F7B40  40 80 00 08 */	bge .L_801FABE8
/* 801FABE4 001F7B44  90 9E 00 00 */	stw r4, 0(r30)
.L_801FABE8:
/* 801FABE8 001F7B48  83 BE 00 00 */	lwz r29, 0(r30)
/* 801FABEC 001F7B4C  3C 60 80 20 */	lis r3, WriteSramCallback@ha
/* 801FABF0 001F7B50  38 A3 A6 9C */	addi r5, r3, WriteSramCallback@l
/* 801FABF4 001F7B54  23 7D 00 40 */	subfic r27, r29, 0x40
/* 801FABF8 001F7B58  7F 9F EA 14 */	add r28, r31, r29
/* 801FABFC 001F7B5C  38 60 00 00 */	li r3, 0
/* 801FAC00 001F7B60  38 80 00 01 */	li r4, 1
/* 801FAC04 001F7B64  4B FF E1 39 */	bl EXILock
/* 801FAC08 001F7B68  2C 03 00 00 */	cmpwi r3, 0
/* 801FAC0C 001F7B6C  40 82 00 0C */	bne .L_801FAC18
/* 801FAC10 001F7B70  38 00 00 00 */	li r0, 0
/* 801FAC14 001F7B74  48 00 00 B4 */	b .L_801FACC8
.L_801FAC18:
/* 801FAC18 001F7B78  38 60 00 00 */	li r3, 0
/* 801FAC1C 001F7B7C  38 80 00 01 */	li r4, 1
/* 801FAC20 001F7B80  38 A0 00 03 */	li r5, 3
/* 801FAC24 001F7B84  4B FF DA B9 */	bl EXISelect
/* 801FAC28 001F7B88  2C 03 00 00 */	cmpwi r3, 0
/* 801FAC2C 001F7B8C  40 82 00 14 */	bne .L_801FAC40
/* 801FAC30 001F7B90  38 60 00 00 */	li r3, 0
/* 801FAC34 001F7B94  4B FF E1 FD */	bl EXIUnlock
/* 801FAC38 001F7B98  38 00 00 00 */	li r0, 0
/* 801FAC3C 001F7B9C  48 00 00 8C */	b .L_801FACC8
.L_801FAC40:
/* 801FAC40 001F7BA0  57 A3 30 32 */	slwi r3, r29, 6
/* 801FAC44 001F7BA4  38 03 01 00 */	addi r0, r3, 0x100
/* 801FAC48 001F7BA8  64 00 A0 00 */	oris r0, r0, 0xa000
/* 801FAC4C 001F7BAC  90 01 00 10 */	stw r0, 0x10(r1)
/* 801FAC50 001F7BB0  38 81 00 10 */	addi r4, r1, 0x10
/* 801FAC54 001F7BB4  38 60 00 00 */	li r3, 0
/* 801FAC58 001F7BB8  38 A0 00 04 */	li r5, 4
/* 801FAC5C 001F7BBC  38 C0 00 01 */	li r6, 1
/* 801FAC60 001F7BC0  38 E0 00 00 */	li r7, 0
/* 801FAC64 001F7BC4  4B FF D0 5D */	bl EXIImm
/* 801FAC68 001F7BC8  7C 60 00 34 */	cntlzw r0, r3
/* 801FAC6C 001F7BCC  54 1D D9 7E */	srwi r29, r0, 5
/* 801FAC70 001F7BD0  38 60 00 00 */	li r3, 0
/* 801FAC74 001F7BD4  4B FF D4 35 */	bl EXISync
/* 801FAC78 001F7BD8  7C 60 00 34 */	cntlzw r0, r3
/* 801FAC7C 001F7BDC  54 00 D9 7E */	srwi r0, r0, 5
/* 801FAC80 001F7BE0  38 9C 00 00 */	addi r4, r28, 0
/* 801FAC84 001F7BE4  38 BB 00 00 */	addi r5, r27, 0
/* 801FAC88 001F7BE8  7F BD 03 78 */	or r29, r29, r0
/* 801FAC8C 001F7BEC  38 60 00 00 */	li r3, 0
/* 801FAC90 001F7BF0  38 C0 00 01 */	li r6, 1
/* 801FAC94 001F7BF4  4B FF D2 89 */	bl EXIImmEx
/* 801FAC98 001F7BF8  7C 60 00 34 */	cntlzw r0, r3
/* 801FAC9C 001F7BFC  54 00 D9 7E */	srwi r0, r0, 5
/* 801FACA0 001F7C00  7F BD 03 78 */	or r29, r29, r0
/* 801FACA4 001F7C04  38 60 00 00 */	li r3, 0
/* 801FACA8 001F7C08  4B FF DB 61 */	bl EXIDeselect
/* 801FACAC 001F7C0C  7C 60 00 34 */	cntlzw r0, r3
/* 801FACB0 001F7C10  54 00 D9 7E */	srwi r0, r0, 5
/* 801FACB4 001F7C14  7F BD 03 78 */	or r29, r29, r0
/* 801FACB8 001F7C18  38 60 00 00 */	li r3, 0
/* 801FACBC 001F7C1C  4B FF E1 75 */	bl EXIUnlock
/* 801FACC0 001F7C20  7F A0 00 34 */	cntlzw r0, r29
/* 801FACC4 001F7C24  54 00 D9 7E */	srwi r0, r0, 5
.L_801FACC8:
/* 801FACC8 001F7C28  90 1F 00 4C */	stw r0, 0x4c(r31)
/* 801FACCC 001F7C2C  80 1F 00 4C */	lwz r0, 0x4c(r31)
/* 801FACD0 001F7C30  2C 00 00 00 */	cmpwi r0, 0
/* 801FACD4 001F7C34  41 82 00 0C */	beq .L_801FACE0
/* 801FACD8 001F7C38  38 00 00 40 */	li r0, 0x40
/* 801FACDC 001F7C3C  90 1E 00 00 */	stw r0, 0(r30)
.L_801FACE0:
/* 801FACE0 001F7C40  38 00 00 00 */	li r0, 0
/* 801FACE4 001F7C44  90 1F 00 48 */	stw r0, 0x48(r31)
/* 801FACE8 001F7C48  80 7F 00 44 */	lwz r3, 0x44(r31)
/* 801FACEC 001F7C4C  4B FF E2 B9 */	bl OSRestoreInterrupts
/* 801FACF0 001F7C50  80 7F 00 4C */	lwz r3, 0x4c(r31)
/* 801FACF4 001F7C54  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 801FACF8 001F7C58  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801FACFC 001F7C5C  38 21 00 30 */	addi r1, r1, 0x30
/* 801FAD00 001F7C60  7C 08 03 A6 */	mtlr r0
/* 801FAD04 001F7C64  4E 80 00 20 */	blr 
.endfn UnlockSram

.fn __OSUnlockSram, global
/* 801FAD08 001F7C68  7C 08 02 A6 */	mflr r0
/* 801FAD0C 001F7C6C  38 80 00 00 */	li r4, 0
/* 801FAD10 001F7C70  90 01 00 04 */	stw r0, 4(r1)
/* 801FAD14 001F7C74  94 21 FF F8 */	stwu r1, -8(r1)
/* 801FAD18 001F7C78  4B FF FC E9 */	bl UnlockSram
/* 801FAD1C 001F7C7C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801FAD20 001F7C80  38 21 00 08 */	addi r1, r1, 8
/* 801FAD24 001F7C84  7C 08 03 A6 */	mtlr r0
/* 801FAD28 001F7C88  4E 80 00 20 */	blr 
.endfn __OSUnlockSram

.fn __OSUnlockSramEx, global
/* 801FAD2C 001F7C8C  7C 08 02 A6 */	mflr r0
/* 801FAD30 001F7C90  38 80 00 14 */	li r4, 0x14
/* 801FAD34 001F7C94  90 01 00 04 */	stw r0, 4(r1)
/* 801FAD38 001F7C98  94 21 FF F8 */	stwu r1, -8(r1)
/* 801FAD3C 001F7C9C  4B FF FC C5 */	bl UnlockSram
/* 801FAD40 001F7CA0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801FAD44 001F7CA4  38 21 00 08 */	addi r1, r1, 8
/* 801FAD48 001F7CA8  7C 08 03 A6 */	mtlr r0
/* 801FAD4C 001F7CAC  4E 80 00 20 */	blr 
.endfn __OSUnlockSramEx

.fn __OSSyncSram, global
/* 801FAD50 001F7CB0  3C 60 80 3D */	lis r3, Scb@ha
/* 801FAD54 001F7CB4  38 63 24 C0 */	addi r3, r3, Scb@l
/* 801FAD58 001F7CB8  80 63 00 4C */	lwz r3, 0x4c(r3)
/* 801FAD5C 001F7CBC  4E 80 00 20 */	blr 
.endfn __OSSyncSram

.fn OSGetSoundMode, global
/* 801FAD60 001F7CC0  7C 08 02 A6 */	mflr r0
/* 801FAD64 001F7CC4  3C 60 80 3D */	lis r3, Scb@ha
/* 801FAD68 001F7CC8  90 01 00 04 */	stw r0, 4(r1)
/* 801FAD6C 001F7CCC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801FAD70 001F7CD0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801FAD74 001F7CD4  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FAD78 001F7CD8  4B FF E2 05 */	bl OSDisableInterrupts
/* 801FAD7C 001F7CDC  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FAD80 001F7CE0  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FAD84 001F7CE4  2C 00 00 00 */	cmpwi r0, 0
/* 801FAD88 001F7CE8  41 82 00 10 */	beq .L_801FAD98
/* 801FAD8C 001F7CEC  4B FF E2 19 */	bl OSRestoreInterrupts
/* 801FAD90 001F7CF0  3B E0 00 00 */	li r31, 0
/* 801FAD94 001F7CF4  48 00 00 10 */	b .L_801FADA4
.L_801FAD98:
/* 801FAD98 001F7CF8  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FAD9C 001F7CFC  38 00 00 01 */	li r0, 1
/* 801FADA0 001F7D00  90 04 00 00 */	stw r0, 0(r4)
.L_801FADA4:
/* 801FADA4 001F7D04  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 801FADA8 001F7D08  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 801FADAC 001F7D0C  41 82 00 0C */	beq .L_801FADB8
/* 801FADB0 001F7D10  3B E0 00 01 */	li r31, 1
/* 801FADB4 001F7D14  48 00 00 08 */	b .L_801FADBC
.L_801FADB8:
/* 801FADB8 001F7D18  3B E0 00 00 */	li r31, 0
.L_801FADBC:
/* 801FADBC 001F7D1C  38 60 00 00 */	li r3, 0
/* 801FADC0 001F7D20  38 80 00 00 */	li r4, 0
/* 801FADC4 001F7D24  4B FF FC 3D */	bl UnlockSram
/* 801FADC8 001F7D28  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801FADCC 001F7D2C  7F E3 FB 78 */	mr r3, r31
/* 801FADD0 001F7D30  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801FADD4 001F7D34  38 21 00 20 */	addi r1, r1, 0x20
/* 801FADD8 001F7D38  7C 08 03 A6 */	mtlr r0
/* 801FADDC 001F7D3C  4E 80 00 20 */	blr 
.endfn OSGetSoundMode

.fn OSSetSoundMode, global
/* 801FADE0 001F7D40  7C 08 02 A6 */	mflr r0
/* 801FADE4 001F7D44  3C 80 80 3D */	lis r4, Scb@ha
/* 801FADE8 001F7D48  90 01 00 04 */	stw r0, 4(r1)
/* 801FADEC 001F7D4C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801FADF0 001F7D50  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801FADF4 001F7D54  3B E4 24 C0 */	addi r31, r4, Scb@l
/* 801FADF8 001F7D58  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801FADFC 001F7D5C  54 7E 17 7A */	rlwinm r30, r3, 2, 0x1d, 0x1d
/* 801FAE00 001F7D60  4B FF E1 7D */	bl OSDisableInterrupts
/* 801FAE04 001F7D64  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FAE08 001F7D68  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FAE0C 001F7D6C  2C 00 00 00 */	cmpwi r0, 0
/* 801FAE10 001F7D70  41 82 00 10 */	beq .L_801FAE20
/* 801FAE14 001F7D74  4B FF E1 91 */	bl OSRestoreInterrupts
/* 801FAE18 001F7D78  3B E0 00 00 */	li r31, 0
/* 801FAE1C 001F7D7C  48 00 00 10 */	b .L_801FAE2C
.L_801FAE20:
/* 801FAE20 001F7D80  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FAE24 001F7D84  38 00 00 01 */	li r0, 1
/* 801FAE28 001F7D88  90 04 00 00 */	stw r0, 0(r4)
.L_801FAE2C:
/* 801FAE2C 001F7D8C  88 7F 00 13 */	lbz r3, 0x13(r31)
/* 801FAE30 001F7D90  54 60 07 7A */	rlwinm r0, r3, 0, 0x1d, 0x1d
/* 801FAE34 001F7D94  7C 1E 00 40 */	cmplw r30, r0
/* 801FAE38 001F7D98  40 82 00 14 */	bne .L_801FAE4C
/* 801FAE3C 001F7D9C  38 60 00 00 */	li r3, 0
/* 801FAE40 001F7DA0  38 80 00 00 */	li r4, 0
/* 801FAE44 001F7DA4  4B FF FB BD */	bl UnlockSram
/* 801FAE48 001F7DA8  48 00 00 24 */	b .L_801FAE6C
.L_801FAE4C:
/* 801FAE4C 001F7DAC  54 60 07 B8 */	rlwinm r0, r3, 0, 0x1e, 0x1c
/* 801FAE50 001F7DB0  98 1F 00 13 */	stb r0, 0x13(r31)
/* 801FAE54 001F7DB4  38 60 00 01 */	li r3, 1
/* 801FAE58 001F7DB8  38 80 00 00 */	li r4, 0
/* 801FAE5C 001F7DBC  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 801FAE60 001F7DC0  7C 00 F3 78 */	or r0, r0, r30
/* 801FAE64 001F7DC4  98 1F 00 13 */	stb r0, 0x13(r31)
/* 801FAE68 001F7DC8  4B FF FB 99 */	bl UnlockSram
.L_801FAE6C:
/* 801FAE6C 001F7DCC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801FAE70 001F7DD0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801FAE74 001F7DD4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801FAE78 001F7DD8  7C 08 03 A6 */	mtlr r0
/* 801FAE7C 001F7DDC  38 21 00 20 */	addi r1, r1, 0x20
/* 801FAE80 001F7DE0  4E 80 00 20 */	blr 
.endfn OSSetSoundMode

.fn OSGetProgressiveMode, global
/* 801FAE84 001F7DE4  7C 08 02 A6 */	mflr r0
/* 801FAE88 001F7DE8  3C 60 80 3D */	lis r3, Scb@ha
/* 801FAE8C 001F7DEC  90 01 00 04 */	stw r0, 4(r1)
/* 801FAE90 001F7DF0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801FAE94 001F7DF4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801FAE98 001F7DF8  3B E3 24 C0 */	addi r31, r3, Scb@l
/* 801FAE9C 001F7DFC  4B FF E0 E1 */	bl OSDisableInterrupts
/* 801FAEA0 001F7E00  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FAEA4 001F7E04  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FAEA8 001F7E08  2C 00 00 00 */	cmpwi r0, 0
/* 801FAEAC 001F7E0C  41 82 00 10 */	beq .L_801FAEBC
/* 801FAEB0 001F7E10  4B FF E0 F5 */	bl OSRestoreInterrupts
/* 801FAEB4 001F7E14  3B E0 00 00 */	li r31, 0
/* 801FAEB8 001F7E18  48 00 00 10 */	b .L_801FAEC8
.L_801FAEBC:
/* 801FAEBC 001F7E1C  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FAEC0 001F7E20  38 00 00 01 */	li r0, 1
/* 801FAEC4 001F7E24  90 04 00 00 */	stw r0, 0(r4)
.L_801FAEC8:
/* 801FAEC8 001F7E28  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 801FAECC 001F7E2C  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 801FAED0 001F7E30  41 82 00 0C */	beq .L_801FAEDC
/* 801FAED4 001F7E34  3B E0 00 01 */	li r31, 1
/* 801FAED8 001F7E38  48 00 00 08 */	b .L_801FAEE0
.L_801FAEDC:
/* 801FAEDC 001F7E3C  3B E0 00 00 */	li r31, 0
.L_801FAEE0:
/* 801FAEE0 001F7E40  38 60 00 00 */	li r3, 0
/* 801FAEE4 001F7E44  38 80 00 00 */	li r4, 0
/* 801FAEE8 001F7E48  4B FF FB 19 */	bl UnlockSram
/* 801FAEEC 001F7E4C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801FAEF0 001F7E50  7F E3 FB 78 */	mr r3, r31
/* 801FAEF4 001F7E54  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801FAEF8 001F7E58  38 21 00 20 */	addi r1, r1, 0x20
/* 801FAEFC 001F7E5C  7C 08 03 A6 */	mtlr r0
/* 801FAF00 001F7E60  4E 80 00 20 */	blr 
.endfn OSGetProgressiveMode

.fn OSSetProgressiveMode, global
/* 801FAF04 001F7E64  7C 08 02 A6 */	mflr r0
/* 801FAF08 001F7E68  3C 80 80 3D */	lis r4, Scb@ha
/* 801FAF0C 001F7E6C  90 01 00 04 */	stw r0, 4(r1)
/* 801FAF10 001F7E70  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801FAF14 001F7E74  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801FAF18 001F7E78  3B E4 24 C0 */	addi r31, r4, Scb@l
/* 801FAF1C 001F7E7C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801FAF20 001F7E80  54 7E 3E 30 */	rlwinm r30, r3, 7, 0x18, 0x18
/* 801FAF24 001F7E84  4B FF E0 59 */	bl OSDisableInterrupts
/* 801FAF28 001F7E88  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 801FAF2C 001F7E8C  38 9F 00 48 */	addi r4, r31, 0x48
/* 801FAF30 001F7E90  2C 00 00 00 */	cmpwi r0, 0
/* 801FAF34 001F7E94  41 82 00 10 */	beq .L_801FAF44
/* 801FAF38 001F7E98  4B FF E0 6D */	bl OSRestoreInterrupts
/* 801FAF3C 001F7E9C  3B E0 00 00 */	li r31, 0
/* 801FAF40 001F7EA0  48 00 00 10 */	b .L_801FAF50
.L_801FAF44:
/* 801FAF44 001F7EA4  90 7F 00 44 */	stw r3, 0x44(r31)
/* 801FAF48 001F7EA8  38 00 00 01 */	li r0, 1
/* 801FAF4C 001F7EAC  90 04 00 00 */	stw r0, 0(r4)
.L_801FAF50:
/* 801FAF50 001F7EB0  88 7F 00 13 */	lbz r3, 0x13(r31)
/* 801FAF54 001F7EB4  54 60 06 30 */	rlwinm r0, r3, 0, 0x18, 0x18
/* 801FAF58 001F7EB8  7C 1E 00 40 */	cmplw r30, r0
/* 801FAF5C 001F7EBC  40 82 00 14 */	bne .L_801FAF70
/* 801FAF60 001F7EC0  38 60 00 00 */	li r3, 0
/* 801FAF64 001F7EC4  38 80 00 00 */	li r4, 0
/* 801FAF68 001F7EC8  4B FF FA 99 */	bl UnlockSram
/* 801FAF6C 001F7ECC  48 00 00 24 */	b .L_801FAF90
.L_801FAF70:
/* 801FAF70 001F7ED0  54 60 06 6E */	rlwinm r0, r3, 0, 0x19, 0x17
/* 801FAF74 001F7ED4  98 1F 00 13 */	stb r0, 0x13(r31)
/* 801FAF78 001F7ED8  38 60 00 01 */	li r3, 1
/* 801FAF7C 001F7EDC  38 80 00 00 */	li r4, 0
/* 801FAF80 001F7EE0  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 801FAF84 001F7EE4  7C 00 F3 78 */	or r0, r0, r30
/* 801FAF88 001F7EE8  98 1F 00 13 */	stb r0, 0x13(r31)
/* 801FAF8C 001F7EEC  4B FF FA 75 */	bl UnlockSram
.L_801FAF90:
/* 801FAF90 001F7EF0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801FAF94 001F7EF4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801FAF98 001F7EF8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801FAF9C 001F7EFC  7C 08 03 A6 */	mtlr r0
/* 801FAFA0 001F7F00  38 21 00 20 */	addi r1, r1, 0x20
/* 801FAFA4 001F7F04  4E 80 00 20 */	blr 
.endfn OSSetProgressiveMode

.section .bss, "wa"  # 0x802E9640 - 0x803E81E5
.balign 32
.obj Scb, local
	.skip 0x54
.endobj Scb
