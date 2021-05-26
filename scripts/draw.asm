

;//-----------;//
;// Draw Tile ;//
;//-----------;//


;// draw an 8x8 tile from a data pointer
;// r1 = color 1
;// r2 = color 2
;// r3 = x (to screen)
;// r4 = y (to screen)
;// r5 = tile number
DrawTile:
	;// registers reference:
	;// r1 = reserved (plot color)
	;// r2 = reserved (plot x)
	;// r3 = reserved (plot y)
	;// r4 = color 1
	;// r5 = color 2
	;// r6 = x
	;// r7 = y
	;// r8 = loop1 (row)
	;// r9 = loop2 (column)
	;// r10 = bitmask
	;// r11 = graphics byte

	;// save the return address
	;//lr	K, P
	;//pi	pushk

	;// get the tile address
	dci	tiles
	;// add the offset
	lr	A, 5
	inc							;// make sure we hit 0
	lr	0, A
	lis	2						;// three bytes for each tile
.drawTileAddressLoop:
	ds	0
	bz	.drawTileAddressLoopEnd
	adc
	br	.drawTileAddressLoop
.drawTileAddressLoopEnd:
	;// got the tile data, now get the graphics address
	lm
	lr	Qu, A
	lm
	lr	Ql, A
	lr	DC, Q

	;// Get the colour of the char

	;// load the width and height
	li	13
	lr	5, A
	li 	13
	lr	6, A

.drawTileBlit:
	;// draw the tile itself
	jmp	blit



DrawChar:
	;// registers reference:
	;// r1 = reserved (plot color)
	;// r2 = reserved (plot x)
	;// r3 = reserved (plot y)
	;// r4 = color 1
	;// r5 = color 2
	;// r6 = x
	;// r7 = y
	;// r8 = loop1 (row)
	;// r9 = loop2 (column)
	;// r10 = bitmask
	;// r11 = graphics byte

	;// save the return address
	;//lr	K, P
	;//pi	pushk

	;// get the tile address
	dci	chars
	;// add the offset
	lr	A, 5
	inc							;// make sure we hit 0
	lr	0, A
	lis	2						;// three bytes for each tile
.drawCharAddressLoop:
	ds	0
	bz	.drawCharAddressLoopEnd
	adc
	br	.drawCharAddressLoop
.drawCharAddressLoopEnd:
	;// got the tile data, now get the graphics address
	lm
	lr	Qu, A
	lm
	lr	Ql, A
	lr	DC, Q

	;// Get the colour of the char

	;// load the width and height
	li	5
	lr	5, A
	li 	5
	lr	6, A

.drawCharBlit:
	;// draw the tile itself
	jmp	blit




	





;---------------------------------------------------------------------------

gfx.threes.bmp.parameters:
		.byte	Red		; color 1 (clear/bkg/blue/red/green)
		.byte	Transparent		; color 2 (clear/bkg/blue/red/green)
		.byte	11			; x position
		.byte	0			; y position
		.byte	80			; width
		.byte	58			; height
		.word	gfx.threes.bmp.data

gfx.threes.bmp.data:
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11110110, %00101110
		.byte	%11001000, %10010001, %11001000, %10010111, %11111111, %11111111, %11111111
		.byte	%11111111, %11101010, %10101101, %01011010, %10111011, %11101010, %11010111
		.byte	%11111111, %11111111, %11111111, %11111111, %11100010, %01101100, %01001010
		.byte	%10011011, %11001010, %10010111, %11111111, %11111111, %11111111, %11111111
		.byte	%11101010, %10101101, %01101010, %10111011, %11011010, %10110111, %11111111
		.byte	%11111111, %11111111, %11111111, %11101010, %10100101, %01001000, %10111011
		.byte	%11001000, %10010111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111100, %00000011, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11110011, %11111101, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11001111
		.byte	%11111110, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11110000, %00011111, %11111111, %01111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %10000111, %11111100, %00011111
		.byte	%01111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11000110
		.byte	%00111111, %11111000, %00000111, %01111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111000, %00110000, %11111110, %01110000, %11000110, %01111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11110011, %11111111, %11100000
		.byte	%01100011, %11111110, %11111111, %11111111, %11111111, %11111111, %11110000
		.byte	%11000111, %11111111, %00000000, %01100011, %11111110, %11111111, %11111111
		.byte	%11111111, %11111111, %00000110, %00011111, %11110110, %00000111, %11100000
		.byte	%00001110, %01111111, %11111111, %11111111, %11111110, %01111111, %11111111
		.byte	%00000110, %00111111, %11100000, %00000111, %01111111, %11111111, %11111111
		.byte	%11111101, %11111111, %11110000, %00000110, %00111111, %01110000, %00000011
		.byte	%01111111, %11111111, %11111111, %11111001, %11111111, %11100000, %00111110
		.byte	%00111000, %01111111, %11100011, %10111111, %11111111, %11111111, %10010011
		.byte	%11111000, %11100011, %11111110, %00000000, %01111111, %11100011, %10111111
		.byte	%11111111, %11110000, %01001111, %10000000, %01100011, %11111110, %00000011
		.byte	%11100111, %11000111, %10111111, %11111111, %10001011, %11111100, %00000000
		.byte	%01100011, %10000110, %00111111, %11100011, %10000111, %10111111, %11111111
		.byte	%00111111, %11111100, %00011100, %01100000, %00000110, %00111111, %11100000
		.byte	%00001111, %10111111, %11111111, %01111100, %00011100, %01111100, %01100000
		.byte	%00011110, %00111111, %00110000, %00111111, %01111111, %11111111, %01111000
		.byte	%00001100, %01111100, %01100001, %11111110, %00111000, %00111111, %11111111
		.byte	%01111111, %11111110, %01110001, %10001100, %01110000, %11100011, %11111110
		.byte	%00000000, %00111111, %11111110, %11111111, %11111110, %11110011, %10001100
		.byte	%00000001, %11100011, %11111010, %00000011, %11111111, %10000001, %11111111
		.byte	%11111110, %11100111, %10011100, %00000001, %11100011, %10000010, %00111111
		.byte	%11100000, %01111111, %11111111, %11111110, %01111110, %00111100, %01100000
		.byte	%11100000, %00000011, %11111111, %10011111, %11111111, %11111111, %11111111
		.byte	%00111110, %00001100, %01110000, %01100000, %00011111, %11111000, %01111111
		.byte	%11111111, %11111111, %11111111, %10011111, %10001100, %01111000, %00100001
		.byte	%11111111, %11000111, %11111111, %11111111, %11111111, %11111111, %10011111
		.byte	%11000100, %01111100, %00111111, %11110000, %00011111, %11111111, %11111111
		.byte	%11111111, %11111111, %00111111, %11001100, %01111110, %11111111, %11001111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %01111011, %10001100
		.byte	%01110111, %11111110, %00011111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %01110001, %00011100, %11100011, %10000000, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %01110000, %00011111, %11101100
		.byte	%01111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%01111000, %01111111, %11101111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %01111111, %11110000, %00001111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %00111111
		.byte	%11100111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %10011111, %11011111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111000, %00000000, %00000000
		.byte	%11111100, %00000000, %00000000, %00111110, %00000000, %00000000, %00011111
		.byte	%11111011, %11111111, %11111110, %11111101, %11111111, %11111111, %10111110
		.byte	%11111111, %11111111, %11011111, %11111010, %11100010, %00100010, %11111101
		.byte	%00011011, %00011000, %10111110, %10011000, %10101011, %01011111, %11111010
		.byte	%11101110, %11110110, %11111101, %01111011, %01101011, %10111110, %10101010
		.byte	%10101001, %01011111, %11111010, %11100110, %01110110, %11111101, %00011011
		.byte	%00011000, %10111110, %10101010, %10001010, %01011111, %11111010, %11101110
		.byte	%11110110, %11111101, %01111011, %01101011, %10111110, %10101010, %10001011
		.byte	%01011111, %11111010, %00100010, %11110110, %11111101, %01111011, %01101000
		.byte	%10111110, %10011000, %10101011, %01011111, %11111011, %11111111, %11111110
		.byte	%11111101, %11111111, %11111111, %10111110, %11111111, %11111111, %11011111
		.byte	%11111010, %00011000, %11000110, %11111101, %11111111, %11111111, %10111110
		.byte	%11111111, %11111111, %11011111, %11111011, %11010111, %10111010, %11111101
		.byte	%01110001, %01101000, %10111110, %10001101, %10101100, %01011111, %11111011
		.byte	%11010001, %11000110, %11111101, %01110101, %00101011, %10111110, %11011101
		.byte	%10001101, %11011111, %11111011, %10110110, %10111010, %11111101, %01110101
		.byte	%01001010, %10111110, %11011101, %10101100, %11011111, %11111011, %01110110
		.byte	%10111010, %11111101, %01110101, %01101010, %10111110, %11011101, %10101101
		.byte	%11011111, %11111011, %01111001, %11000110, %11111101, %00010001, %01101000
		.byte	%10111110, %11011101, %10101100, %01011111, %11111011, %11111111, %11111110
		.byte	%11111101, %11111111, %11111111, %10111110, %11111111, %11111111, %11011111
		.byte	%11111000, %00000000, %00000000, %11111100, %00000000, %00000000, %00111110
		.byte	%00000000, %00000000, %00011111, %11111111, %11111111, %11111111, %11111111
		.byte	%11111111, %11111111, %11111111, %11111111, %11111111, %11111111