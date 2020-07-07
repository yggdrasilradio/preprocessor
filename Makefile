all: demo

demo: demo.bas
	cp decbpp /usr/local/bin
	decbpp < demo.bas > /tmp/demo.bas
	decb copy -tr /tmp/demo.bas /media/share1/COCO/drive0.dsk,DEMO.BAS
	cat /tmp/demo.bas
	rm -f /tmp/demo.bas
