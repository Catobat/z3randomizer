; A is the new dungeon ID
ChangeDungeon:
STA $040C
LSR
TAX
LDA $7EF37C,X
STA $7EF36F ; update key count
; TODO: clear compass/map counts
; TODO: tileset
; TODO: music
; $046D-$046F: free RAM
RTS