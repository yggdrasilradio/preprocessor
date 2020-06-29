all: demo

demo: demo.bas
	decbpp < demo.bas > /tmp/demo.bas
	decb copy -tr /tmp/demo.bas /media/share1/COCO/drive0.dsk,DEMO.BAS
	cat /tmp/demo.bas
	rm -f /tmp/demo.bas

run:
	mame coco2b -flop1 /media/share1/COCO/drive0.dsk -ramsize 512k -ui_active -skip_gameinfo -autoboot_delay 1 -autoboot_command 'LOAD"DEMO.BAS":RUN\n'
