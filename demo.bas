
	' Reset machine on BREAK
	on brk goto 1000

	' Set up video mode
	rgb
	width 40

	' Cycle through background colors
10	b = 0
	for b = 0 to 7

		' Set background color
		cls b

		' Set foreground colorrs
		for i = 0 to 7
			attr i, b
			locate 1, i * 2
			print "Color ";
			print b
		next i

		' Wait for any key
20		if inkey$ = "" then goto 20 end if

	next b

	' Loop until BREAK is hit
	goto 10

	' Reset the machine
1000	poke &H71, 0
	exec &H8c1b
