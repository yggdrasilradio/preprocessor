" Vim syntax file
" Tandy Color Computer Disk Extended Color Basic
" Rick Adams

let s:cpo_save = &cpo
set cpo&vim
set iskeyword=a-z,A-Z,48-57,\$ 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" BASIC keywords
syn keyword basicStatement attr Attr ATTR
syn keyword basicStatement audio Audio AUDIO
syn keyword basicStatement backup Backup BACKUP
syn keyword basicStatement brk Brk BRK
syn keyword basicStatement circle Circle CIRCLE
syn keyword basicStatement clear Clear CLEAR
syn keyword basicStatement cload Cload CLOAD
syn keyword basicStatement close Close CLOSE
syn keyword basicStatement cls Cls CLS
syn keyword basicStatement cmp Cmp CMP
syn keyword basicStatement color Color COLOR
syn keyword basicStatement cont Cont CONT
syn keyword basicStatement copy Copy COPY
syn keyword basicStatement csave Csave CSAVE
syn keyword basicStatement data Data DATA
syn keyword basicStatement def Def DEF
syn keyword basicStatement del Del DEL
syn keyword basicStatement dim Dim DIM
syn keyword basicStatement dir Dir DIR
syn keyword basicStatement dload Dload DLOAD
syn keyword basicStatement dos Dos DOS
syn keyword basicStatement draw Draw DRAW
syn keyword basicStatement drive Drive DRIVE
syn keyword basicStatement dski$ Dski$ DSKI$
syn keyword basicStatement dskini Dskini DSKINI
syn keyword basicStatement dsko$ Dsko$ DSKO$
syn keyword basicStatement edit Edit EDIT
syn keyword basicStatement end End END
syn keyword basicStatement err Err ERR
syn keyword basicStatement exec Exec EXEC
syn keyword basicStatement exp Exp EXP
syn keyword basicStatement field Field FIELD
syn keyword basicStatement files Files FILES
syn keyword basicStatement for For FOR
syn keyword basicStatement get Get GET
syn keyword basicStatement go Go GO
syn keyword basicStatement gosub Gosub GOSUB
syn keyword basicStatement goto Goto GOTO
syn keyword basicStatement hbuff Hbuff HBUFF
syn keyword basicStatement hcircle Hcircle HCIRCLE
syn keyword basicStatement hcls Hcls HCLS
syn keyword basicStatement hcolor Hcolor HCOLOR
syn keyword basicStatement hdraw Hdraw HDRAW
syn keyword basicStatement hget Hget HGET
syn keyword basicStatement hline Hline HLINE
syn keyword basicStatement hpaint Hpaint HPAINT
syn keyword basicStatement hprint Hprint HPRINT
syn keyword basicStatement hput Hput HPUT
syn keyword basicStatement hreset Hreset HRESET
syn keyword basicStatement hscreen Hscreen HSCREEN
syn keyword basicStatement hset Hset HSET
syn keyword basicStatement hstat Hstat HSTAT
syn keyword basicStatement if If IF
syn keyword basicStatement input Input INPUT
syn keyword basicStatement kill Kill KILL
syn keyword basicStatement let Let LET
syn keyword basicStatement line Line LINE
syn keyword basicStatement list List LIST
syn keyword basicStatement llist Llist LLIST
syn keyword basicStatement load Load LOAD
syn keyword basicStatement locate Locate LOCATE
syn keyword basicStatement lpoke Lpoke LPOKE
syn keyword basicStatement lset Lset LSET
syn keyword basicStatement merge Merge MERGE
syn keyword basicStatement motor Motor MOTOR
syn keyword basicStatement new New NEW
syn keyword basicStatement next Next NEXT
syn keyword basicStatement not Not NOT
syn keyword basicStatement off Off OFF
syn keyword basicStatement on On ON
syn keyword basicStatement open Open OPEN
syn keyword basicStatement paint Paint PAINT
syn keyword basicStatement palette Palette PALETTE
syn keyword basicStatement pclear Pclear PCLEAR
syn keyword basicStatement pcls Pcls PCLS
syn keyword basicStatement pcopy Pcopy PCOPY
syn keyword basicStatement play Play PLAY
syn keyword basicStatement pmode Pmode PMODE
syn keyword basicStatement poke Poke POKE
syn keyword basicStatement preset Preset PRESET
syn keyword basicStatement print Print PRINT
syn keyword basicStatement pset Pset PSET
syn keyword basicStatement put Put PUT
syn keyword basicStatement read Read READ
syn keyword basicStatement rename Rename RENAME
syn keyword basicStatement renum Renum RENUM
syn keyword basicStatement reset Reset RESET
syn keyword basicStatement restore Restore RESTORE
syn keyword basicStatement return Return RETURN
syn keyword basicStatement rgb Rgb RGB
syn keyword basicStatement rset Rset RSET
syn keyword basicStatement run Run RUN
syn keyword basicStatement save Save SAVE
syn keyword basicStatement screen Screen SCREEN
syn keyword basicStatement set Set SET
syn keyword basicStatement skipf Skipf SKIPF
syn keyword basicStatement sound Sound SOUND
syn keyword basicStatement step Step STEP
syn keyword basicStatement stop Stop STOP
syn keyword basicStatement then Then THEN
syn keyword basicStatement to To TO
syn keyword basicStatement troff Troff TROFF
syn keyword basicStatement tron Tron TRON
syn keyword basicStatement unload Unload UNLOAD
syn keyword basicStatement verify Verify VERIFY
syn keyword basicStatement width Width WIDTH
syn keyword basicStatement write Write WRITE

" BASIC functions
syn keyword basicFunction abs Abs ABS
syn keyword basicFunction asc Asc ASC
syn keyword basicFunction atn Atn ATN
syn keyword basicFunction button Button BUTTON
syn keyword basicFunction chr$ Chr$ CHR$
syn keyword basicFunction cos Cos COS
syn keyword basicFunction cvn Cvn CVN
syn keyword basicFunction eof Eof EOF
syn keyword basicFunction erlin Erlin ERLIN
syn keyword basicFunction errno Errno ERRNO
syn keyword basicFunction exp Exp EXP
syn keyword basicFunction fix Fix FIX
syn keyword basicFunction free Free FREE
syn keyword basicFunction hex$ Hex$ HEX\$
syn keyword basicFunction hpoint Hpoint HPOINT
syn keyword basicFunction inkey$ Inkey$ INKEY$
syn keyword basicFunction instr Instr INSTR
syn keyword basicFunction int Int INT
syn keyword basicFunction joystk Joystk JOYSTK
syn keyword basicFunction left$ Left$ LEFT$
syn keyword basicFunction len Len LEN
syn keyword basicFunction loc Loc LOC
syn keyword basicFunction lof Lof LOF
syn keyword basicFunction log Log LOG
syn keyword basicFunction lpeek Lpeek LPEEK
syn keyword basicFunction mem Mem MEM
syn keyword basicFunction mid$ Mid$ MID$
syn keyword basicFunction mkn$ Mkn$ MKN$
syn keyword basicFunction peek Peek PEEK
syn keyword basicFunction point Point POINT
syn keyword basicFunction pos Pos POS
syn keyword basicFunction ppoint Ppoint PPOINT
syn keyword basicFunction right$ Right$ RIGHT$
syn keyword basicFunction rnd Rnd RND
syn keyword basicFunction sgn Sgn SGN
syn keyword basicFunction sin Sin SIN
syn keyword basicFunction sqr Sqr SQR
syn keyword basicFunction str$ Str$ STR$
syn keyword basicFunction string String STRING
syn keyword basicFunction tab Tab TAB
syn keyword basicFunction tan Tan TAN
syn keyword basicFunction timer Timer TIMER
syn keyword basicFunction usr Usr USR
syn keyword basicFunction val Val VAL
syn keyword basicFunction varptr Varptr VARPTR

syn keyword basicTodo contained	TODO

" Integer number, or floating point number without a dot.
syn match  basicNumber		"\<\d\+\>"
" Floating point number, with dot
syn match  basicNumber		"\<\d\+\.\d*\>"
" Floating point number, starting with a dot
syn match  basicNumber		"\.\d\+\>"

" String and Character contstants
syn match   basicSpecial contained "\\\d\d\d\|\\."
syn region  basicString		  start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=basicSpecial

syn region  basicComment	start="REM" end="$" contains=basicTodo
syn region  basicComment	start="rem" end="$" contains=basicTodo
syn region  basicComment	start="Rem" end="$" contains=basicTodo
syn region  basicComment	start="^[ \t]*'" end="$" contains=basicTodo
syn region  basicComment	start="'" end="$" contains=basicTodo
syn region  basicLineNumber	start="^\d" end="\s"
syn match   basicTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1
" Used with OPEN statement
syn match   basicFilenumber  "#\d\+"
syn match   basicMathsOperator   "-\|=\|[:<>+\*^/\\]\|AND\|OR"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_basic_syntax_inits")

  if version < 508
    let did_basic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink basicLabel		Label
  HiLink basicConditional	Conditional
  HiLink basicRepeat		Repeat
  HiLink basicLineNumber	Comment
  HiLink basicNumber		Number
  HiLink basicError		Error
  HiLink basicStatement		Statement
  HiLink basicString		String
  HiLink basicComment		Comment
  HiLink basicSpecial		Special
  HiLink basicTodo		Todo
  HiLink basicFunction		Identifier
  HiLink basicTypeSpecifier	Type
  HiLink basicFilenumber	basicTypeSpecifier

  delcommand HiLink

endif

let b:current_syntax = "basic"

let &cpo = s:cpo_save
unlet s:cpo_save
