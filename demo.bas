
	' Reset machine on BREAK
	on brk goto 1000

	' Set up video mode
	rgb
	cls 0

	' Draw some text
	print @32 + 16 - 2, "test";

	' Draw some random-colored pixels
10	for i = 0 to 31
		if rnd(0) > .5 then
			set(i, i, 5)
		else
			set(i, i, 7)
		end if
	next i

	goto 10

	' Reset the machine
1000	poke &H71, 0
	exec &H8c1b
