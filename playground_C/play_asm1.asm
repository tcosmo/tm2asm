	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	adrp	x8, _below_head@GOTPAGE
	ldr	x8, [x8, _below_head@GOTPAGEOFF]
	adrp	x9, _above_head@GOTPAGE
	ldr	x9, [x9, _above_head@GOTPAGEOFF]
	str	wzr, [sp, #28]
	adrp	x10, _tape@GOTPAGE
	ldr	x10, [x10, _tape@GOTPAGEOFF]
	str	x10, [x8]
	ldr	x10, [x8]
	adrp	x11, _initial_below_head@GOTPAGE
	ldr	x11, [x11, _initial_below_head@GOTPAGEOFF]
	str	x10, [x11]
	ldr	x10, [x8]
	mov	x11, #33919
	movk	x11, #30, lsl #16
	add	x10, x10, x11
	str	x10, [x9]
	ldr	x10, [x9]
	adrp	x11, _initial_above_head@GOTPAGE
	ldr	x11, [x11, _initial_above_head@GOTPAGEOFF]
	str	x10, [x11]
	ldr	x10, [x8]
	mov	w12, #2
	strb	w12, [x10]
	ldr	x10, [x8]
	mov	x11, #16960
	movk	x11, #15, lsl #16
	add	x10, x10, x11
	mov	w13, #3
	strb	w13, [x10]
	ldr	x10, [x9]
	strb	w12, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	mov	w12, #0
	strb	w12, [x10]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
                                        ;     Child Loop BB0_48 Depth 2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cbnz	w10, LBB0_9
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	mov	w9, #1
	strb	w9, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	ldrb	w9, [x10]
	cmp	w9, #3                          ; =3
	b.eq	LBB0_4
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #3                         ; =3
	b.ne	LBB0_5
LBB0_4:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	b	LBB0_8
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	strb	w10, [x11]
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
LBB0_8:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_16
LBB0_9:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #1                         ; =1
	b.ne	LBB0_15
; %bb.10:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	subs	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x11, [x10]
	subs	x11, x11, #1                    ; =1
	str	x11, [x10]
	ldr	x11, [x10]
	ldrb	w9, [x11]
	cmp	w9, #3                          ; =3
	b.ne	LBB0_12
; %bb.11:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_12:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #1
	strb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	ldrb	w10, [x11]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_14
; %bb.13:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
LBB0_14:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_33
LBB0_15:                                ;   in Loop: Header=BB0_1 Depth=1
LBB0_16:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cbnz	w10, LBB0_24
; %bb.17:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	mov	w9, #1
	strb	w9, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	ldrb	w9, [x10]
	cmp	w9, #3                          ; =3
	b.eq	LBB0_19
; %bb.18:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #3                         ; =3
	b.ne	LBB0_20
LBB0_19:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_20:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_22
; %bb.21:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	b	LBB0_23
LBB0_22:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	strb	w10, [x11]
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
LBB0_23:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_33
LBB0_24:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #1                         ; =1
	b.ne	LBB0_32
; %bb.25:                               ;   in Loop: Header=BB0_16 Depth=2
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	mov	w9, #1
	strb	w9, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	ldrb	w9, [x10]
	cmp	w9, #3                          ; =3
	b.eq	LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_16 Depth=2
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #3                         ; =3
	b.ne	LBB0_28
LBB0_27:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_28:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_16 Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	b	LBB0_31
LBB0_30:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	strb	w10, [x11]
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
LBB0_31:                                ;   in Loop: Header=BB0_16 Depth=2
	b	LBB0_16
LBB0_32:                                ;   in Loop: Header=BB0_1 Depth=1
LBB0_33:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cbnz	w10, LBB0_41
; %bb.34:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	mov	w9, #1
	strb	w9, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	ldrb	w9, [x10]
	cmp	w9, #3                          ; =3
	b.eq	LBB0_36
; %bb.35:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #3                         ; =3
	b.ne	LBB0_37
LBB0_36:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_37:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_39
; %bb.38:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	b	LBB0_40
LBB0_39:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	strb	w10, [x11]
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
LBB0_40:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_48
LBB0_41:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #1                         ; =1
	b.ne	LBB0_47
; %bb.42:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	subs	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x11, [x10]
	subs	x11, x11, #1                    ; =1
	str	x11, [x10]
	ldr	x11, [x10]
	ldrb	w9, [x11]
	cmp	w9, #3                          ; =3
	b.ne	LBB0_44
; %bb.43:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_44:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	ldrb	w10, [x11]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
LBB0_46:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_61
LBB0_47:                                ;   in Loop: Header=BB0_1 Depth=1
LBB0_48:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cbnz	w10, LBB0_54
; %bb.49:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	subs	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x11, [x10]
	subs	x11, x11, #1                    ; =1
	str	x11, [x10]
	ldr	x11, [x10]
	ldrb	w9, [x11]
	cmp	w9, #3                          ; =3
	b.ne	LBB0_51
; %bb.50:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_51:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #1
	strb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	ldrb	w10, [x11]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_53
; %bb.52:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
LBB0_53:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_1
LBB0_54:                                ;   in Loop: Header=BB0_48 Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #1                         ; =1
	b.ne	LBB0_60
; %bb.55:                               ;   in Loop: Header=BB0_48 Depth=2
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	subs	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x11, [x10]
	subs	x11, x11, #1                    ; =1
	str	x11, [x10]
	ldr	x11, [x10]
	ldrb	w9, [x11]
	cmp	w9, #3                          ; =3
	b.ne	LBB0_57
; %bb.56:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_57:                                ;   in Loop: Header=BB0_48 Depth=2
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #1
	strb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	ldrb	w10, [x11]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_59
; %bb.58:                               ;   in Loop: Header=BB0_48 Depth=2
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
LBB0_59:                                ;   in Loop: Header=BB0_48 Depth=2
	b	LBB0_48
LBB0_60:                                ;   in Loop: Header=BB0_1 Depth=1
LBB0_61:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cbnz	w10, LBB0_69
; %bb.62:
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	mov	w9, #1
	strb	w9, [x10]
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [x8]
	ldrb	w9, [x10]
	cmp	w9, #3                          ; =3
	b.eq	LBB0_64
; %bb.63:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #3                         ; =3
	b.ne	LBB0_65
LBB0_64:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_65:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_67
; %bb.66:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	b	LBB0_68
LBB0_67:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	strb	w10, [x11]
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
LBB0_68:
	b	LBB0_76
LBB0_69:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldrb	w10, [x9]
	cmp	w10, #1                         ; =1
	b.ne	LBB0_75
; %bb.70:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x8, _steps_count@PAGE
	ldr	w9, [x8, _steps_count@PAGEOFF]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, _steps_count@PAGEOFF]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x10, [x8]
	subs	x10, x10, #1                    ; =1
	str	x10, [x8]
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x11, [x10]
	subs	x11, x11, #1                    ; =1
	str	x11, [x10]
	ldr	x11, [x10]
	ldrb	w9, [x11]
	cmp	w9, #3                          ; =3
	b.ne	LBB0_72
; %bb.71:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_77
LBB0_72:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x11, [x9]
	ldrb	w10, [x11]
	cmp	w10, #2                         ; =2
	b.ne	LBB0_74
; %bb.73:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	ldr	x9, [x8]
	mov	w10, #0
	strb	w10, [x9]
LBB0_74:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_1
LBB0_75:
LBB0_76:
	str	wzr, [sp, #28]
LBB0_77:
	ldr	w0, [sp, #28]
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_steps_count                    ; @steps_count
.zerofill __DATA,__common,_steps_count,4,2
	.comm	_tape,2000000,0                 ; @tape
	.comm	_below_head,8,3                 ; @below_head
	.comm	_initial_below_head,8,3         ; @initial_below_head
	.comm	_above_head,8,3                 ; @above_head
	.comm	_initial_above_head,8,3         ; @initial_above_head
.subsections_via_symbols
