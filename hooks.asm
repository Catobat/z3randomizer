;================================================================================
; Init Hook
;--------------------------------------------------------------------------------
org $00802F ; <- 2F - Bank00.asm : 45
JSL.l Init_Primary
NOP
;--------------------------------------------------------------------------------

;================================================================================
; Frame Hook
;--------------------------------------------------------------------------------
org $008056 ; <- 56 - Bank00.asm : 77
JSL.l FrameHookAction
;--------------------------------------------------------------------------------

;================================================================================
; NMI Hook
;--------------------------------------------------------------------------------
org $0080CC ; <- CC - Bank00.asm : 164 (PHA : PHX : PHY : PHD : PHB)
JML.l NMIHookAction
org $0080D0 ; <- D0 - Bank00.asm : 164 (PHA : PHX : PHY : PHD : PHB)
NMIHookReturn:
;--------------------------------------------------------------------------------

;================================================================================
; Dungeon Entrance Hook
;--------------------------------------------------------------------------------
org $02D8C7 ; <- 158C7 - Bank02.asm : 10981 (STA $7EC172)
JSL.l OnDungeonEntrance
;--------------------------------------------------------------------------------

;================================================================================
; Hash Key Display
;--------------------------------------------------------------------------------
org $0CCDB5 ; <- 64DB5 - Bank0C.asm : 1776 (LDA.b #$06 : STA $14)
JSL.l PrepHashAlphabet
;--------------------------------------------------------------------------------

;================================================================================
; Agahnim 0bb
;--------------------------------------------------------------------------------
org $1ED6EF ; <- F56EF - sprite_agahnim.asm : 636 (JSL GetRandomInt : AND.b #$01 : BNE BRANCH_GAMMA)
NOP #18
;--------------------------------------------------------------------------------

;================================================================================
; Zelda Sprite Fixes
;--------------------------------------------------------------------------------
org $05EBCF ; <- 2EBCF - sprite_zelda.asm : 23 (LDA $7EF359 : CMP.b #$02 : BCS .hasMasterSword)
NOP #8
;--------------------------------------------------------------------------------
;org $06C06F ; <- 3406F - Bank06.asm : 1794 (JSL Sprite_ZeldaLong)
;JSL.l SpawnZelda
;--------------------------------------------------------------------------------

;================================================================================
; Alternate Goal
;--------------------------------------------------------------------------------
;Invincible Ganon
org $06F2C8 ; <- 372C8 - Bank06.asm : 5776 (LDA $44 : CMP.b #$80 : BEQ .no_collision)
JSL.l GoalItemGanonCheck
;--------------------------------------------------------------------------------

;================================================================================
; Stat Hooks
;--------------------------------------------------------------------------------
org $079202 ; 39202 <- Bank07.asm : 2859 (JSL AddDashTremor)
JSL.l StatBonkCounter
;--------------------------------------------------------------------------------
org $02B797 ; <- 13797 - Bank02.asm : 8712 (LDA.b #$19 : STA $10)
JSL.l StatsFinalPrep
;--------------------------------------------------------------------------------
org $07A95B ; <- 3A95B - Bank07.asm : 6565 (JSL Dungeon_SaveRoomData)
JSL.l IncrementUWMirror
;--------------------------------------------------------------------------------
org $0288D1 ; <- 108D1 - Bank02.asm : 1690 (STZ $0646)
JSL.l IndoorSubtileTransitionCounter
NOP #2
;--------------------------------------------------------------------------------
org $02895D ; <- 1095D - Bank02.asm : 1812 (JSL Dungeon_LoadRoom)
JSL.l IndoorTileTransitionCounter
;--------------------------------------------------------------------------------
org $07B574 ; <- 3B574 - Bank07.asm : 8519 (LDA.b #$01 : STA $02E9)
JSL.l IncrementChestCounter
NOP
;--------------------------------------------------------------------------------
;org $05FC7E ; <- 2FC7E - sprite_dash_item.asm : 118 (LDA $7EF36F : INC A : STA $7EF36F)
;JSL.l IncrementSmallKeys
;--------------------------------------------------------------------------------
org $06D18D ; <- 3518D - sprite_absorbable.asm : 274 (LDA $7EF36F : INC A : STA $7EF36F)
JSL.l IncrementSmallKeys
;--------------------------------------------------------------------------------
org $00F945 ; <- 7945 - Bank00.asm : 8557 (JSL SavePalaceDeaths)
JSL.l StatTransitionCounter ; we're not bothering to restore the instruction we wrote over
;--------------------------------------------------------------------------------
org $02B6F3 ; <- 136F3 - Bank02.asm : 8600 (LDA.b #$0F : STA $10)
JSL.l DungeonExitTransition
;--------------------------------------------------------------------------------
org $1BBD6A ; <- DBD6A - Bank1B.asm : 301 (LDA.b #$0F : STA $10)
JSL.l DungeonExitTransition
;--------------------------------------------------------------------------------
org $01C3A7 ; <- C3A7 - Bank01.asm : 9733 (JSL Dungeon_SaveRoomQuadrantData)
JSL.l DungeonStairsTransition
;--------------------------------------------------------------------------------
org $0BFFAC ; <- 5FFAC - Bank0B.asm : 170 (JSL Dungeon_SaveRoomQuadrantData)
JSL.l DungeonStairsTransition
;--------------------------------------------------------------------------------
org $029A17 ; <- 11A17 - Bank02.asm : 4770 (JSL EnableForceBlank)
JSL.l DungeonHoleEntranceTransition
;--------------------------------------------------------------------------------
org $0794EB ; <- 394EB - Bank07.asm : 3325 (LDA $01C31F, X : STA $0476)
JSL.l DungeonHoleWarpTransition
;--------------------------------------------------------------------------------
org $0CC999 ; <- 64999 - Bank0C.asm : 1087 (LDA.b #$0F : STA $13)
NOP #4
;--------------------------------------------------------------------------------
org $01ED75 ; <- ED75 - Bank01.asm : 13963 (JSL Dungeon_SaveRoomQuadrantData)
JSL.l IncrementBigChestCounter
;--------------------------------------------------------------------------------

;================================================================================
; Dialog Override
;--------------------------------------------------------------------------------
;org $0EEE8D ; 0x76E8D <- vwf.asm : 152 (LDA $7F71C0, X : STA $04)
;JSL.l DialogOverride
;NOP #7
;--------------------------------------------------------------------------------
org $0EF1FF ; 0x771FF <- vwf.asm : 1212 (LDA $7F1200, X : AND.w #$007F : SUB.w #$0066 : BPL .commandByte)
JSL.l DialogOverride
org $0EF2DC ; every other LDA $7F1200, X in vwf.asm
JSL.l DialogOverride
org $0EF315
JSL.l DialogOverride
org $0EF332
JSL.l DialogOverride
org $0EF375
JSL.l DialogOverride
org $0EF394
JSL.l DialogOverride
org $0EF511
JSL.l DialogOverride
org $0EF858
JSL.l DialogOverride
org $0EFA26
JSL.l DialogOverride
org $0EFA4C
JSL.l DialogOverride
org $0EFAB4
JSL.l DialogOverride
org $0EFAC8
JSL.l DialogOverride
org $0EFAE1
JSL.l DialogOverride
org $0EFB11
JSL.l DialogOverride
;--------------------------------------------------------------------------------
org $0EFBC6 ; <- 77BC6 - vwf.asm : 2717 (LDA.b #$1C : STA $1CE9)
JSL.l ResetDialogPointer
RTS
;--------------------------------------------------------------------------------

;================================================================================
; Master Sword Chest Fix
;--------------------------------------------------------------------------------
;org $0987d7 ; <- ancilla_init.asm : 1071
;NOP #4
;--------------------------------------------------------------------------------

;================================================================================
; Sprite_DrawMultiple
;--------------------------------------------------------------------------------
org $05DFB1 ; <- 2DFB1 - Bank05.asm : 2499
JSL.l SkipDrawEOR
;--------------------------------------------------------------------------------

;================================================================================
; Kiki Big Bomb Fix
;--------------------------------------------------------------------------------
org $1EE4AF ; <- f64af sprite_kiki.asm : 285 (LDA.b #$0A : STA $7EF3CC)
JSL.l AssignKiki
NOP #2
;--------------------------------------------------------------------------------

;================================================================================
; Hard & Masochist Mode Fixes
;--------------------------------------------------------------------------------
org $07D22B ; <- 3D22B - Bank05.asm : 12752 (LDA $D055, Y : STA $0373)
JSL.l CalculateSpikeFloorDamage : NOP #2
;--------------------------------------------------------------------------------

;================================================================================
; Misc Stats
;--------------------------------------------------------------------------------
org $029E2E ; <- 11E2E - module_ganon_emerges.asm : 59 (JSL Dungeon_SaveRoomData.justKeys)
JSL.l IncrementAgahnim2Sword
;--------------------------------------------------------------------------------
org $0DDBDE ; <- 6DBDE - headsup_display.asm : 105 (DEC A : BPL .subtractRupees)
JSL.l IncrementSpentRupees
NOP #6
;org $0DDBF7 ; <- 6DBF7 - headsup_display.asm : 121 (STA $7EF362)
;RefillLogic_subtractRupees:
;--------------------------------------------------------------------------------

;================================================================================
; Remove Item Menu Text
;--------------------------------------------------------------------------------
org $0DEBB0 ; <- 6EBB0 - equipment.asm : 1810 (LDA $0202)
JMP DrawItem_finished
org $0DECE6 ; <- 6ECE6 - equipment.asm : 1934 (SEP #$30)
DrawItem_finished:
org $0DEB48 ; <- 6EB48 - equipment.asm : 1784 (LDA $0000)
LDA $0000, Y : STA $11F2
LDA $0002, Y : STA $11F4
LDA $0040, Y : STA $1232
LDA $0042, Y : STA $1234
;---------------------------
org $0DE24B ; <- 6E24B - equipment.asm : 951 (LDA $0000)
LDA $0000, Y : STA $11F2
LDA $0002, Y : STA $11F4
LDA $0040, Y : STA $1232
LDA $0042, Y : STA $1234
;--------------------------------------------------------------------------------
org $0DE2DC ; <- 6E2DC - equipment.asm : 989 (LDA $F449, X : STA $122C, Y)
JMP UpdateBottleMenu_return
org $0DE2F1 ; <- 6E2F1 - equipment.asm : 1000 (SEP #$30)
UpdateBottleMenu_return:
;--------------------------------------------------------------------------------
;org $0DDDC3 ; <- 6DDC3 - equipment.asm : 131 (JSR DrawAbilityText)
;NOP #3
org $0DE6F4 ; <- 6E6F4 - equipment.asm : 1474 (BCC .lacksAbility)
db #$80 ; BRA
org $0DE81A ; <- 6E81A - equipment.asm : 1597 (STA $00)
RTS
org $0DE7B9 ; <- 6E7B9 - equipment.asm : 1548 (LDA.w #$16D0)
LDA.w #$1610
org $0DE7CF ; <- 6E7CF - equipment.asm : 1554 (LDA.w #$16C8)
LDA.w #$1608
org $0DE7E5 ; <- 6E7E5 - equipment.asm : 1560 (LDA.w #$16D8)
LDA.w #$1618
org $0DECEB ; <- 6ECEB - equipment.asm : 1946 (LDA.w #$16E0)
LDA.w #$1620
;--------------------------------------------------------------------------------
;org $0DE9D8 ; <- 6E9D8 - equipment.asm : 1635 (LDA $E860, X : STA $12EA, X)
;BRA DrawProgressIcons_initPendantDiagram_notext
;org $0DEA0E ; <- 6EA0E - equipment.asm : 1645 (INX #2)
;DrawProgressIcons_initPendantDiagram_notext:
;--------------------------------------------------------------------------------

;================================================================================
; Map Always Zoomed
;--------------------------------------------------------------------------------
;org $0ABA49 ; <- 53A49 - Bank0A.asm : 447 (LDA.b #$80 : STA $211A)
;JSL.l PrepMapZoom : RTL
;org $0ABB32 ; <- 53B32 - Bank0A.asm : 626 (LDA $F6 : AND.b #$70)
;JSL.l ForceMapZoom
;--------------------------------------------------------------------------------

;================================================================================
; Zelda S&Q Mirror Fix
;--------------------------------------------------------------------------------
org $02D9A4 ; <- 159A4 - Bank02.asm : 11077 (dw $0000, $0002, $0002, $0032, $0004, $0006, $0030)
dw $0000, $0002, $0004, $0032, $0004, $0006, $0030
;--------------------------------------------------------------------------------

;================================================================================
; Accessability
;--------------------------------------------------------------------------------
org $0AC574 ; <- 54574 - Bank0A.asm : 1797 (LDA $0D : STA $0802, X)
JSL FlipGreenPendant
NOP #6
;--------------------------------------------------------------------------------

;================================================================================
; Sword Upgrade Randomization
;--------------------------------------------------------------------------------
org $03FC16 ; <- 1FC16 ($A8, $B8, $3D, $D0, $B8, $3D)
db $B1, $C6, $F9, $C9, $C6, $F9 ; data insert - 2 chests, fat fairy room
org $01E97E ; <- E97E ($280016, $250016)
dl $080116, $070116; <- E97E
;--------------------------------------------------------------------------------
;org $06C9BC ; <- 349BC - sprite_ponds.asm : 1066
;org $06C9C0 ; <- 349C0 - sprite_ponds.asm : 1068
org $06C926 ; <- 34926 - sprite_ponds.asm : 945
JMP.l GetFairySword
NOP #12
org $06C936 ; <- 34936 - sprite_ponds.asm : 952
PyramidFairy_BRANCH_IOTA:
org $06C948 ; <- 34948 - sprite_ponds.asm : 961
PyramidFairy_BRANCH_GAMMA:
;--------------------------------------------------------------------------------
org $1EE16E ; <- F616E - sprite_bomb_shop_entity.asm : 73
NOP #8 ; fix bomb shop dialog for dwarfless big bomb
org $068A14 ; <- 30A14 - sprite_prep.asm : 716
NOP #8 ; fix bomb shop spawn for dwarfless big bomb
;--------------------------------------------------------------------------------
org $06B489 ; <- 33489 - sprite_smithy_bros.asm : 473 (LDA $7EF359 : CMP.b #$03 : BCS .tempered_sword_or_better)
JMP.l GetSmithSword
NOP #4
Smithy_DoesntHaveSword:
org $06B49D ; <- 3349D - sprite_smithy_bros.asm : 485 (.tempered_sword_or_better)
Smithy_AlreadyGotSword:
;--------------------------------------------------------------------------------
org $06ED55 ; <- 36D55 - Bank06.asm : 4817
JSL.l LoadSwordForDamage ; moth gold sword fix
;--------------------------------------------------------------------------------
org $08C5F7 ; <- 445F7 - ancilla_receive_item.asm : 400 (LDA.b #$09 : STA $012D)
NOP #5 ; remove spooky telepathy sound
;--------------------------------------------------------------------------------
org $1EE094 ; PC 0xF6094 - sprite_hylian_plaque.asm : 79 (JSL Sprite_ShowMessageUnconditional)
JSL.l DialogPedestal
;--------------------------------------------------------------------------------
org $08C431 ; <- 44431 - ancilla_receive_item.asm : 125 (LDA $0C5E, X : CMP.b #$01 : BNE .notMasterSword2)
LDA $8A : CMP.b #$80 : NOP
;--------------------------------------------------------------------------------

;================================================================================
; New Items
;--------------------------------------------------------------------------------
org $07B57B ; <- 3B57B - Bank07.asm : 8523 (BMI .cantOpen)
NOP #2
;--------------------------------------------------------------------------------
org $00D531 ; 5531 - Bank00.asm:3451 (LDY.b #$5D)
JMP.l GetAnimatedSpriteGfxFile

org $00D547 ; 5547 - Bank00.asm:3467 (JSR Decomp_spr_high)
GetAnimatedSpriteGfxFile_return:

org $00D557 ; 5557 - Bank00.asm:3486 (LDA $00 : ADC $D469, X)
JSL.l GetAnimatedSpriteBufferPointer
NOP

org $0799F7 ; 399F7 - Bank07.asm:4107 (JSL AddReceivedItem)
JSL.l AddReceivedItemExpanded

org $098611 ; 48611 - ancilla_init.asm:720 (LDA .item_target_addr+0, X)
LDA.w AddReceivedItemExpanded_item_target_addr+0, X
org $098616 ; 48616 - ancilla_init.asm:721 (LDA .item_target_addr+1, X)
LDA.w AddReceivedItemExpanded_item_target_addr+1, X
org $09861F ; 4861F - ancilla_init.asm:724 (LDA .item_values, Y)
LDA.w AddReceivedItemExpanded_item_values, Y

org $098627 ; 48627 - ancilla_init.asm:731 (LDA .item_target_addr+0, X)
LDA.w AddReceivedItemExpanded_item_target_addr+0, X
org $09862C ; 4862C - ancilla_init.asm:722 (LDA .item_target_addr+1, X)
LDA.w AddReceivedItemExpanded_item_target_addr+1, X
org $098635 ; 48635 - ancilla_init.asm:727 (LDA .item_values, Y)
LDA.w AddReceivedItemExpanded_item_values, Y

org $0986AA ; 486AA - ancilla_init.asm:848 (LDA .item_masks, X)
LDA.w AddReceivedItemExpanded_item_masks, X

org $098769 ; 48769 - ancilla_init.asm:1005 (LDA .item_graphics_indices, Y)
LDA.w AddReceivedItemExpanded_item_graphics_indices, Y

org $09884D ; 4884D - ancilla_init.asm:1137 (LDA $836C, Y)
LDA.w AddReceivedItemExpanded_y_offsets, Y
org $09885B ; 4885B - ancilla_init.asm:1139 (LDA .x_offsets, X) - I think the disassembly is wrong here, should have been LDA .x_offsets, Y
LDA.w AddReceivedItemExpanded_x_offsets, Y

org $0988B7 ; 488B7 - ancilla_init.asm:1199 (LDA .wide_item_flag, Y)
LDA.w AddReceivedItemExpanded_wide_item_flag, Y

org $0988EF ; 488EF - ancilla_init.asm:1248 (LDA $836C, Y)
LDA.w AddReceivedItemExpanded_y_offsets, Y
org $098908 ; 48908 - ancilla_init.asm:1258 (LDA .x_offsets, Y)
LDA.w AddReceivedItemExpanded_x_offsets, Y

org $08C6C8 ; 446C8 - ancilla_receive_item.asm:538 (LDA AddReceiveItem.properties, X)
LDA.l AddReceivedItemExpanded_properties, X
org $00C6F9 ; 446F9 - ancilla_receive_item.asm:570 (LDA AddReceiveItem.properties, X)
LDA.l AddReceivedItemExpanded_properties, X

org $08C6DE ; 446DE - ancilla_receive_item.asm:550 (LDA .wide_item_flag, X)
LDA.l AddReceivedItemExpanded_wide_item_flag, X

org $0985ED ; 485ED - ancilla_init.asm:693 (LDA $02E9 : CMP.b #$01)
JSL.l AddReceivedItemExpandedGetItem
NOP

org $07B57D ; 3B57D - Bank07.asm:8527 (LDA Link_ReceiveItemAlternates, Y : STA $03)
JSL.l Link_ReceiveItemAlternatesExpanded_loadAlternate
NOP
;--------------------------------------------------------------------------------
org $09892E ; 4892E - ancilla_init.asm:1307 (LDA BottleList, X)
LDA.w BottleListExpanded, X

org $09895C ; 4895C - ancilla_init.asm:1344 (LDA PotionList, X)
LDA.w PotionListExpanded, X
;--------------------------------------------------------------------------------
org $06D1EB ; 351EB - sprite_absorbable.asm:364 (STA $7EF375) ; bugbug commented out until i figure out why it doesn't work
JSL HandleBombAbsorbtion
;--------------------------------------------------------------------------------

;================================================================================
; Kholdstare Shell Fix
;--------------------------------------------------------------------------------
org $00EC88 ; <- 6C88 - Bank00.asm:6671 - (LDA $7EC380, X : STA $7EC580, X)
LDA $7EC3A0, X : STA $7EC5A0, X
;--------------------------------------------------------------------------------
org $00ECEB ; <- 6CEB - Bank00.asm:6730 - (LDX.w #$0080)
LDX.w #$00A0
LDA.w #$00B0
;--------------------------------------------------------------------------------

;================================================================================
; Potion Refill Fixes
;--------------------------------------------------------------------------------
;org $0DF1B3 ; <- 6F1B3 - headsup_display.asm:492 - (SEP #$30)
;JSL.l RefillMagic
;RTL
;--------------------------------------------------------------------------------
;org $0DF128 ; <- 6F128 - headsup_display.asm:407 - (LDA $7EF36D : CMP $7EF36C : BCC .refillAllHealth)
;JSL.l RefillHealth
;RTL
;--------------------------------------------------------------------------------
org $00F8FB ; <- 78FB - Bank00.asm:8507 - (JSL HUD.RefillHealth : BCC BRANCH_ALPHA)
JSL.l RefillHealth
;--------------------------------------------------------------------------------
org $00F911 ; <- 7911 - Bank00.asm:8528 - (JSL HUD.RefillMagicPower : BCS BRANCH_$7901)
JSL.l RefillMagic
;--------------------------------------------------------------------------------
org $00F918 ; <- 7918 - Bank00.asm:8537 - (JSL HUD.RefillHealth : BCC .alpha)
JSL.l RefillHealth
;--------------------------------------------------------------------------------
org $00F922 ; <- 7922 - Bank00.asm:8543 - (JSL HUD.RefillMagicPower : BCC .beta)
JSL.l RefillMagic
;--------------------------------------------------------------------------------

;================================================================================
; Early Bottle Fix
;--------------------------------------------------------------------------------
org $09894C ; <- 4894C - ancilla_init.asm:1327
JSL.l InitializeBottles 
;--------------------------------------------------------------------------------

;================================================================================
; Agahnim Doors Fix
;--------------------------------------------------------------------------------
org $1BBC94 ; <- DBC94 - Bank1B.asm : 201 (LDA $7EF3C5 : AND.w #$000F : CMP.w #$0003 : BCS BRANCH_EPSILON)
JSL.l LockAgahnimDoors : BNE Overworld_Entrance_BRANCH_EPSILON : NOP #6

org $1BBCC1 ; <- DBCC1 - Bank1B.asm : 223 (LDA $0F8004, X : AND.w #$01FF : STA $00)
Overworld_Entrance_BRANCH_EPSILON: ; go here to lock doors
;--------------------------------------------------------------------------------
; -- HOOK THIS LATER TO FUCK WITH BOSS DROPS --
org $01C73E ; <- C73E - Bank01.asm : 10377 (LDA $01C6FC, X : JSL Sprite_SpawnFallingItem)
JSL.l DropSafeDungeon
NOP #4
;--------------------------------------------------------------------------------

;================================================================================
; Uncle / Sage Fixes - Old Man Fixes - Link's House Fixes
;--------------------------------------------------------------------------------
org $05DA4F ; <- 2DA4F - sprite_uncle_and_priest.asm : 45 (BCC .agahnim_not_defeated)
db 80 ; BRA
;--------------------------------------------------------------------------------
org $05DA61 ; <- 2DA61 - sprite_uncle_and_priest.asm : 51 (BEQ .priest_not_already_dead)
db 80 ; BRA
;--------------------------------------------------------------------------------
org $05DA81 ; <- 2DA81 - sprite_uncle_and_priest.asm : 65 (BCC .dontHaveMasterSword)
db 80 ; BRA
;--------------------------------------------------------------------------------
;org $05DE1D ; <- 2DE1D - sprite_uncle_and_priest.asm : 725 (LDA.b #$A0 : STA $7EF372)
;JSL.l RefillHealthPlusMagic8bit
;NOP #2
;--------------------------------------------------------------------------------
org $05DEF8 ; <- 2DEF8 - sprite_uncle_and_priest.asm : 917 (LDA.b #$05)
LDA.b #$00
;--------------------------------------------------------------------------------
org $05DE6A ; <- 2DE6A - sprite_uncle_and_priest.asm : 796 (JSL Sprite_ShowMessageUnconditional)
NOP #4
;--------------------------------------------------------------------------------
org $05DE9E ; <- 2DE9E - sprite_uncle_and_priest.asm : 845 (JSL Sprite_ShowMessageUnconditional)
JSL.l DialogUncle
;--------------------------------------------------------------------------------
;org $1EEAB6 ; <- F6AB6 - sprite_old_mountain_man.asm : 338 (LDA.b #$A0 : STA $7EF372)
;JSL.l RefillHealthPlusMagic8bit
;NOP #2
;--------------------------------------------------------------------------------
;org $01E5B2 ; <- E5B8 - lower pot link's house
;db $14 ; fairy
;org $01E5B5 ; <- E5B8 - lower pot link's house
;db $14 ; fairy
;org $01E5B8 ; <- E5B8 - lower pot link's house
;db $0D ; big magic
;--------------------------------------------------------------------------------

;================================================================================
; Ganon's Tower Basement Door Fix
;--------------------------------------------------------------------------------
;org $1FF3F4 ; <- 0FF3F4
;db $00
;--------------------------------------------------------------------------------
; Misery Mire Basement Door Fix
;--------------------------------------------------------------------------------
;org $1FB8E4 ; <- 0FB8E4
;db $00
;--------------------------------------------------------------------------------

;================================================================================
; Bomb & Arrow Capacity Updates
;--------------------------------------------------------------------------------
org $0DDC27 ; <- 6DC27 - headsup_display.asm:151 (LDA $7EF370 : TAY)
JSL.l IncrementBombs
NOP #15
;--------------------------------------------------------------------------------
org $0DDC49 ; <- 6DC49 - headsup_display.asm:169 (LDA $7EF371 : TAY)
JSL.l IncrementArrows
NOP #15
;--------------------------------------------------------------------------------
org $1EE199 ; <- F6199 - sprite_bomb_shop_entity.asm:102 (LDA $7EF370 : PHX : TAX)
JSL.l CompareBombsToMax
NOP #11
;--------------------------------------------------------------------------------

;================================================================================
; Bonk Items
;--------------------------------------------------------------------------------
org $05FC7E ; <- 2FC7E - sprite_dash_item.asm : 118 (LDA $7EF36F : INC A : STA $7EF36F)
JSL.l GiveBonkItem : NOP #5
org $05FC97 ; <- 2FC97 - sprite_dash_item.asm : 126 (LDA.b #$2F : JSL Sound_SetSfx3PanLong)
NOP #6
;--------------------------------------------------------------------------------
org $068D39 ; <- 30D39 - sprite_prep.asm : 1435 - (LDA.b #$08 : STA $0F50, X)
JSL.l LoadBonkItemGFX
;--------------------------------------------------------------------------------
org $05FC04 ; <- 2FC04 - sprite_dash_item.asm : 38 - (JSL DashKey_Draw)
JSL.l DrawBonkItemGFX
;--------------------------------------------------------------------------------

;================================================================================
; Library Item
;--------------------------------------------------------------------------------
org $05FD44 ; <- 2FD44 - sprite_dash_item.asm : 244 - (JSL Link_ReceiveItem)
JSL.l SetLibraryItem
;--------------------------------------------------------------------------------
org $068D1B ; <- 30D1B - sprite_prep.asm : 1414 - (JSL GetAnimatedSpriteTile.variable)
JSL.l LoadLibraryItemGFX
;--------------------------------------------------------------------------------
org $05FC9E ; <- 2FC9E - sprite_dash_item.asm : 138 - (JSL Sprite_PrepAndDrawSingleLargeLong)
JSL.l DrawLibraryItemGFX
;--------------------------------------------------------------------------------
org $068D0E ; <- 30D0E - sprite_prep.asm : 1401 - (LDA $7EF34E : BEQ .book_of_mudora)
JSL.l ItemCheck_Library
;--------------------------------------------------------------------------------

;================================================================================
; Inventory Updates
;--------------------------------------------------------------------------------
org $0DDF38 ; <- 6DF38 - equipment.asm : 480
JSL.l ProcessMenuButtons
BCC _equipment_497
JMP.w _equipment_544
;NOP #7
ResetEquipment:
JSR.w RestoreNormalMenu ; (short)
RTL
NOP #3

warnpc $0DDF49
org $0DDF49 ; <- 6DF49 - equipment.asm : 497
_equipment_497: ; LDA $F4 : AND.b #$08 : BEQ .notPressingUp - NO BUTTON CAPTURE
;org $0DDF7E ; <- 6DF7E - equipment.asm : 539
org $0DDF88 ; <- 6DF88 - equipment.asm : 544
;org $0DE10E ; <- 6E10E - equipment.asm : 806
_equipment_544:
;--------------------------------------------------------------------------------
org $0DEB98 ; <- 6EB98 - equipment.asm : 1803
;LDA.w #$3C60 : STA $FFBE, Y
;ORA.w #$4000 : STA $FFC4, Y
;ORA.w #$8000 : STA $0084, Y
;EOR.w #$4000 : STA $007E, Y
LDA.w #$3C60 : STA $FFBE, Y
ORA.w #$8000 : STA $007E, Y
ORA.w #$4000 : STA $0084, Y
JSL.l AddYMarker
NOP #2
;--------------------------------------------------------------------------------
;org $0DDE9B ; <- 6DE9B equipment.asm:296 - LDA $0202 : CMP.b #$10 : BNE .notOnBottleMenu (CMP instruction)
;CMP.b #$FF
;--------------------------------------------------------------------------------
org $0DDE9F ; <- 6DE9F equipment.asm:300 - LDA.b #$0A : STA $0200
LDA.b #$04
;--------------------------------------------------------------------------------
org $0DDE3D ; <- 6DE3D equipment.asm:217 - BNE .equippedItemIsntBottle
db $80 ; BRA
;--------------------------------------------------------------------------------
org $0DE12D ; <- 6E12D - equipment.asm : 828
JSL.l ProcessBottleMenu
;--------------------------------------------------------------------------------
org $0DDF9A ; <- 6DF9A - equipment.asm : 554
JSL.l OpenBottleMenu
NOP
;--------------------------------------------------------------------------------
org $0DE12D ; <- 6E12D - equipment.asm : 828
JSL.l CloseBottleMenu
;--------------------------------------------------------------------------------
org $0DEE70 ; <- 6EE70 - equipment.asm : 2137
JSL.l PrepItemScreenBigKey
NOP
;--------------------------------------------------------------------------------
org $08D395 ; <- 45395 - ancilla_bird_travel_intro.asm : 253
JSL.l UpgradeFlute
NOP #2
;--------------------------------------------------------------------------------
org $05E4D7 ; <- 2E4D7 - sprite_witch.asm : 213
JSL.l RemoveMushroom
NOP #2
;--------------------------------------------------------------------------------
org $05F55F ; <- 2F55F - sprite_potion_shop.asm : 59
JSL.l LoadPowder
;--------------------------------------------------------------------------------
org $05F681 ; <- 2F681 - sprite_potion_shop.asm : 234
JSL.l DrawPowder
RTS
NOP #8
;--------------------------------------------------------------------------------
org $05F65D ; <- 2F65D - sprite_potion_shop.asm : 198
JSL.l CollectPowder
NOP #5
;--------------------------------------------------------------------------------
org $05EE5F ; <- 2EE5F - sprite_mushroom.asm : 30
JSL.l LoadMushroom
NOP
;--------------------------------------------------------------------------------
org $05EE78 ; <- 2EE78 - sprite_mushroom.asm : 58
JSL.l DrawMushroom
;--------------------------------------------------------------------------------
org $05EE97 ; <- 2EE97 - sprite_mushroom.asm : 81
NOP #14
;--------------------------------------------------------------------------------
org $07A36F ; <- 3A36F - Bank07.asm : 5679
NOP #5
org $07A379 ; <- 3A379 - Bank07.asm : 5687
JSL.l SpawnHauntedGroveItem
;--------------------------------------------------------------------------------
org $07A303 ; 3A303 - Bank07.asm : 5622
;JSL.l FixShovelLock
;--------------------------------------------------------------------------------
org $07A3A2 ; 3A3A2 - Bank07.asm : 5720 - JSL DiggingGameGuy_AttemptPrizeSpawn
JSL.l SpawnShovelItem
BRA _Bank07_5726
org $07A3AB ; 3A3AB - Bank07.asm : 5726 - LDA.b #$12 : JSR Player_DoSfx2
_Bank07_5726:
;org $07A381 ; 3A381 - Bank07.asm : 5693 - ORA $035B
;ORA $035B
;--------------------------------------------------------------------------------
org $079A0E ; 39A0E - Bank07.asm : 4117 - JSL HUD.RefreshIconLong
JSL.l Link_ReceiveItem_HUDRefresh
;--------------------------------------------------------------------------------
org $08C6F9 ; 446F9 - ancilla_receive_item.asm : 538 - (LDA AddReceiveItem.properties, X : BPL .valid_upper_properties)
LDA AddReceivedItemExpanded_properties, X
;--------------------------------------------------------------------------------
org $08C70F ; 4470F - ancilla_receive_item.asm : 550 - (LDA .wide_item_flag, X : STA ($92), Y ; AddReceiveItem.wide_item_flag? ; LDA.b #$00 : STA ($92), Y in the japanese version)
JMP.l LoadNarrowObject
NOP
LoadNarrowObjectReturn:
;--------------------------------------------------------------------------------

;================================================================================
; Medallion Tablets
;--------------------------------------------------------------------------------
org $05F274 ; <- 2F274
JSL.l ItemCheck_BombosTablet
;--------------------------------------------------------------------------------
org $05F285 ; <- 2F285
JSL.l ItemCheck_EtherTablet
;--------------------------------------------------------------------------------
org $098BCC ; <- 48BCC - ancilla_init.asm : 1679 (LDA AddReceiveItem.item_graphics_indices, Y : STA $72)
;JSL.l SetTabletItem
JSL SpawnTabletItem : PLX : PLB : RTL
;--------------------------------------------------------------------------------

;================================================================================
; Medallion Entrances
;--------------------------------------------------------------------------------
org $08B504 ; <- 43504 - ancilla_bombos_spell.asm : 671
JSL.l MedallionTrigger_Bombos
NOP
;--------------------------------------------------------------------------------
org $08ACC8 ; <- 42CC8 - ancilla_ether_spell.asm : 350
JSL.l MedallionTrigger_Ether
JMP _ancilla_ether_spell_363
warnpc $08ACE6
org $08ACE6 ; <- 42CE6 - ancilla_quake_spell.asm : 363
_ancilla_ether_spell_363:
;--------------------------------------------------------------------------------
org $08B6EA ; <- 436EA - ancilla_quake_spell.asm : 67
JSL.l MedallionTrigger_Quake
JMP _ancilla_quake_spell_83
Ancilla_CheckIfEntranceTriggered:
	JSR $F856
RTL
warnpc $08B708
org $08B708 ; <- 43708 - ancilla_quake_spell.asm : 83
_ancilla_quake_spell_83:
;--------------------------------------------------------------------------------

;================================================================================
; Big & Great Fairies
;--------------------------------------------------------------------------------
org $1DC475 ; <- EC475 - sprite_big_fairie.asm : 70 (LDA.w #$00A0 : ADD $7EF372 : STA $7EF372)
JSL.l RefillHealthPlusMagic
NOP #8

org $1DC489 ; <- EC489 - sprite_big_fairie.asm : 88 (LDA $7EF36D : CMP $7EF36C : BNE .player_hp_not_full_yet)
NOP #4
JSL.l CheckFullHealth
;--------------------------------------------------------------------------------

;================================================================================
; RNG Fix
;--------------------------------------------------------------------------------
org $1DFD9E ; <- EFD9E - sprite_diggin_guy.asm : 307
NOP #8
;--------------------------------------------------------------------------------
org $1DFD67 ; <- EFD67 - sprite_diggin_guy.asm : 242
JSL.l RigDigRNG
;--------------------------------------------------------------------------------
org $01EE94 ; <- EE94 - Bank01.asm : 14121
JSL.l RigChestRNG
;--------------------------------------------------------------------------------
;org $01EDB2 ; <- EDB2 - Bank01.asm : 14038
;INC $04C4
;--------------------------------------------------------------------------------

;================================================================================
; HUD Changes
;--------------------------------------------------------------------------------
org $0DFC77 ; <- 6FC77 - headsup_display.asm : 845
NOP #$2D ; #45
org $0DFC77 ; <- 6FC77
JSL.l OnDrawHud
BRA $27

org $0DFCB8 ; <- 6FCB8
STA $7EC75A ; nudge bomb 10s digit right

org $0DFCC4 ; <- 6FCC4
STA $7EC75C ; nudge bomb 1s digit right

org $0DFCDC ; <- 6FCDC
STA $7EC760 ; nudge arrow 10s digit right

org $0DFCE8 ; <- 6FCE8
STA $7EC762 ; nudge arrow 1s digit right

org $0DFD0A ; <- 6FD0A - headsup_display.asm : 900
STA $7EC766 ; nudge key digit right

org $0DFD13 ; <- 6FD13 - headsup_display.asm : 905
STA $7EC726 ; key icon blank

org $0DFC37 ; <- 6FC37 - headsup_display.asm : 828 (LDA.w #$28F7)
JSL.l DrawMagicHeader
NOP #17
;--------------------------------------------------------------------------------
org $0DFB29 ; <- - headsup_display.asm : 688 (LDA.b #$86 : STA $7EC71E)
LDA.b #$86 : STA $7EC720 ; nudge silver arrow right
LDA.b #$24 : STA $7EC721
LDA.b #$87 : STA $7EC722
LDA.b #$24 : STA $7EC723
;--------------------------------------------------------------------------------
; Insert our version of the hud tilemap
org $0DFA96 ; <- 6FA96 - headsup_display.asm : 626 (LDX.w #.hud_tilemap)
LDX.w #HUD_TileMap
org $0DFA9C ; <- 6FA9C - headsup_display.asm : 629 (MVN $0D, $7E ; $Transfer 0x014A bytes from $6FE77 -> $7EC700)
MVN $207E
;--------------------------------------------------------------------------------
org $0DE48E ; <- 6E48E - equipment.asm : 1233 (LDA.w #$11CE : STA $00)
JSL.l DrawHUDSilverArrows
NOP
;--------------------------------------------------------------------------------

;================================================================================
; 300 Rupee NPC
;--------------------------------------------------------------------------------
org $1EF060 ; <- F7060 - sprite_shopkeeper.asm:242 (INC $0D80, X)
JSL.l Set300RupeeNPCItem
NOP
;--------------------------------------------------------------------------------

;================================================================================
; Glitched Mode Fixes
;--------------------------------------------------------------------------------
org $1ED4E6 ; <- F54E6 - sprite_agahnim.asm:314 (LDY $0FFF)
JSL.l GetAgahnimType
NOP #2
;--------------------------------------------------------------------------------
org $1ED577 ; <- F5577 - sprite_agahnim.asm:418 (PHX)
JML.l GetAgahnimPalette
GetAgahnimPaletteReturn:
;--------------------------------------------------------------------------------
org $1ED678 ; <- F5678 - sprite_agahnim.asm:587 (INC $0E30, X)
NOP #2
JSL.l GetAgahnimLightning
;--------------------------------------------------------------------------------

;================================================================================
; Half Magic Bat
;--------------------------------------------------------------------------------
org $05FBD3 ; <- 2FBD3 - sprite_mad_batter.asm:209 - (STA $7EF37B)
JSL.l GetMagicBatItem
;--------------------------------------------------------------------------------

;================================================================================
; Open Mode Fixes
;--------------------------------------------------------------------------------
org $05DF65 ; <- 2DF65 - sprite_uncle_and_priest.asm:994 - (LDA.b #$01 : STA $7EF3C5)
JSL.l SetUncleRainState : RTS
;--------------------------------------------------------------------------------
;org $0280DD ; <- 100DD - Bank02.asm:298 - (LDA $7EF3C5 : CMP.b #$02 : BCC .indoors)
;JSL.l ForceLinksHouse
;--------------------------------------------------------------------------------

;================================================================================
; Pendant / Crystal Fixes
;--------------------------------------------------------------------------------
;org $0DE9C8 ; <- 6E9C8 - original check for agahnim 1 being defeated
;;LDA $7EF3CA : CMP.b #$40 ; check for dark world instead
;JSL.l CheckPendantHUD
;NOP #2
;================================================================================
org $0DE9C8 ; <- 6E9C8 - equipment.asm:1623 - (LDA $7EF3C5 : CMP.b #$03 : BCC .beforeAgahnim)
JSL.l DrawPendantCrystalDiagram : RTS
;NOP #11
;================================================================================
org $0DEDCC ; <- 6EDCC - equipment.asm:2043 - (LDA $040C : AND.w #$00FF : CMP.w #$00FF : BNE .inSpecificDungeon)
JSL.l ShowDungeonItems : NOP #5
 
org $0DEE59 ; <- 6EE59 - equipment.asm:2126 - (LDA $040C : AND.w #$00FF : CMP.w #$00FF : BEQ .notInPalace)
JSL.l ShowDungeonItems : NOP #5

org $0DEE8A ; <- 6EE8A - equipment.asm:2151 - (LDA $040C : AND.w #$00FF : CMP.w #$00FF : BEQ .notInPalaceAgain)
JSL.l ShowDungeonItems : NOP #5

org $0DEF3B ; <- 6EF3B - equipment.asm:2290 - (LDA $040C : AND.w #$00FF : CMP.w #$00FF : BEQ .notInPalace)
JSL.l ShowDungeonItems : NOP #5
;================================================================================
org $0DEA5F ; <- 6EA5F - equipment.asm:1679 - (SEP #$30)
;NOP #5
;BRL .skipCrystalInit
;org $0DEAA4 ; <- 6EAA4 - equipment.asm:1706 - (LDA $7EF37A : AND.w #$0001)
;.skipCrystalInit
;================================================================================
org $0DE9D8 ; <- 6E9D8 - equipment.asm:1635 - (LDA $E860, X : STA $12EA, X)
org $0DEA15 ; <- 6EA15 - equipment.asm:1647 - (LDA.w #$13B2 : STA $00)
;================================================================================
org $00F97E ; <- 797E - Bank00.asm:8586 - (LDA $7EF3CA : EOR.b #$40 : STA $7EF3CA)
JSL.l FlipLWDWFlag : NOP #6
;================================================================================
org $02B162 ; <- 13162 - Bank02.asm:7672 - (LDA $7EF3CA : EOR.b #$40 : STA $7EF3CA)
JSL.l IncrementOWMirror
JSL.l FlipLWDWFlag
NOP #2
;================================================================================
;Clear level to open doors
org $01C50D ; 0xC50D - Bank01.asm:10032 - (LDA $7EF3CA : BNE .inDarkWorld)
LDA CrystalPendantFlags_2, X
;================================================================================
;Kill enemy to clear level
org $01C715 ; <- C715 - Bank01.asm:10358 - (LDA $7EF3CA : BNE .inDarkWorld)
LDA CrystalPendantFlags_2, X
;JSL.l GetPendantCrystalWorld
;================================================================================
;org $0AC5C3 ; <- 545C3 - Bank0A.asm:1859 - (LDA $7EF374 : AND $0AC5A6, X : BEQ .fail)
;NOP #10
;CLC
;================================================================================
org $0AC5BB ; < 545BB - Bank0A.asm:1856 - (LDA $7EF3C7 : CMP.b #$03 : BNE .fail)
JSL.l OverworldMap_CheckObject : RTS
org $0AC5D8 ; < 545D8 - Bank0A.asm:1885 - (LDA $7EF3C7 : CMP.b #$07 : BNE OverworldMap_CheckPendant_fail)
JSL.l OverworldMap_CheckObject : RTS
;================================================================================
org $0AC012 ; <- 54012 - Bank0A.asm:1039 - (LDA $7EF2DB)
JSL.l OnLoadMap
;================================================================================
org $0AC53e ; <- 5453E - Bank0A.asm:1771 - (LDA $0AC50D, X : STA $0D)
JSL.l GetCrystalNumber
;================================================================================
; EVERY INSTANCE OF STA $7EF3C7 IN THE ENTIRE CODEBASE
org $029D51 ; <- 11D51
JSL.l SetLWDWMap
org $0589BB ; <- 289BB
JSL.l SetLWDWMap
org $05DD9A ; <- 2DD9A
JSL.l SetLWDWMap

org $05F1F6 ; <- 2F1F6
JSL.l SetLWDWMap
org $05F209 ; <- 2F209
JSL.l SetLWDWMap
org $05FF91 ; <- 2FF91
JSL.l SetLWDWMap

org $098687 ; <- 48687
JSL.l SetLWDWMap
org $1ECEDD ; <- F4EDD
JSL.l SetLWDWMap
org $1ECF0D ; <- F4F0D
JSL.l SetLWDWMap
;================================================================================
; EVERY INSTANCE OF LDA $7EF3C7 IN THE ENTIRE CODEBASE
org $05DDFE ; <- 2DDFE
JSL.l GetMapMode
org $05EE25 ; <- 2EE25
JSL.l GetMapMode
org $05F17D ; <- 2F17D
JSL.l GetMapMode
org $05FF7D ; <- 2FF7D
JSL.l GetMapMode

org $0AC01A ; <- 5401A
JSL.l GetMapMode
org $0AC037 ; <- 54037
JSL.l GetMapMode
org $0AC079 ; <- 54079
JSL.l GetMapMode
org $0AC0B8 ; <- 540B8 x
JSL.l GetMapMode
org $0AC0F8 ; <- 540F8
JSL.l GetMapMode
org $0AC137 ; <- 54137
JSL.l GetMapMode
org $0AC179 ; <- 54179
JSL.l GetMapMode
org $0AC1B3 ; <- 541B3
JSL.l GetMapMode
org $0AC1F5 ; <- 541F5
JSL.l GetMapMode
org $0AC22F ; <- 5422F
JSL.l GetMapMode
org $0AC271 ; <- 54271
JSL.l GetMapMode
org $0AC2AB ; <- 542AB
JSL.l GetMapMode
org $0AC2ED ; <- 542ED
JSL.l GetMapMode
org $0AC327 ; <- 54327
JSL.l GetMapMode
org $0AC369 ; <- 54369
JSL.l GetMapMode

org $0DC849 ; <- 6C849
JSL.l GetMapMode
;================================================================================
org $0AC012 ; <- 54012 - Bank0A.asm:1039 (LDA $7EF2DB : AND.b #$20 : BNE BRANCH_DELTA)
NOP #8
;================================================================================
org $028B8F ; <- 10B8F - Bank02.asm:2236 (LDA $7EF374 : LSR A : BCS BRANCH_BETA)
JSL.l CheckHeraObject : BNE + : NOP
LDX.b #$F1 : STX $012C
+
;================================================================================
org $029090 ; <- 11090 - Bank02.asm:3099 (LDA $7EF374 : LSR A : BCS BRANCH_GAMMA)
JSL.l CheckHeraObject : BNE + : NOP
STX $012C
+
;================================================================================
org $029798 ; <- 11798 - Bank02.asm:4287 (CMP $02895C, X : BNE BRANCH_ALPHA)
NOP #6 ; remove crystal room cutscene check that causes softlocks
;================================================================================

;================================================================================
; Text Changes
;--------------------------------------------------------------------------------
org $02A005 ; <- 12005 - Bank02.asm:5667 (JSL Main_ShowTextMessage)
JSL.l DialogTriforce : NOP #4
;--------------------------------------------------------------------------------
org $1D92EC ; <- E92EC - sprite_ganon.asm:947 (JSL Sprite_ShowMessageMinimal)
JSL.l DialogGanon1
;--------------------------------------------------------------------------------
org $1D9078 ; <- E9078 - sprite_ganon.asm:552 (LDA.b #$70 : STA $1CF0)
JSL.l DialogGanon2 : RTS
;--------------------------------------------------------------------------------
org $1DA4EC ; <- EA4EC - sprite_blind_entities.asm:845 (JSL Sprite_ShowMessageMinimal)
JSL.l DialogBlind
;--------------------------------------------------------------------------------
org $06C94C ; <- 3494C - sprite_ponds.asm:970 (JSL Sprite_ShowMessageUnconditional)
JSL.l DialogFatFairy
;--------------------------------------------------------------------------------
;-- Sahasrahla (no green pendant)
org $05F16C ; <- 2F16C sprite_elder.asm:137 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;--------------------------------------------------------------------------------
;-- Sahasrahla (have boots)
org $05F1A8 ; <- 2F1A8 sprite_elder.asm:170 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;--------------------------------------------------------------------------------
;-- Sahasrahla (have boots, have ice rod)
org $05F1BC ; <- 2F1BC sprite_elder.asm:182 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;--------------------------------------------------------------------------------
;-- Sahasrahla (have boots, have ice rod, have 3 pendants)
org $05F1CE ; <- 2F1CE sprite_elder.asm:194 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;--------------------------------------------------------------------------------
;-- Sahasrahla (have boots, have ice rod, have 3 pendants, have master sword)
org $05F1D8 ; <- 2F1D8 sprite_elder.asm:204 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;--------------------------------------------------------------------------------
;-- drinking guy
org $1EF61C ; <- F761C sprite_drinking_guy.asm:29 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL.l Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;================================================================================

;================================================================================
; Text Removal
;--------------------------------------------------------------------------------
;-- Music restarting at zelda fix
org $05ED10 ; <- 2ED10 - sprite_zelda.asm : 233 - (LDA.b #$19 : STA $012C)
NOP #5
;--------------------------------------------------------------------------------
org $1ECE47 ; <- F4E47 - sprite_crystal_maiden.asm : 220
JMP.l MaidenCrystalScript
;--------------------------------------------------------------------------------
org $1ECCEB ; <- F4CEB - sprite_crystal_maiden.asm : 25 ; skip all palette nonsense
JMP.l SkipCrystalPalette
org $1ECD39
SkipCrystalPalette:
;--------------------------------------------------------------------------------
org $08C3FD ; <- 443FD - ancilla_receive_item.asm : 89
!MS_GOT = "$7F5031"
LDA #$40 : STA !MS_GOT
;;NOP #6 ; don't set master sword follower
;--------------------------------------------------------------------------------
org $08C5FE ; <- 445FE - ancilla_receive_item.asm : 408
NOP #4
;--------------------------------------------------------------------------------
org $1ED467 ; <- F5467 - sprite_agahnim.asm : 202
NOP #4
;--------------------------------------------------------------------------------
org $1ED4FF ; <- F54FF - sprite_agahnim.asm : 328
NOP #4
;--------------------------------------------------------------------------------
;org $029C94 ; <- 11C94 - Bank02.asm : 5197 (JSL Main_ShowTextMessage)
;NOP #4
;--------------------------------------------------------------------------------
org $029CBD ; <- 11CBD - Bank02.asm : 5227 (JSL Messaging_Text)
STZ $11
NOP #2
;--------------------------------------------------------------------------------
;org $029CD3 ; <- 11CD3 - Bank02.asm : 5237 (BNE BRANCH_BETA)
;db $80 ; BRA
;--------------------------------------------------------------------------------
org $029CDF ; <- 11CDF - Bank02.asm : 5245 (JSL Main_ShowTextMessage)
NOP #4
;--------------------------------------------------------------------------------
org $029CF0 ; <- 11CF0 - Bank02.asm : 5266
STZ $11
NOP #2
;--------------------------------------------------------------------------------
org $05FB70 ; <- 2FB70 - sprite_mad_batter.asm:131 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;--------------------------------------------------------------------------------
org $05FBC2 ; <- 2FBC3 - sprite_mad_batter.asm:195 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;--------------------------------------------------------------------------------
;org $05F16C ; <- 2F16C - sprite_elder.asm : 137 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .dont_show)
;NOP #4
;--------------------------------------------------------------------------------
;org $05F190 ; <- 2F190 - sprite_elder.asm : 170 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
;NOP #4
;--------------------------------------------------------------------------------
;org $05F1A8 ; <- 2F1A8 - sprite_elder.asm : 182 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
;NOP #4
;--------------------------------------------------------------------------------
;org $05F1BC ; <- 2F1BC - sprite_elder.asm : 194 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
;NOP #4
;--------------------------------------------------------------------------------
;org $05F1CE ; <- 2F1CE - sprite_elder.asm : 194 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
;NOP #4
;--------------------------------------------------------------------------------
;-- Old mountain man healing text
org $1EEAD7 ; F6AD7 sprite_old_mountain_man.asm : (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .didnt_speak)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
;--------------------------------------------------------------------------------
;-- Priest healing text
org $05DE11 ; 2DE11 sprite_uncle_and_priest.asm : 720 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .gamma)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
;--------------------------------------------------------------------------------
;-- zelda's heal text
org $05EE38 ; <- 2ee38 sprite_zelda.asm : 474 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
;--------------------------------------------------------------------------------
;-- zelda in jail
org $05ED06 ; <- 2ED06 sprite_zelda.asm : 227 - (JSL Sprite_ShowMessageUnconditional)
STZ $1CE8 : NOP
org $05ED27 ; <- 2ED27 sprite_zelda.asm : 256 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
org $05ED35 ; <- 2ED35 sprite_zelda.asm : 272 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------
;-- sanctuary
org $05DD83 ; <- 2DD83 sprite_uncle_and_priest.asm : 608 - (JSL Sprite_ShowMessageUnconditional)
STZ $1CE8 : NOP
org $05EDC8 ; <- 2EDC8 sprite_zelda.asm : 388 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
org $05DDAB ; <- 2DDAB sprite_uncle_and_priest.asm : 635 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------
;-- Sick Kid
org $06B9C6 ; <- 339C6 sprite_bug_net_kid.asm : 92 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------
;-- Hobo
org $06BE5F ; <- 33E5F sprite_hobo.asm : 121 - (JSL Sprite_ShowMessageUnconditional)
Nop #4
;----------------------------------------------------------
;-- Sahasrahla
org $05F190 ; <- 2F190 sprite_elder.asm : 154 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .dont_show_2) - "Blah blah blah, take the boots"
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
org $05F212 ; <- 2F212 sprite_elder.asm : 261 - (JSL Sprite_ShowMessageUnconditional) - "Gave you the boots but I'm not doing talking yet"
NOP #4
org $05F1ED ; <- 2F1ED sprite_elder.asm : 225 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Shopkeepers
org $1EEF7C ; <- F6F7C sprite_shopkeeper.asm : 85 (JSL Sprite_ShowMessageUnconditional)
NOP #4
org $1EF375 ; <- F7375 sprite_shopkeeper.asm : 810 (JSL Sprite_ShowMessageUnconditional : JSL ShopKeeper_RapidTerminateReceiveItem)
NOP #8
;----------------------------------------------------------
;-- Bomb shop guy (buying small bombs, and buying big bomb)
org $1EE1C0 ; <- F61C0 sprite_bomb_shop_entity.asm : 120 (JSL Sprite_ShowMessageUnconditional)
NOP #4
org $1EE208 ; <- F6208 sprite_bomb_shop_entity.asm : 178 (JSL Sprite_ShowMessageUnconditional)
NOP #4
;-- Text hook for the actual npc
org $1EE181 ; <- F6181 sprite_bomb_shop_entity.asm : 85 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Alt
;----------------------------------------------------------
;-- Catfish
org $1DE112 ; <- EE112 sprite_great_catfish.asm : 341 (JSL Sprite_ShowMessageMinimal)
NOP #4
;----------------------------------------------------
;-- King Zora
org $059A7D ; <- 29A7D sprite_zora_king.asm : 223 - (JSL Sprite_ShowMessageMinimal)
STZ $1CE8 : NOP
;----------------------------------------------------
;-- Before Agah 1 fight
org $1DD299 ; <- ED299 sprite_chatty_agahnim.asm : 111 (JSL Sprite_ShowMessageMinimal)
NOP #4
org $1DD35E ; <- ED35E sprite_chatty_agahnim.asm : 253 (JSL Sprite_ShowMessageMinimal)
NOP #4
;----------------------------------------------------
;-- Blind Maiden (in jail)
;org $1EE8CD ; <- F68CD sprite_blind_maiden.asm : 18 - (JSL Sprite_ShowMessageFromPlayerContact : BCC .didnt_speak)
;NOP #4
;----------------------------------------------------
;-- Blind (Maiden) in Jail
org $1EE8CD ; <- F68CD sprite_blind_maiden.asm : 18 - (JSL Sprite_ShowMessageFromPlayerContact : BCC .didnt_speak)
JSL Sprite_ShowMessageFromPlayerContact_Edit
;----------------------------------------------------
;-- Kiki
org $1EE3E6 ; <- F63E6 sprite_kiki.asm : 157 pay kiki 10 rupees
STZ $1CE8 : NOP
org $1EE400 ; <- F6400 sprite_kiki.asm : 178 thanks for giving kiki rupees
NOP #4
org $1EE4FB ; <- F64FB sprite_kiki.asm : 340 pay 100 rupees
STZ $1CE8 : NOP
org $1EE523 ; <- F6523 sprite_kiki.asm : 373 kiki will open door
NOP #4

org $1EE414 ; <- F6414 sprite_kiki.asm : 193 don't have 10 rupees
NOP #4
org $1EE50C ; <- F650C sprite_kiki.asm : 356 don't have 100 rupees
NOP #4
;----------------------------------------------------
;-- Witch
org $05E4FB ; <- 2E4FB sprite_witch.asm : 165 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
NOP #4
;----------------------------------------------------
;-- Breaking Ganon's Tower Seal
org $08CD3A ; <- 44D3A ancilla_break_tower_seal.asm : 55 (JSL Main_ShowTextMessage)
NOP #4
;----------------------------------------------------
;-- Bombos tablet
org $05F3BF ; <- 2F3BF sprite_medallion_tablet.asm : 254 (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------
;-- Ether tablet
org $05F429 ; <- 2F429 sprite_medallion_tablet.asm : 317 (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------
;-- Agahnim 1 Defeated
org $068475 ; <- 30475 Bank06.asm : 762 - (JSL Sprite_ShowMessageMinimal)
JSL.l AddInventory_incrementBossSwordLong
;NOP #4
;----------------------------------------------------
;-- Old Mountain Man Encounter Text
org $1EE9BC ; <- sprite_old_mountain_man.asm : 157 - (Sprite_ShowMessageFromPlayerContact)
JSL Sprite_ShowMessageFromPlayerContact_Edit

org $09A67D ; <- 4A67D tagalong.asm : 1152 (JSL OldMountainMan_TransitionFromTagalong)
JML OldMountainMan_TransitionFromTagalong_Edit
;----------------------------------------------------------
;-- Purple Chest Encounter Text
org $1EE0E7 ; <- F60E7 sprite_thief_chest.asm : 16 (JSL Sprite_ShowMessageFromPlayerContact : BCC .didnt_touch)
JSL Sprite_ShowMessageFromPlayerContact_Edit
;----------------------------------------------------------
;-- Middle aged man opens purple chest
org $06BD44 ; <- 33D44 sprite_middle_aged_man.asm : 107 (JSL Sprite_ShowMessageFromPlayerContact : BCC .return)
JSL Sprite_ShowMessageFromPlayerContact_Edit
;----------------------------------------------------------
;-- Smiths
;-- Ribbit
org $06B2AA ; <- 332AA sprite_smithy_bros.asm : 152 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit

;-- Ask us to do anything
org $06B418 ; <- 33418 sprite_smithy_bros.asm : 371 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .player_didnt_speak)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit

;-- Your sword is tempered!
org $06B538 ; <- 33538 sprite_smithy_bros.asm : 602 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .no_player_dialogue)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit

;-- Brought dwarf home
org $06B438 ; <- 33438 sprite_smithy_bros.asm : 399 (JSL Sprite_ShowMessageUnconditional)
NOP #4

;-- 10 rupees to temper
org $06B470 ; <- 33470 sprite_smithy_bros.asm : 447 (JSL Sprite_ShowMessageUnconditional)
NOP #4

;-- Yes, I'm sure
org $06B495 ; <- 33495 sprite_smithy_bros.asm : 479 (JSL Sprite_ShowMessageUnconditional)
NOP #4	

;-- We'll take your sword
org $06B4F3 ; <- 334F3 sprite_smithy_bros.asm : 556 (JSL Sprite_ShowMessageUnconditional)
JSL ItemSet_SmithSword
;NOP #4

;-- Smiths can't make your sword any stronger
org $06B4A1 ; <- 334A1 sprite_smithy_bros.asm : 491 - (Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Not enough magic text
org $07B0CC ; <- 3B0CC Bank07.asm : 7767 - (JSL Main_ShowTextMessage)
NOP #4
;----------------------------------------------------------
;-- Witch's Assistant
org $05F8F5 ; <- 2F8F5 sprite_potion_shop.asm : 620 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
;----------------------------------------------------------
;-- Bottle Vendor
org $05EAE3 ; <- 2EAE3 sprite_bottle_vendor.asm : 104 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .didnt_converse)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
org $05EB03 ; <- 2EB03 sprite_bottle_vendor.asm : 129 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Digging Game Guy
org $1DFC76 ; <- EFC76 sprite_digging_game_guy.asm : 46 (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .return)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
org $1DFCA6 ; <- EFCA6 sprite_digging_game_guy.asm : 89 (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Flute Boy
org $06B078 ; <- 33078 sprite_flute_boy.asm : 244 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC .didnt_speak)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
org $06B0AF ; <- 330AF sprite_flute_boy.asm : 308 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- 300 rupee npcs
org $1EF047 ; <- F7047 sprite_shopkeeper.asm : 227 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing) (probably)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
;----------------------------------------------------------
;-- Chest Game Guy
org $1EEFBF ; <- F6FBF sprite_shopkeeper.asm : 121 - (JSL Sprite_ShowSolicitedMessageIfPlayerFacing : BCC BRANCH_ALPHA)
JSL Sprite_ShowSolicitedMessageIfPlayerFacing_Edit
org $1EEFE0 ; <- F6FE0 sprite_shopkeeper.asm : 144 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Desert Palace plaque (opening desert with book)
org $1EE0D2 ; <- F60D2 Sprite_Hylian_Plaque.asm : 127 - (JSL Sprite_ShowMessageUnconditional)
NOP #4
;----------------------------------------------------------
;-- Uncle gives sword
org $05DF34 ; <- 2DF34 sprite_uncle_and_priest.asm : 961 - (JSL Sprite_ShowMessageFromPlayerContact : BCC .player_not_close_2)
JSL Sprite_ShowMessageFromPlayerContact_Edit
;----------------------------------------------------------

;===================================
;-- Escort Text
;-- dw coordinate, coordinate, flag, text message number, tagalong number
;===================================
org $09A4C2 ; <- 4A4C2 tagalong.asm : 967 - (.room_data_1)
dw $1EF0, $0288, $0001, $0097, $00F0 ; Old man first text after encounter text
dw $1E58, $02F0, $0002, $0098, $00F0 ; Old man "dead end" (when you run to the pot)
dw $1EA8, $03B8, $0004, $0099, $00F0 ; Old man "turn right here"
dw $0CF8, $025B, $0001, $001F, $00F0 ; Zelda "there's a secret passage"
dw $0CF8, $039D, $0002, $001F, $00F0 ; Zelda "there's a secret passage"
dw $0C78, $0238, $0004, $001F, $00F0 ; Zelda "there's a secret passage"
dw $0A30, $02F8, $0001, $0020, $00F0 ; Zelda "we can push this"
dw $0178, $0550, $0001, $0021, $00F0 ; Zelda "pull the lever"
dw $0168, $04F8, $0002, $0028, $00F0 ; Zelda room before sanctuary
dw $1BD8, $16FC, $0001, $0122, $00F0 ; Blind (maiden) "don't take me outside!"
dw $1520, $167C, $0001, $0122, $00F0 ; Blind (maiden) "don't take me outside!"
dw $05AC, $04FC, $0001, $0027, $00F0 ; Zelda in the water room
;----------------------------------------------------------
;----------------------------------------------------------
;-- Speed up Walls (Desert, Mire, and Palace of Darkness)
; org $01CA66 ; <- CA66 Bank01.asm : 10864 - (LDA.w #$2200 : ADD $041C : STA $041C)
; LDA.w #$4400 ; #$2200 is the normal speed, $#FF00 is max.
;----------------------------------------------------------
;-- Hobo gives item faster
; org $06BE3A ; <- 33E3A sprite_hobo.asm : 90 - (db 6, 2, 6, 6, 2, 100, 30)
; db 6, 2, 6, 6, 2, 6, 30
;----------------------------------------------------------
;-- Sick kid gives item faster
; org $06B9A1 ; <- 339A1 sprite_bug_net_kid : 62 - (db 8, 12, 8, 12, 8, 96, 16)
; db 8, 12, 8, 12, 8, 32, 16
;----------------------------------------------------------

;================================================================================
; Ganon Fixes
;--------------------------------------------------------------------------------
org $1D91E3 ; <- E91E3 - sprite_ganon.asm : 778
;JSL.l GanonWarpRNG
;NOP #2
LDA #$00 : NOP #4
;--------------------------------------------------------------------------------

;================================================================================
; Dark World Spawn Location Fix & Follower Fixes
;--------------------------------------------------------------------------------
org $00894A ; <- 94A
PHB : JSL.l DarkWorldSaveFix
;--------------------------------------------------------------------------------
org $0CCF05 ; <- 64F05
JSL.l DarkWorldLoadFix
NOP #7
;--------------------------------------------------------------------------------
org $09F520 ; <- 4F520 - module_death.asm : 401 (LDA $7EF3C5 : CMP.b #$03 : BCS BRANCH_THETA)
JSL.l SetDeathWorldChecked
JSL.l IncrementDeathCounter
NOP #6
;--------------------------------------------------------------------------------
;org $02D61A ; <- 1561A
;LDA.b #$01 : STA $1B ; fix something i wrote over i shouldn't have
;--------------------------------------------------------------------------------
org $1ED379 ; <- F5379 - sprite_agahnim.asm:75 - JSL PrepDungeonExit
JSL FixAgahnimFollowers
;================================================================================
 
;================================================================================
; Randomize NPC Items
;--------------------------------------------------------------------------------
org $028823 ; <- 10823 - Bank02.asm:1560 (LDA $7EF3C5 : BEQ .ignoreInput)
JSL.l AllowSQ
;--------------------------------------------------------------------------------
org $08C45F ; <- 4445F - ancilla_recieve_item.asm:157 (STZ $02E9)
JSL.l PostItemAnimation : NOP #2
;--------------------------------------------------------------------------------
org $1EE90A ; <- F690A
JSL.l ItemCheck_OldMan
NOP #2
;--------------------------------------------------------------------------------
org $0280F2 ; <- 100F2
JSL.l ItemCheck_OldMan
NOP #2
;--------------------------------------------------------------------------------
org $1EE9FE ; <- F69FE
JSL.l ItemSet_OldMan
;--------------------------------------------------------------------------------
org $068F16 ; <- 30F16
JSL.l ItemCheck_ZoraKing
;--------------------------------------------------------------------------------
org $059ACA ; <- 29ACA
JSL $1DE1AA ; Sprite_SpawnFlippersItem
;--------------------------------------------------------------------------------
org $1DE1E4 ; <- EE1E4 - sprite_great_catfish.asm : 489
JSL.l LoadZoraKingItemGFX
NOP #2
;--------------------------------------------------------------------------------
org $1DE1A1 ; <- EE1A1 - sprite_great_catfish.asm : 45
JSL.l LoadCatfishItemGFX
NOP #2
;--------------------------------------------------------------------------------
org $068D86 ; <- 30D86
JSL.l ItemCheck_SickKid
;--------------------------------------------------------------------------------
org $06B9D4 ; <- 339D4 - sprite_bug_net_kid.asm : 111 (JSL Link_ReceiveItem)
JSL.l ItemSet_SickKid
;--------------------------------------------------------------------------------
org $068BAC ; <- 30BAC - SpritePrep_FluteBoy : 1068
JSL.l ItemCheck_TreeKid2

org $06908D ; <- 3108D - SpritePrep_FluteBoy : 2175
JSL.l ItemCheck_TreeKid
CMP.b #$08
BEQ $0A

org $069095 ; <- 31095 - SpritePrep_FluteBoy : 2177
JSL.l ItemCheck_TreeKid
CMP.b #$08

org $0690BD ; <- 310BD - SpritePrep_FluteBoy : 2202
JSL.l ItemCheck_TreeKid2

org $06AF9B ; <- 32F9B - FluteBoy_Chillin : 73 : LDA $7EF34C : CMP.b #$02 : BCS .player_has_flute
;NOP #8
LDA !HAS_GROVE_ITEM : AND.b #$01
db #$D0 ; BNE

org $06B062 ; <- 33062 - FluteAardvark_InitialStateFromFluteState : 225 : LDA $7EF34C : AND.b #$03 : !BGE #$05
JSL.l ItemCheck_TreeKid2
NOP #$02 ; remove pointless AND

org $06B048 ; <- 33048
JSL.l ItemCheck_TreeKid3

org $06AF59 ; <- 32F59 - sprite_flute_boy.asm : 36 (LDA $0D80, X : CMP.b #$03 : BEQ .invisible)
JMP.l FluteBoy
FluteBoy_Abort:
RTS
FluteBoy_Continue:

;org $1E9968 ; <- F1968 - sprite_flute_boy_ostrich.asm : 14 (dw FluteBoyOstrich_Chillin)
;dw #$9991 ; FluteBoyOstrich_RunAway
;--------------------------------------------------------------------------------
org $06B0C9 ; <- 330C9
JSL.l ItemSet_TreeKid
;--------------------------------------------------------------------------------
org $05F177 ; <- 2F177
JSL.l ItemCheck_Sahasrala
;--------------------------------------------------------------------------------
org $05F200 ; <- 2F200
JSL.l ItemSet_Sahasrala
;--------------------------------------------------------------------------------
org $1DE102 ; <- EE102
JSL.l ItemCheck_Catfish
org $1DE11C ; <- EE11C
JSL.l ItemCheck_Catfish
;--------------------------------------------------------------------------------
org $1DE1A1 ; <- EE1A1 - sprite_great_catfish.asm : 445
JSL.l LoadCatfishItemGFX
NOP #2
;--------------------------------------------------------------------------------
org $1DDF81 ; <- EDF81 - sprite_great_catfish.asm : 61
JSL.l DrawThrownItem
;--------------------------------------------------------------------------------
org $05EE53 ; <- 2EE53 - mushroom.asm : 22
JSL.l ItemCheck_Mushroom
NOP #2
;--------------------------------------------------------------------------------
org $05EE8C ; <- 2EE8C - mushroom.asm : 69
JSL.l ItemSet_Mushroom
NOP
;--------------------------------------------------------------------------------
org $05F53E ; <- 2F53E - sprite_potion_shop.asm : 40
JSL.l ItemCheck_Powder
CMP.b #$20
;--------------------------------------------------------------------------------
; the quake medallion AND FLIPPERS
org $1DDF71 ; <- EDF71 - sprite_great_catfish.asm : 47
JSL.l MarkThrownItem
;--------------------------------------------------------------------------------
;org $05F65D ; <- 2F65D - DONE IN INVENTORY
;JSL.l ItemSet_Powder
;NOP #2
;--------------------------------------------------------------------------------
;JSL.l ItemCheck_RupeeNPC
;--------------------------------------------------------------------------------
;JSL.l ItemSet_RupeeNPC
;--------------------------------------------------------------------------------
;org $08D01B ; PC 0x4501B - ancilla_flute.asm - 55
;JSL.l ItemSet_Flute
;--------------------------------------------------------------------------------
org $05FAFF ; <- 2FAFF - sprite_mad_batter.asm:57 (LDA $7EF37B : CMP.b #$01 : BCS .magic_already_doubled)
JSL.l ItemCheck_MagicBat : BEQ + : RTS : NOP : +
;================================================================================


;================================================================================
; Boss Hearts
;--------------------------------------------------------------------------------
org $05EF5D ; <- 2EF5D - sprite_heart_upgrades.asm:110 (JSL GetAnimatedSpriteTile.variable)
JSL.l HeartContainerSpritePrep
;--------------------------------------------------------------------------------
org $05EF79 ; <- 2EF79 - sprite_heart_upgrades.asm:128 (JSL Sprite_PrepAndDrawSingleLargeLong)
JSL.l DrawHeartContainerGFX
;--------------------------------------------------------------------------------
org $05EFCE ; <- 2EFCE - sprite_heart_upgrades.asm:176 (JSL Link_ReceiveItem)
;org $05EFEE ; <- 2EFEE - sprite_heart_upgrades.asm:202 (JSL Link_ReceiveItem)
JSL.l HeartContainerGet
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
org $0799B1 ; 399B1 - Bank07.asm:4063 (CPY.b #$3E : BNE .notHeartContainer)
JSL.l HeartContainerSound
BCC Link_ReceiveItem_notHeartContainer
; JSR Player_DoSfx3
org $0799BA ; 399BA - Bank07.asm:4070 (LDA.b #$60 : STA $02D9)
Link_ReceiveItem_notHeartContainer:
;--------------------------------------------------------------------------------
org $09887F ; <- 4887F - ancilla_init.asm : 1163 (LDA $0C5E, X : CMP.b #$3E : BEQ .doneWithSoundEffects)
JSL NormalItemSkipSound
NOP
BCS AddReceivedItem_doneWithSoundEffects
org $0988AE ; <- 488AE - ancilla_init.asm : 1193 (LDA.b #$0A : STA $02)
AddReceivedItem_doneWithSoundEffects:
;================================================================================
; Heart Pieces
;--------------------------------------------------------------------------------
org $05F030 ; <- 2F030 - display item
JSL.l DrawHeartPieceGFX
;--------------------------------------------------------------------------------
org $05F08A ; <- 2F08A - sprite_heart_upgrades.asm : 324 - (LDA $7EF36B : INC A : AND.b #$03 : STA $7EF36B : BNE .got_4_piecese) item determination
JSL.l HeartPieceGet
BCS $18 ; reinsert the near branch that appears midway through what we overrode
NOP #22
;--------------------------------------------------------------------------------
org $06C0B0 ; <- 340B0 - sprite prep
JSL.l HeartPieceSpritePrep
;--------------------------------------------------------------------------------
org $08C45B ; <- 4445B - ancilla_receive_item.asm : 152
JSL.l HPItemReset
;--------------------------------------------------------------------------------
org $05EF1E ; <- 2EF1E - sprite_heart_upgrades.asm : 48 (LDA $7EF280, X : AND.b #$40 : BEQ .dont_self_terminate)
JSL.l HeartUpgradeSpawnDecision
;--------------------------------------------------------------------------------
org $05EFFA ; <- 2EFFA - sprite_heart_upgrades.asm : 216 (LDA $7EF280, X : ORA.b #$40 : STA $7EF280, X)
JSL.l SaveHeartCollectedStatus
NOP #6
;================================================================================

;================================================================================
; Fake Flippers Softlock Fix + General Damage Hooks
;--------------------------------------------------------------------------------
org $0780C6 ; <- 380C6 - Bank07.asm:174 (LDA $7EF36D)
JSL.l OnLinkDamaged
;--------------------------------------------------------------------------------
org $0794FB ; <- 394FB - Bank07.asm:3336 (LDA.b #$14 : STA $11)
JSL.l OnLinkDamagedFromPit
;--------------------------------------------------------------------------------
org $078F27 ; <- 38F27
JSL.l FlipperReset
;--------------------------------------------------------------------------------

;================================================================================
; Floodgate Softlock Fix
;--------------------------------------------------------------------------------
org $0AB8E5 ; <- 538E5
JSL.l FloodGateAndMasterSwordFollowerReset
JSL.l IncrementFlute
NOP #32
;--------------------------------------------------------------------------------
org $02AA87 ; <- 12A87
JSL.l OnOWTransition
NOP #36
;================================================================================

;================================================================================
; Heart Beep Timer
;--------------------------------------------------------------------------------
org $0DDC9B ; <- 6DC9B
JSL.l BeepLogic
NOP #6
;================================================================================

;================================================================================
; Item Downgrade Fix
;--------------------------------------------------------------------------------
org $09865E ; <- 4865E
JSL.l $1BEE1B ; fix something i wrote over i shouldn't have
;--------------------------------------------------------------------------------
org $098638 ; <- 48638 - ancilla_init.asm:737 - LDA .item_values, Y : BMI .dontWrite (BMI)
JSL.l ItemDowngradeFix
;================================================================================

;================================================================================
; Lamp Mantle & Light Cone Fix
;--------------------------------------------------------------------------------
org $1AFC4D ; <- D7C4D - sprite_movable_mantle.asm:31 (LDA $7EF3CC : CMP.b #$01 : BNE .return)
JSL.l CheckForZelda
;--------------------------------------------------------------------------------
org $1AFC55 ; <- D7C55 - sprite_movable_mantle.asm:34 (LDA $7EF34A : BEQ .return)
NOP #6 ; remove check
;--------------------------------------------------------------------------------
org $0DFA53 ; <- 6FA53 - hud check for lantern
JSL.l LampCheck
;--------------------------------------------------------------------------------
org $01F503 ; <- F503 - Bank01.asm:14994 (LDA.b #$01 : STA $1D)
JSL.l SetOverlayIfLamp
;================================================================================