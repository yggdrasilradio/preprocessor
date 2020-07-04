
	' Set up video mode and palette colors
	pclear 1
	rgb
	width 80
	palette 0, 0
	for i = 8 to 15
		read c
		palette i, c
	next i

	' Palette color values:
	' yellow, red, green, blue, orange, cyan, magenta, white
	data 54,36,18,11,38,25,45,63

	' Reset machine on BREAK
	on brk goto 1000

	' Set up text items
	dim a$(8)
	for i = 0 to 7
		read a$(i)
	next i

	' Text items
	data "Yellow", "Red", "Green", "Blue"
	data "Orange", "Cyan", "Magenta", "White"

	' Display text in different colors
	cls 1
	for i = 0 to 7
		locate 0, i * 2
		attr i, 0
		print a$(i);
	next i

	' Display joystick values until BREAK is hit
	locate 0,19
	print "Joystick X  Joystick Y";
	attr 2, 0
10	x = joystk(0)
	y = joystk(1)
	locate 3, 20
	print x;
	locate 15, 20
	print y;
	goto 10

	' Reset the machine
1000	poke &H71, 0
	exec &H8c1b
