.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.balign 32, 0
.fn InitDSPchannel__Fv, global
/* 8000AD00 00007C60  38 60 00 00 */	li r3, 0
/* 8000AD04 00007C64  3D 40 80 30 */	lis r10, DSPCH@ha
/* 8000AD08 00007C68  38 00 00 40 */	li r0, 0x40
/* 8000AD0C 00007C6C  39 23 00 00 */	addi r9, r3, 0
/* 8000AD10 00007C70  39 03 00 00 */	addi r8, r3, 0
/* 8000AD14 00007C74  38 E3 00 00 */	addi r7, r3, 0
/* 8000AD18 00007C78  38 C3 00 00 */	addi r6, r3, 0
/* 8000AD1C 00007C7C  38 A3 00 00 */	addi r5, r3, 0
/* 8000AD20 00007C80  38 83 00 00 */	addi r4, r3, 0
/* 8000AD24 00007C84  39 4A 66 60 */	addi r10, r10, DSPCH@l
/* 8000AD28 00007C88  39 80 00 00 */	li r12, 0
/* 8000AD2C 00007C8C  7C 09 03 A6 */	mtctr r0
.L_8000AD30:
/* 8000AD30 00007C90  7D 6A 1A 14 */	add r11, r10, r3
/* 8000AD34 00007C94  38 63 00 10 */	addi r3, r3, 0x10
/* 8000AD38 00007C98  99 8B 00 00 */	stb r12, 0(r11)
/* 8000AD3C 00007C9C  39 8C 00 01 */	addi r12, r12, 1
/* 8000AD40 00007CA0  99 2B 00 01 */	stb r9, 1(r11)
/* 8000AD44 00007CA4  91 0B 00 08 */	stw r8, 8(r11)
/* 8000AD48 00007CA8  B0 EB 00 06 */	sth r7, 6(r11)
/* 8000AD4C 00007CAC  90 CB 00 0C */	stw r6, 0xc(r11)
/* 8000AD50 00007CB0  98 AB 00 03 */	stb r5, 3(r11)
/* 8000AD54 00007CB4  B0 8B 00 04 */	sth r4, 4(r11)
/* 8000AD58 00007CB8  42 00 FF D8 */	bdnz .L_8000AD30
/* 8000AD5C 00007CBC  4E 80 00 20 */	blr 
.endfn InitDSPchannel__Fv

.balign 32, 0
.fn AllocDSPchannel__FUlUl, global
/* 8000AD60 00007CC0  7C 08 02 A6 */	mflr r0
/* 8000AD64 00007CC4  28 03 00 00 */	cmplwi r3, 0
/* 8000AD68 00007CC8  90 01 00 04 */	stw r0, 4(r1)
/* 8000AD6C 00007CCC  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000AD70 00007CD0  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8000AD74 00007CD4  BF C1 00 20 */	stmw r30, 0x20(r1)
/* 8000AD78 00007CD8  3B E3 66 60 */	addi r31, r3, DSPCH@l
/* 8000AD7C 00007CDC  90 81 00 0C */	stw r4, 0xc(r1)
/* 8000AD80 00007CE0  40 82 00 68 */	bne .L_8000ADE8
/* 8000AD84 00007CE4  38 00 00 00 */	li r0, 0
/* 8000AD88 00007CE8  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8000AD8C 00007CEC  48 00 00 48 */	b .L_8000ADD4
.L_8000AD90:
/* 8000AD90 00007CF0  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 8000AD94 00007CF4  54 60 20 36 */	slwi r0, r3, 4
/* 8000AD98 00007CF8  7F DF 02 14 */	add r30, r31, r0
/* 8000AD9C 00007CFC  88 1E 00 01 */	lbz r0, 1(r30)
/* 8000ADA0 00007D00  28 00 00 00 */	cmplwi r0, 0
/* 8000ADA4 00007D04  40 82 00 28 */	bne .L_8000ADCC
/* 8000ADA8 00007D08  38 80 00 01 */	li r4, 1
/* 8000ADAC 00007D0C  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 8000ADB0 00007D10  98 9E 00 01 */	stb r4, 1(r30)
/* 8000ADB4 00007D14  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8000ADB8 00007D18  90 1E 00 08 */	stw r0, 8(r30)
/* 8000ADBC 00007D1C  98 9E 00 03 */	stb r4, 3(r30)
/* 8000ADC0 00007D20  48 00 0A 81 */	bl DSP_AllocInit__FUc
/* 8000ADC4 00007D24  7F C3 F3 78 */	mr r3, r30
/* 8000ADC8 00007D28  48 00 00 98 */	b .L_8000AE60
.L_8000ADCC:
/* 8000ADCC 00007D2C  38 03 00 01 */	addi r0, r3, 1
/* 8000ADD0 00007D30  90 01 00 1C */	stw r0, 0x1c(r1)
.L_8000ADD4:
/* 8000ADD4 00007D34  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8000ADD8 00007D38  2C 00 00 40 */	cmpwi r0, 0x40
/* 8000ADDC 00007D3C  41 80 FF B4 */	blt .L_8000AD90
/* 8000ADE0 00007D40  38 60 00 00 */	li r3, 0
/* 8000ADE4 00007D44  48 00 00 7C */	b .L_8000AE60
.L_8000ADE8:
/* 8000ADE8 00007D48  38 00 00 20 */	li r0, 0x20
/* 8000ADEC 00007D4C  3B C0 00 01 */	li r30, 1
/* 8000ADF0 00007D50  38 60 00 10 */	li r3, 0x10
/* 8000ADF4 00007D54  7C 09 03 A6 */	mtctr r0
.L_8000ADF8:
/* 8000ADF8 00007D58  7C 9F 1A 14 */	add r4, r31, r3
/* 8000ADFC 00007D5C  88 04 00 01 */	lbz r0, 1(r4)
/* 8000AE00 00007D60  28 00 00 00 */	cmplwi r0, 0
/* 8000AE04 00007D64  40 82 00 4C */	bne .L_8000AE50
/* 8000AE08 00007D68  88 04 FF F1 */	lbz r0, -0xf(r4)
/* 8000AE0C 00007D6C  28 00 00 00 */	cmplwi r0, 0
/* 8000AE10 00007D70  40 82 00 40 */	bne .L_8000AE50
/* 8000AE14 00007D74  38 60 00 03 */	li r3, 3
/* 8000AE18 00007D78  38 00 00 02 */	li r0, 2
/* 8000AE1C 00007D7C  98 64 00 01 */	stb r3, 1(r4)
/* 8000AE20 00007D80  57 C3 06 3E */	clrlwi r3, r30, 0x18
/* 8000AE24 00007D84  98 04 FF F1 */	stb r0, -0xf(r4)
/* 8000AE28 00007D88  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8000AE2C 00007D8C  90 04 00 08 */	stw r0, 8(r4)
/* 8000AE30 00007D90  90 04 FF F8 */	stw r0, -8(r4)
/* 8000AE34 00007D94  48 00 0A 0D */	bl DSP_AllocInit__FUc
/* 8000AE38 00007D98  3B DE FF FF */	addi r30, r30, -1
/* 8000AE3C 00007D9C  57 C3 06 3E */	clrlwi r3, r30, 0x18
/* 8000AE40 00007DA0  48 00 0A 01 */	bl DSP_AllocInit__FUc
/* 8000AE44 00007DA4  57 C0 20 36 */	slwi r0, r30, 4
/* 8000AE48 00007DA8  7C 7F 02 14 */	add r3, r31, r0
/* 8000AE4C 00007DAC  48 00 00 14 */	b .L_8000AE60
.L_8000AE50:
/* 8000AE50 00007DB0  3B DE 00 02 */	addi r30, r30, 2
/* 8000AE54 00007DB4  38 63 00 20 */	addi r3, r3, 0x20
/* 8000AE58 00007DB8  42 00 FF A0 */	bdnz .L_8000ADF8
/* 8000AE5C 00007DBC  38 60 00 00 */	li r3, 0
.L_8000AE60:
/* 8000AE60 00007DC0  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8000AE64 00007DC4  BB C1 00 20 */	lmw r30, 0x20(r1)
/* 8000AE68 00007DC8  38 21 00 28 */	addi r1, r1, 0x28
/* 8000AE6C 00007DCC  7C 08 03 A6 */	mtlr r0
/* 8000AE70 00007DD0  4E 80 00 20 */	blr 
.endfn AllocDSPchannel__FUlUl

.balign 32, 0
.fn DeAllocDSPchannel__FP6dspch_Ul, global
/* 8000AE80 00007DE0  7C 08 02 A6 */	mflr r0
/* 8000AE84 00007DE4  90 01 00 04 */	stw r0, 4(r1)
/* 8000AE88 00007DE8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8000AE8C 00007DEC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8000AE90 00007DF0  7C 7F 1B 79 */	or. r31, r3, r3
/* 8000AE94 00007DF4  40 82 00 0C */	bne .L_8000AEA0
/* 8000AE98 00007DF8  38 60 FF FF */	li r3, -1
/* 8000AE9C 00007DFC  48 00 00 AC */	b .L_8000AF48
.L_8000AEA0:
/* 8000AEA0 00007E00  80 1F 00 08 */	lwz r0, 8(r31)
/* 8000AEA4 00007E04  7C 00 20 40 */	cmplw r0, r4
/* 8000AEA8 00007E08  41 82 00 0C */	beq .L_8000AEB4
/* 8000AEAC 00007E0C  38 60 FF FE */	li r3, -2
/* 8000AEB0 00007E10  48 00 00 98 */	b .L_8000AF48
.L_8000AEB4:
/* 8000AEB4 00007E14  88 1F 00 01 */	lbz r0, 1(r31)
/* 8000AEB8 00007E18  2C 00 00 03 */	cmpwi r0, 3
/* 8000AEBC 00007E1C  41 82 00 54 */	beq .L_8000AF10
/* 8000AEC0 00007E20  40 80 00 14 */	bge .L_8000AED4
/* 8000AEC4 00007E24  2C 00 00 01 */	cmpwi r0, 1
/* 8000AEC8 00007E28  41 82 00 14 */	beq .L_8000AEDC
/* 8000AECC 00007E2C  40 80 00 1C */	bge .L_8000AEE8
/* 8000AED0 00007E30  48 00 00 64 */	b .L_8000AF34
.L_8000AED4:
/* 8000AED4 00007E34  2C 00 00 05 */	cmpwi r0, 5
/* 8000AED8 00007E38  40 80 00 5C */	bge .L_8000AF34
.L_8000AEDC:
/* 8000AEDC 00007E3C  38 00 00 00 */	li r0, 0
/* 8000AEE0 00007E40  98 1F 00 01 */	stb r0, 1(r31)
/* 8000AEE4 00007E44  48 00 00 50 */	b .L_8000AF34
.L_8000AEE8:
/* 8000AEE8 00007E48  38 00 00 00 */	li r0, 0
/* 8000AEEC 00007E4C  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000AEF0 00007E50  98 1F 00 01 */	stb r0, 1(r31)
/* 8000AEF4 00007E54  38 03 66 60 */	addi r0, r3, DSPCH@l
/* 8000AEF8 00007E58  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000AEFC 00007E5C  38 63 00 01 */	addi r3, r3, 1
/* 8000AF00 00007E60  54 63 20 36 */	slwi r3, r3, 4
/* 8000AF04 00007E64  7C 60 1A 14 */	add r3, r0, r3
/* 8000AF08 00007E68  4B FF FF 79 */	bl DeAllocDSPchannel__FP6dspch_Ul
/* 8000AF0C 00007E6C  48 00 00 28 */	b .L_8000AF34
.L_8000AF10:
/* 8000AF10 00007E70  38 00 00 00 */	li r0, 0
/* 8000AF14 00007E74  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000AF18 00007E78  98 1F 00 01 */	stb r0, 1(r31)
/* 8000AF1C 00007E7C  38 03 66 60 */	addi r0, r3, DSPCH@l
/* 8000AF20 00007E80  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000AF24 00007E84  38 63 FF FF */	addi r3, r3, -1
/* 8000AF28 00007E88  54 63 20 36 */	slwi r3, r3, 4
/* 8000AF2C 00007E8C  7C 60 1A 14 */	add r3, r0, r3
/* 8000AF30 00007E90  4B FF FF 51 */	bl DeAllocDSPchannel__FP6dspch_Ul
.L_8000AF34:
/* 8000AF34 00007E94  38 00 00 00 */	li r0, 0
/* 8000AF38 00007E98  38 60 00 00 */	li r3, 0
/* 8000AF3C 00007E9C  98 1F 00 03 */	stb r0, 3(r31)
/* 8000AF40 00007EA0  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8000AF44 00007EA4  90 1F 00 08 */	stw r0, 8(r31)
.L_8000AF48:
/* 8000AF48 00007EA8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8000AF4C 00007EAC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8000AF50 00007EB0  38 21 00 20 */	addi r1, r1, 0x20
/* 8000AF54 00007EB4  7C 08 03 A6 */	mtlr r0
/* 8000AF58 00007EB8  4E 80 00 20 */	blr 
.endfn DeAllocDSPchannel__FP6dspch_Ul

.balign 32, 0
.fn GetLowerDSPchannel__Fv, global
/* 8000AF60 00007EC0  7C 08 02 A6 */	mflr r0
/* 8000AF64 00007EC4  38 60 00 FF */	li r3, 0xff
/* 8000AF68 00007EC8  90 01 00 04 */	stw r0, 4(r1)
/* 8000AF6C 00007ECC  38 00 00 00 */	li r0, 0
/* 8000AF70 00007ED0  3C 80 80 30 */	lis r4, DSPCH@ha
/* 8000AF74 00007ED4  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 8000AF78 00007ED8  BF 61 00 34 */	stmw r27, 0x34(r1)
/* 8000AF7C 00007EDC  3B E4 66 60 */	addi r31, r4, DSPCH@l
/* 8000AF80 00007EE0  98 61 00 2C */	stb r3, 0x2c(r1)
/* 8000AF84 00007EE4  90 01 00 28 */	stw r0, 0x28(r1)
/* 8000AF88 00007EE8  90 01 00 24 */	stw r0, 0x24(r1)
/* 8000AF8C 00007EEC  90 01 00 20 */	stw r0, 0x20(r1)
/* 8000AF90 00007EF0  48 00 00 A8 */	b .L_8000B038
.L_8000AF94:
/* 8000AF94 00007EF4  57 C0 20 36 */	slwi r0, r30, 4
/* 8000AF98 00007EF8  7F BF 02 14 */	add r29, r31, r0
/* 8000AF9C 00007EFC  88 1D 00 01 */	lbz r0, 1(r29)
/* 8000AFA0 00007F00  28 00 00 04 */	cmplwi r0, 4
/* 8000AFA4 00007F04  41 82 00 88 */	beq .L_8000B02C
/* 8000AFA8 00007F08  28 00 00 00 */	cmplwi r0, 0
/* 8000AFAC 00007F0C  40 82 00 14 */	bne .L_8000AFC0
/* 8000AFB0 00007F10  38 00 00 00 */	li r0, 0
/* 8000AFB4 00007F14  98 1D 00 03 */	stb r0, 3(r29)
/* 8000AFB8 00007F18  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8000AFBC 00007F1C  48 00 00 88 */	b .L_8000B044
.L_8000AFC0:
/* 8000AFC0 00007F20  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8000AFC4 00007F24  28 00 00 00 */	cmplwi r0, 0
/* 8000AFC8 00007F28  41 82 00 64 */	beq .L_8000B02C
/* 8000AFCC 00007F2C  88 7D 00 00 */	lbz r3, 0(r29)
/* 8000AFD0 00007F30  48 00 05 91 */	bl GetDspHandle__FUc
/* 8000AFD4 00007F34  3B 9D 00 03 */	addi r28, r29, 3
/* 8000AFD8 00007F38  8B 61 00 2C */	lbz r27, 0x2c(r1)
/* 8000AFDC 00007F3C  88 1D 00 03 */	lbz r0, 3(r29)
/* 8000AFE0 00007F40  7C 00 D8 40 */	cmplw r0, r27
/* 8000AFE4 00007F44  41 81 00 48 */	bgt .L_8000B02C
/* 8000AFE8 00007F48  88 7D 00 00 */	lbz r3, 0(r29)
/* 8000AFEC 00007F4C  48 00 05 75 */	bl GetDspHandle__FUc
/* 8000AFF0 00007F50  88 BC 00 00 */	lbz r5, 0(r28)
/* 8000AFF4 00007F54  7C 1B 28 40 */	cmplw r27, r5
/* 8000AFF8 00007F58  40 82 00 24 */	bne .L_8000B01C
/* 8000AFFC 00007F5C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8000B000 00007F60  28 00 00 00 */	cmplwi r0, 0
/* 8000B004 00007F64  41 82 00 28 */	beq .L_8000B02C
/* 8000B008 00007F68  80 83 01 0C */	lwz r4, 0x10c(r3)
/* 8000B00C 00007F6C  7C 04 00 40 */	cmplw r4, r0
/* 8000B010 00007F70  40 80 00 0C */	bge .L_8000B01C
/* 8000B014 00007F74  28 04 00 00 */	cmplwi r4, 0
/* 8000B018 00007F78  40 82 00 14 */	bne .L_8000B02C
.L_8000B01C:
/* 8000B01C 00007F7C  80 03 01 0C */	lwz r0, 0x10c(r3)
/* 8000B020 00007F80  90 01 00 24 */	stw r0, 0x24(r1)
/* 8000B024 00007F84  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8000B028 00007F88  98 A1 00 2C */	stb r5, 0x2c(r1)
.L_8000B02C:
/* 8000B02C 00007F8C  80 61 00 20 */	lwz r3, 0x20(r1)
/* 8000B030 00007F90  38 03 00 01 */	addi r0, r3, 1
/* 8000B034 00007F94  90 01 00 20 */	stw r0, 0x20(r1)
.L_8000B038:
/* 8000B038 00007F98  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 8000B03C 00007F9C  28 1E 00 40 */	cmplwi r30, 0x40
/* 8000B040 00007FA0  41 80 FF 54 */	blt .L_8000AF94
.L_8000B044:
/* 8000B044 00007FA4  80 01 00 28 */	lwz r0, 0x28(r1)
/* 8000B048 00007FA8  54 00 20 36 */	slwi r0, r0, 4
/* 8000B04C 00007FAC  7C 7F 02 14 */	add r3, r31, r0
/* 8000B050 00007FB0  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 8000B054 00007FB4  BB 61 00 34 */	lmw r27, 0x34(r1)
/* 8000B058 00007FB8  38 21 00 48 */	addi r1, r1, 0x48
/* 8000B05C 00007FBC  7C 08 03 A6 */	mtlr r0
/* 8000B060 00007FC0  4E 80 00 20 */	blr 
.endfn GetLowerDSPchannel__Fv

.balign 32, 0
.fn GetLowerActiveDSPchannel__Fv, global
/* 8000B080 00007FE0  7C 08 02 A6 */	mflr r0
/* 8000B084 00007FE4  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000B088 00007FE8  90 01 00 04 */	stw r0, 4(r1)
/* 8000B08C 00007FEC  38 00 00 FF */	li r0, 0xff
/* 8000B090 00007FF0  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 8000B094 00007FF4  BF 61 00 24 */	stmw r27, 0x24(r1)
/* 8000B098 00007FF8  3B C0 00 00 */	li r30, 0
/* 8000B09C 00007FFC  3B E3 66 60 */	addi r31, r3, DSPCH@l
/* 8000B0A0 00008000  3B 60 00 00 */	li r27, 0
/* 8000B0A4 00008004  98 01 00 1C */	stb r0, 0x1c(r1)
/* 8000B0A8 00008008  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8000B0AC 0000800C  93 C1 00 14 */	stw r30, 0x14(r1)
.L_8000B0B0:
/* 8000B0B0 00008010  7C 7F F2 14 */	add r3, r31, r30
/* 8000B0B4 00008014  88 03 00 01 */	lbz r0, 1(r3)
/* 8000B0B8 00008018  28 00 00 04 */	cmplwi r0, 4
/* 8000B0BC 0000801C  41 82 00 64 */	beq .L_8000B120
/* 8000B0C0 00008020  28 00 00 00 */	cmplwi r0, 0
/* 8000B0C4 00008024  41 82 00 5C */	beq .L_8000B120
/* 8000B0C8 00008028  3B A3 00 03 */	addi r29, r3, 3
/* 8000B0CC 0000802C  8B 81 00 1C */	lbz r28, 0x1c(r1)
/* 8000B0D0 00008030  88 03 00 03 */	lbz r0, 3(r3)
/* 8000B0D4 00008034  7C 00 E0 40 */	cmplw r0, r28
/* 8000B0D8 00008038  41 81 00 48 */	bgt .L_8000B120
/* 8000B0DC 0000803C  88 63 00 00 */	lbz r3, 0(r3)
/* 8000B0E0 00008040  48 00 04 81 */	bl GetDspHandle__FUc
/* 8000B0E4 00008044  88 BD 00 00 */	lbz r5, 0(r29)
/* 8000B0E8 00008048  7C 1C 28 40 */	cmplw r28, r5
/* 8000B0EC 0000804C  40 82 00 24 */	bne .L_8000B110
/* 8000B0F0 00008050  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8000B0F4 00008054  28 00 00 00 */	cmplwi r0, 0
/* 8000B0F8 00008058  41 82 00 28 */	beq .L_8000B120
/* 8000B0FC 0000805C  80 83 01 0C */	lwz r4, 0x10c(r3)
/* 8000B100 00008060  7C 04 00 40 */	cmplw r4, r0
/* 8000B104 00008064  40 80 00 0C */	bge .L_8000B110
/* 8000B108 00008068  28 04 00 00 */	cmplwi r4, 0
/* 8000B10C 0000806C  40 82 00 14 */	bne .L_8000B120
.L_8000B110:
/* 8000B110 00008070  80 03 01 0C */	lwz r0, 0x10c(r3)
/* 8000B114 00008074  90 01 00 14 */	stw r0, 0x14(r1)
/* 8000B118 00008078  93 61 00 18 */	stw r27, 0x18(r1)
/* 8000B11C 0000807C  98 A1 00 1C */	stb r5, 0x1c(r1)
.L_8000B120:
/* 8000B120 00008080  3B 7B 00 01 */	addi r27, r27, 1
/* 8000B124 00008084  3B DE 00 10 */	addi r30, r30, 0x10
/* 8000B128 00008088  28 1B 00 40 */	cmplwi r27, 0x40
/* 8000B12C 0000808C  41 80 FF 84 */	blt .L_8000B0B0
/* 8000B130 00008090  BB 61 00 24 */	lmw r27, 0x24(r1)
/* 8000B134 00008094  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000B138 00008098  80 81 00 18 */	lwz r4, 0x18(r1)
/* 8000B13C 0000809C  38 03 66 60 */	addi r0, r3, DSPCH@l
/* 8000B140 000080A0  54 83 20 36 */	slwi r3, r4, 4
/* 8000B144 000080A4  7C 60 1A 14 */	add r3, r0, r3
/* 8000B148 000080A8  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 8000B14C 000080AC  38 21 00 38 */	addi r1, r1, 0x38
/* 8000B150 000080B0  7C 08 03 A6 */	mtlr r0
/* 8000B154 000080B4  4E 80 00 20 */	blr 
.endfn GetLowerActiveDSPchannel__Fv

.balign 32, 0
.fn ForceStopDSPchannel__FP6dspch_, global
/* 8000B160 000080C0  7C 08 02 A6 */	mflr r0
/* 8000B164 000080C4  90 01 00 04 */	stw r0, 4(r1)
/* 8000B168 000080C8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8000B16C 000080CC  BF C1 00 10 */	stmw r30, 0x10(r1)
/* 8000B170 000080D0  90 61 00 08 */	stw r3, 8(r1)
/* 8000B174 000080D4  83 E1 00 08 */	lwz r31, 8(r1)
/* 8000B178 000080D8  88 1F 00 01 */	lbz r0, 1(r31)
/* 8000B17C 000080DC  3B DF 00 01 */	addi r30, r31, 1
/* 8000B180 000080E0  28 00 00 04 */	cmplwi r0, 4
/* 8000B184 000080E4  40 82 00 0C */	bne .L_8000B190
/* 8000B188 000080E8  38 60 00 00 */	li r3, 0
/* 8000B18C 000080EC  48 00 00 3C */	b .L_8000B1C8
.L_8000B190:
/* 8000B190 000080F0  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000B194 000080F4  48 00 03 CD */	bl GetDspHandle__FUc
/* 8000B198 000080F8  A0 03 00 00 */	lhz r0, 0(r3)
/* 8000B19C 000080FC  28 00 00 00 */	cmplwi r0, 0
/* 8000B1A0 00008100  40 82 00 0C */	bne .L_8000B1AC
/* 8000B1A4 00008104  38 60 00 00 */	li r3, 0
/* 8000B1A8 00008108  48 00 00 20 */	b .L_8000B1C8
.L_8000B1AC:
/* 8000B1AC 0000810C  38 80 00 01 */	li r4, 1
/* 8000B1B0 00008110  38 00 00 04 */	li r0, 4
/* 8000B1B4 00008114  B0 83 01 0A */	sth r4, 0x10a(r3)
/* 8000B1B8 00008118  98 1E 00 00 */	stb r0, 0(r30)
/* 8000B1BC 0000811C  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000B1C0 00008120  48 00 09 61 */	bl DSP_FlushChannel__FUc
/* 8000B1C4 00008124  38 60 00 01 */	li r3, 1
.L_8000B1C8:
/* 8000B1C8 00008128  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8000B1CC 0000812C  BB C1 00 10 */	lmw r30, 0x10(r1)
/* 8000B1D0 00008130  38 21 00 18 */	addi r1, r1, 0x18
/* 8000B1D4 00008134  7C 08 03 A6 */	mtlr r0
/* 8000B1D8 00008138  4E 80 00 20 */	blr 
.endfn ForceStopDSPchannel__FP6dspch_

.balign 32, 0
.fn BreakLowerDSPchannel__FUc, global
/* 8000B1E0 00008140  7C 08 02 A6 */	mflr r0
/* 8000B1E4 00008144  90 01 00 04 */	stw r0, 4(r1)
/* 8000B1E8 00008148  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8000B1EC 0000814C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8000B1F0 00008150  98 61 00 08 */	stb r3, 8(r1)
/* 8000B1F4 00008154  4B FF FD 6D */	bl GetLowerDSPchannel__Fv
/* 8000B1F8 00008158  7C 7F 1B 78 */	mr r31, r3
/* 8000B1FC 0000815C  88 01 00 08 */	lbz r0, 8(r1)
/* 8000B200 00008160  88 63 00 03 */	lbz r3, 3(r3)
/* 8000B204 00008164  7C 03 00 40 */	cmplw r3, r0
/* 8000B208 00008168  40 81 00 0C */	ble .L_8000B214
/* 8000B20C 0000816C  38 60 00 00 */	li r3, 0
/* 8000B210 00008170  48 00 00 68 */	b .L_8000B278
.L_8000B214:
/* 8000B214 00008174  40 82 00 0C */	bne .L_8000B220
/* 8000B218 00008178  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000B21C 0000817C  48 00 03 45 */	bl GetDspHandle__FUc
.L_8000B220:
/* 8000B220 00008180  88 1F 00 01 */	lbz r0, 1(r31)
/* 8000B224 00008184  28 00 00 00 */	cmplwi r0, 0
/* 8000B228 00008188  41 82 00 44 */	beq .L_8000B26C
/* 8000B22C 0000818C  81 9F 00 0C */	lwz r12, 0xc(r31)
/* 8000B230 00008190  28 0C 00 00 */	cmplwi r12, 0
/* 8000B234 00008194  41 82 00 2C */	beq .L_8000B260
/* 8000B238 00008198  38 7F 00 00 */	addi r3, r31, 0
/* 8000B23C 0000819C  38 80 00 03 */	li r4, 3
/* 8000B240 000081A0  7D 88 03 A6 */	mtlr r12
/* 8000B244 000081A4  4E 80 00 21 */	blrl 
/* 8000B248 000081A8  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8000B24C 000081AC  38 7F 00 00 */	addi r3, r31, 0
/* 8000B250 000081B0  B0 1F 00 06 */	sth r0, 6(r31)
/* 8000B254 000081B4  4B FF FF 0D */	bl ForceStopDSPchannel__FP6dspch_
/* 8000B258 000081B8  38 00 00 04 */	li r0, 4
/* 8000B25C 000081BC  98 1F 00 01 */	stb r0, 1(r31)
.L_8000B260:
/* 8000B260 000081C0  7F E3 FB 78 */	mr r3, r31
/* 8000B264 000081C4  4B FF FE FD */	bl ForceStopDSPchannel__FP6dspch_
/* 8000B268 000081C8  48 00 00 0C */	b .L_8000B274
.L_8000B26C:
/* 8000B26C 000081CC  38 60 00 00 */	li r3, 0
/* 8000B270 000081D0  48 00 00 08 */	b .L_8000B278
.L_8000B274:
/* 8000B274 000081D4  38 60 00 01 */	li r3, 1
.L_8000B278:
/* 8000B278 000081D8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8000B27C 000081DC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8000B280 000081E0  38 21 00 20 */	addi r1, r1, 0x20
/* 8000B284 000081E4  7C 08 03 A6 */	mtlr r0
/* 8000B288 000081E8  4E 80 00 20 */	blr 
.endfn BreakLowerDSPchannel__FUc

.balign 32, 0
.fn BreakLowerActiveDSPchannel__FUc, global
/* 8000B2A0 00008200  7C 08 02 A6 */	mflr r0
/* 8000B2A4 00008204  90 01 00 04 */	stw r0, 4(r1)
/* 8000B2A8 00008208  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8000B2AC 0000820C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8000B2B0 00008210  98 61 00 08 */	stb r3, 8(r1)
/* 8000B2B4 00008214  4B FF FD CD */	bl GetLowerActiveDSPchannel__Fv
/* 8000B2B8 00008218  7C 7F 1B 78 */	mr r31, r3
/* 8000B2BC 0000821C  88 01 00 08 */	lbz r0, 8(r1)
/* 8000B2C0 00008220  88 63 00 03 */	lbz r3, 3(r3)
/* 8000B2C4 00008224  7C 03 00 40 */	cmplw r3, r0
/* 8000B2C8 00008228  40 81 00 0C */	ble .L_8000B2D4
/* 8000B2CC 0000822C  38 60 00 00 */	li r3, 0
/* 8000B2D0 00008230  48 00 00 68 */	b .L_8000B338
.L_8000B2D4:
/* 8000B2D4 00008234  40 82 00 0C */	bne .L_8000B2E0
/* 8000B2D8 00008238  88 7F 00 00 */	lbz r3, 0(r31)
/* 8000B2DC 0000823C  48 00 02 85 */	bl GetDspHandle__FUc
.L_8000B2E0:
/* 8000B2E0 00008240  88 1F 00 01 */	lbz r0, 1(r31)
/* 8000B2E4 00008244  28 00 00 00 */	cmplwi r0, 0
/* 8000B2E8 00008248  41 82 00 44 */	beq .L_8000B32C
/* 8000B2EC 0000824C  81 9F 00 0C */	lwz r12, 0xc(r31)
/* 8000B2F0 00008250  28 0C 00 00 */	cmplwi r12, 0
/* 8000B2F4 00008254  41 82 00 2C */	beq .L_8000B320
/* 8000B2F8 00008258  38 7F 00 00 */	addi r3, r31, 0
/* 8000B2FC 0000825C  38 80 00 03 */	li r4, 3
/* 8000B300 00008260  7D 88 03 A6 */	mtlr r12
/* 8000B304 00008264  4E 80 00 21 */	blrl 
/* 8000B308 00008268  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8000B30C 0000826C  38 7F 00 00 */	addi r3, r31, 0
/* 8000B310 00008270  B0 1F 00 06 */	sth r0, 6(r31)
/* 8000B314 00008274  4B FF FE 4D */	bl ForceStopDSPchannel__FP6dspch_
/* 8000B318 00008278  38 00 00 04 */	li r0, 4
/* 8000B31C 0000827C  98 1F 00 01 */	stb r0, 1(r31)
.L_8000B320:
/* 8000B320 00008280  7F E3 FB 78 */	mr r3, r31
/* 8000B324 00008284  4B FF FE 3D */	bl ForceStopDSPchannel__FP6dspch_
/* 8000B328 00008288  48 00 00 0C */	b .L_8000B334
.L_8000B32C:
/* 8000B32C 0000828C  38 60 00 00 */	li r3, 0
/* 8000B330 00008290  48 00 00 08 */	b .L_8000B338
.L_8000B334:
/* 8000B334 00008294  38 60 00 01 */	li r3, 1
.L_8000B338:
/* 8000B338 00008298  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8000B33C 0000829C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8000B340 000082A0  38 21 00 20 */	addi r1, r1, 0x20
/* 8000B344 000082A4  7C 08 03 A6 */	mtlr r0
/* 8000B348 000082A8  4E 80 00 20 */	blr 
.endfn BreakLowerActiveDSPchannel__FUc

.balign 32, 0
.fn UpdateDSPchannelAll__Fv, global
/* 8000B360 000082C0  7C 08 02 A6 */	mflr r0
/* 8000B364 000082C4  90 01 00 04 */	stw r0, 4(r1)
/* 8000B368 000082C8  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8000B36C 000082CC  BF 41 00 48 */	stmw r26, 0x48(r1)
/* 8000B370 000082D0  48 1F 20 49 */	bl OSGetTick
/* 8000B374 000082D4  80 0D 2B E0 */	lwz r0, old_time@sda21(r13)
/* 8000B378 000082D8  90 6D 2B E0 */	stw r3, old_time@sda21(r13)
/* 8000B37C 000082DC  7F 40 18 50 */	subf r26, r0, r3
/* 8000B380 000082E0  4B FF AF 61 */	bl DspSyncCountCheck
/* 8000B384 000082E4  80 0D 80 04 */	lwz r0, JAC_SUBFRAMES@sda21(r13)
/* 8000B388 000082E8  3C 80 80 22 */	lis r4, history@ha
/* 8000B38C 000082EC  38 84 49 78 */	addi r4, r4, history@l
/* 8000B390 000082F0  7C 63 00 51 */	subf. r3, r3, r0
/* 8000B394 000082F4  54 60 10 3A */	slwi r0, r3, 2
/* 8000B398 000082F8  7C 64 02 14 */	add r3, r4, r0
/* 8000B39C 000082FC  93 43 00 00 */	stw r26, 0(r3)
/* 8000B3A0 00008300  41 82 00 48 */	beq .L_8000B3E8
/* 8000B3A4 00008304  80 64 00 00 */	lwz r3, 0(r4)
/* 8000B3A8 00008308  3C 00 43 30 */	lis r0, 0x4330
/* 8000B3AC 0000830C  93 41 00 3C */	stw r26, 0x3c(r1)
/* 8000B3B0 00008310  C8 62 80 60 */	lfd f3, lbl_803E8260@sda21(r2)
/* 8000B3B4 00008314  90 61 00 44 */	stw r3, 0x44(r1)
/* 8000B3B8 00008318  C0 02 80 58 */	lfs f0, lbl_803E8258@sda21(r2)
/* 8000B3BC 0000831C  90 01 00 40 */	stw r0, 0x40(r1)
/* 8000B3C0 00008320  90 01 00 38 */	stw r0, 0x38(r1)
/* 8000B3C4 00008324  C8 41 00 40 */	lfd f2, 0x40(r1)
/* 8000B3C8 00008328  C8 21 00 38 */	lfd f1, 0x38(r1)
/* 8000B3CC 0000832C  EC 42 18 28 */	fsubs f2, f2, f3
/* 8000B3D0 00008330  EC 21 18 28 */	fsubs f1, f1, f3
/* 8000B3D4 00008334  EC 22 08 24 */	fdivs f1, f2, f1
/* 8000B3D8 00008338  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8000B3DC 0000833C  40 80 00 0C */	bge .L_8000B3E8
/* 8000B3E0 00008340  38 60 00 7E */	li r3, 0x7e
/* 8000B3E4 00008344  4B FF FE BD */	bl BreakLowerActiveDSPchannel__FUc
.L_8000B3E8:
/* 8000B3E8 00008348  3C 60 80 30 */	lis r3, DSPCH@ha
/* 8000B3EC 0000834C  3B 80 00 00 */	li r28, 0
/* 8000B3F0 00008350  3B C3 66 60 */	addi r30, r3, DSPCH@l
/* 8000B3F4 00008354  3B 60 00 00 */	li r27, 0
.L_8000B3F8:
/* 8000B3F8 00008358  7C 1E DA 14 */	add r0, r30, r27
/* 8000B3FC 0000835C  90 01 00 30 */	stw r0, 0x30(r1)
/* 8000B400 00008360  83 A1 00 30 */	lwz r29, 0x30(r1)
/* 8000B404 00008364  3B 5D 00 01 */	addi r26, r29, 1
/* 8000B408 00008368  88 1D 00 01 */	lbz r0, 1(r29)
/* 8000B40C 0000836C  28 00 00 00 */	cmplwi r0, 0
/* 8000B410 00008370  41 82 01 18 */	beq .L_8000B528
/* 8000B414 00008374  88 7D 00 00 */	lbz r3, 0(r29)
/* 8000B418 00008378  48 00 01 49 */	bl GetDspHandle__FUc
/* 8000B41C 0000837C  7C 7F 1B 78 */	mr r31, r3
/* 8000B420 00008380  A0 03 00 02 */	lhz r0, 2(r3)
/* 8000B424 00008384  28 00 00 00 */	cmplwi r0, 0
/* 8000B428 00008388  41 82 00 44 */	beq .L_8000B46C
/* 8000B42C 0000838C  81 9D 00 0C */	lwz r12, 0xc(r29)
/* 8000B430 00008390  28 0C 00 00 */	cmplwi r12, 0
/* 8000B434 00008394  41 82 00 18 */	beq .L_8000B44C
/* 8000B438 00008398  38 7D 00 00 */	addi r3, r29, 0
/* 8000B43C 0000839C  38 80 00 02 */	li r4, 2
/* 8000B440 000083A0  7D 88 03 A6 */	mtlr r12
/* 8000B444 000083A4  4E 80 00 21 */	blrl 
/* 8000B448 000083A8  B0 7D 00 06 */	sth r3, 6(r29)
.L_8000B44C:
/* 8000B44C 000083AC  38 00 00 00 */	li r0, 0
/* 8000B450 000083B0  B0 1F 00 02 */	sth r0, 2(r31)
/* 8000B454 000083B4  B0 1F 00 00 */	sth r0, 0(r31)
/* 8000B458 000083B8  88 7D 00 00 */	lbz r3, 0(r29)
/* 8000B45C 000083BC  48 00 06 C5 */	bl DSP_FlushChannel__FUc
/* 8000B460 000083C0  88 1A 00 00 */	lbz r0, 0(r26)
/* 8000B464 000083C4  28 00 00 00 */	cmplwi r0, 0
/* 8000B468 000083C8  41 82 00 C0 */	beq .L_8000B528
.L_8000B46C:
/* 8000B46C 000083CC  A0 1F 01 0A */	lhz r0, 0x10a(r31)
/* 8000B470 000083D0  28 00 00 00 */	cmplwi r0, 0
/* 8000B474 000083D4  40 82 00 40 */	bne .L_8000B4B4
/* 8000B478 000083D8  80 7F 01 0C */	lwz r3, 0x10c(r31)
/* 8000B47C 000083DC  38 03 00 01 */	addi r0, r3, 1
/* 8000B480 000083E0  90 1F 01 0C */	stw r0, 0x10c(r31)
/* 8000B484 000083E4  80 7F 01 0C */	lwz r3, 0x10c(r31)
/* 8000B488 000083E8  A0 1D 00 04 */	lhz r0, 4(r29)
/* 8000B48C 000083EC  7C 03 00 40 */	cmplw r3, r0
/* 8000B490 000083F0  40 82 00 24 */	bne .L_8000B4B4
/* 8000B494 000083F4  81 9D 00 0C */	lwz r12, 0xc(r29)
/* 8000B498 000083F8  28 0C 00 00 */	cmplwi r12, 0
/* 8000B49C 000083FC  41 82 00 18 */	beq .L_8000B4B4
/* 8000B4A0 00008400  38 7D 00 00 */	addi r3, r29, 0
/* 8000B4A4 00008404  38 80 00 04 */	li r4, 4
/* 8000B4A8 00008408  7D 88 03 A6 */	mtlr r12
/* 8000B4AC 0000840C  4E 80 00 21 */	blrl 
/* 8000B4B0 00008410  B0 7D 00 06 */	sth r3, 6(r29)
.L_8000B4B4:
/* 8000B4B4 00008414  38 9D 00 0C */	addi r4, r29, 0xc
/* 8000B4B8 00008418  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8000B4BC 0000841C  28 00 00 00 */	cmplwi r0, 0
/* 8000B4C0 00008420  41 82 00 68 */	beq .L_8000B528
/* 8000B4C4 00008424  3B 5D 00 06 */	addi r26, r29, 6
/* 8000B4C8 00008428  A0 7D 00 06 */	lhz r3, 6(r29)
/* 8000B4CC 0000842C  28 03 00 00 */	cmplwi r3, 0
/* 8000B4D0 00008430  41 82 00 0C */	beq .L_8000B4DC
/* 8000B4D4 00008434  38 03 FF FF */	addi r0, r3, -1
/* 8000B4D8 00008438  B0 1A 00 00 */	sth r0, 0(r26)
.L_8000B4DC:
/* 8000B4DC 0000843C  A0 1A 00 00 */	lhz r0, 0(r26)
/* 8000B4E0 00008440  28 00 00 00 */	cmplwi r0, 0
/* 8000B4E4 00008444  40 82 00 44 */	bne .L_8000B528
/* 8000B4E8 00008448  81 84 00 00 */	lwz r12, 0(r4)
/* 8000B4EC 0000844C  38 7D 00 00 */	addi r3, r29, 0
/* 8000B4F0 00008450  38 80 00 00 */	li r4, 0
/* 8000B4F4 00008454  7D 88 03 A6 */	mtlr r12
/* 8000B4F8 00008458  4E 80 00 21 */	blrl 
/* 8000B4FC 0000845C  B0 7A 00 00 */	sth r3, 0(r26)
/* 8000B500 00008460  A0 1A 00 00 */	lhz r0, 0(r26)
/* 8000B504 00008464  28 00 00 00 */	cmplwi r0, 0
/* 8000B508 00008468  40 82 00 20 */	bne .L_8000B528
/* 8000B50C 0000846C  38 00 00 00 */	li r0, 0
/* 8000B510 00008470  38 60 00 01 */	li r3, 1
/* 8000B514 00008474  B0 1F 00 02 */	sth r0, 2(r31)
/* 8000B518 00008478  B0 1F 00 00 */	sth r0, 0(r31)
/* 8000B51C 0000847C  4B FF F5 65 */	bl __Entry_WaitChannel__FUc
/* 8000B520 00008480  88 7D 00 00 */	lbz r3, 0(r29)
/* 8000B524 00008484  48 00 05 FD */	bl DSP_FlushChannel__FUc
.L_8000B528:
/* 8000B528 00008488  3B 9C 00 01 */	addi r28, r28, 1
/* 8000B52C 0000848C  3B 7B 00 10 */	addi r27, r27, 0x10
/* 8000B530 00008490  28 1C 00 40 */	cmplwi r28, 0x40
/* 8000B534 00008494  41 80 FE C4 */	blt .L_8000B3F8
/* 8000B538 00008498  4B FF F6 49 */	bl EntryCheck_WaitDSPChannel__Fv
/* 8000B53C 0000849C  48 1E A4 39 */	bl PPCSync
/* 8000B540 000084A0  BB 41 00 48 */	lmw r26, 0x48(r1)
/* 8000B544 000084A4  80 01 00 64 */	lwz r0, 0x64(r1)
/* 8000B548 000084A8  38 21 00 60 */	addi r1, r1, 0x60
/* 8000B54C 000084AC  7C 08 03 A6 */	mtlr r0
/* 8000B550 000084B0  4E 80 00 20 */	blr 
.endfn UpdateDSPchannelAll__Fv

.section .data, "wa"  # 0x80222DC0 - 0x802E9640
.balign 8
.obj history, local
	.4byte 0x000F4240
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
.endobj history

.section .sbss, "wa"
.balign 8
.obj old_time, local
	.skip 4
.endobj old_time

.section .sdata2, "a"  # 0x803E8200 - 0x803EC840
.balign 8
.obj lbl_803E8258, local
	.float 1.1
.endobj lbl_803E8258
.balign 8
.obj lbl_803E8260, local
	.8byte 0x4330000000000000
.endobj lbl_803E8260

.section .bss, "wa"  # 0x802E9640 - 0x803E81E5
.balign 32
.obj DSPCH, local
	.skip 0x400
.endobj DSPCH
