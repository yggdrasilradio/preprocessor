
	' Reset machine on BREAK
	pclear 1
	on brk goto 1000

	' Disable cursor
	include "disable.bas"

	rem this is a useless remark

	' Set up video mode and palette colors
	rgb
	width 80
	palette 0, 0		' background color
	for i = 8 to 15
		read c
		palette i, c	' 8 foreground colors
	next i

	' Palette color values:
	' yellow, red, green, blue, orange, cyan, magenta, white
	data 54, 36, 18, 11, 38, 25, 45, 63

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
		if rnd(0) < .5 then
			print "Color ";
		else
			print "Colour ";
		end if 
		print a$(i)
	next i

	' Display joystick values until BREAK is hit
	locate 0, 19
	print "Joystick X  Joystick Y";
	attr 2, 0
	ox = -1
	oy = -1
	while 1 then
		x = joystk(0)
		y = joystk(1)
		if ox <> x or oy <> y then
			locate 4, 20
			print using "##          ##"; x; y;
		end if
		ox = x
		oy = y
	end while

	' Reset the machine
1000	poke &H71, 0
	exec &H8C1B
