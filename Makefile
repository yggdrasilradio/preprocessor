all: demo

demo: demo.bas
	cp decbpp /usr/local/bin
	cp basic.vim ~/.vim/basic.vim
	decbpp < demo.bas > /tmp/demo.bas
ifneq ("$(wildcard /media/share1/COCO/drive0.dsk)", "")
	decb copy -tr /tmp/demo.bas /media/share1/COCO/drive0.dsk,DEMO.BAS
endif
	cat /tmp/demo.bas
	rm -f /tmp/demo.bas
