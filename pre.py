#!/usr/bin/python

import fileinput
import re

def minify(text):
	arr = text.strip().split('"')
	for i, item in enumerate(arr):
		if not i % 2:
			arr[i] = re.sub("\s+", "", item).upper()
			arr[i] = arr[i].split("'")[0]
			arr[i] = arr[i].split("REM")[0].strip()
	return '"'.join(arr)

def optimize(text):
	value = re.sub(r":?ELSE:?", "ELSE", text)
	value = re.sub(r":?THEN:?", "THEN", value)
	return value if value[0] != ":" else value[1:]

lines = ""
linenum = 0
for line in fileinput.input():

	line = minify(line)
	if line.endswith("ENDIF"):
		line = line[:-5]
		if len(lines) > 0:
			if line[0].isdigit():
				linenum = int(re.findall(r'^\D*(\d+)', line)[0])
				print optimize(lines)
				print optimize(line)
			else:
				print optimize(lines + ":" + line)
		lines = ""
	elif len(line) > 0:
		if line[0].isdigit():
			linenum = int(re.findall(r'^\D*(\d+)', line)[0])
			if len(lines) > 0:
				print optimize(lines)
			lines = line
		else:
			if len(lines) == 0:
				linenum = linenum + 1
				lines = str(linenum) + line
			else:
				lines = lines + ":" + line

if len(lines) > 0:
	print optimize(lines)
