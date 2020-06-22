
	' Reset machine on BREAK
	on brk goto 1000

	' Set up video mode
	rgb
	width 80

	' Set up palette colors
	palette 0, 0
	for i = 8 to 15
		read c
		palette i, c
	next i

	' Clear screen
	cls 1

	' Display text in different colors
	for i = 0 to 7
		attr i, 0
		for j = 0 to 255
			print chr$(j);
		next j
	next i

	' Loop until BREAK is hit
10	goto 10

	' Reset the machine
1000	poke &H71, 0
	exec &H8c1b

	' Palette color values:
	' yellow, red, green, blue, orange, cyan, magenta, white
	data 55,37,16,11,38,25,47,63
