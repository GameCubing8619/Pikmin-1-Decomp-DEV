.include "macros.inc"
.section .text, "ax"  # 0x80005560 - 0x80221F60
.global __copy
__copy:
/* 802149C4 00211924  28 03 00 00 */	cmplwi r3, 0
/* 802149C8 00211928  4D 82 00 20 */	beqlr 
/* 802149CC 0021192C  28 05 00 00 */	cmplwi r5, 0
/* 802149D0 00211930  4D 82 00 20 */	beqlr 
/* 802149D4 00211934  7C 66 1B 78 */	mr r6, r3
lbl_802149D8:
/* 802149D8 00211938  88 04 00 00 */	lbz r0, 0(r4)
/* 802149DC 0021193C  34 A5 FF FF */	addic. r5, r5, -1
/* 802149E0 00211940  38 84 00 01 */	addi r4, r4, 1
/* 802149E4 00211944  98 06 00 00 */	stb r0, 0(r6)
/* 802149E8 00211948  38 C6 00 01 */	addi r6, r6, 1
/* 802149EC 0021194C  40 82 FF EC */	bne lbl_802149D8
/* 802149F0 00211950  4E 80 00 20 */	blr 
