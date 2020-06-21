#!/usr/bin/python

import fileinput
import re

def minify(text):
	arr = text.strip().split('"')
	for i, item in enumerate(arr):
		if not i % 2:
			arr[i] = re.sub("\s+", "", item).upper()
			if "'" in arr[i] or  "'" in arr[i]:
				del arr[i:]
	return '"'.join(arr)

def optimize(text):
	value = re.sub(r":?ELSE:?", "ELSE", text)
	value = re.sub(r":?THEN:?", "THEN", value)
	if len(value) > 0 and value[0] == ":":
		value = value[1:]
	if len(value) > 0 and value[-1] == ":":
		value = value[:-1]
	return value

lines = ""
linenum = 0
for line in fileinput.input():

	line = minify(line)
	if line.endswith("ENDIF"):
		line = line[:-5]
		if len(lines) > 0:
			if len(line) > 0 and line[0].isdigit():
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
