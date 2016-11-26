inn = open("in.txt","r")
lines = inn.readlines()
charno = 0;
cnt = -1
print "constant Char_a : STD_LOGIC_VECTOR(127 downto 0) :="
for line in lines:
	if len(line.strip()) < 2:
		continue
	cnt = cnt + 1
	string = 'a'
	if cnt == 16:
		cnt = 0
		cur = chr(98 + charno)
		print "constant Char_" + cur + " : STD_LOGIC_VECTOR(127 downto 0) :="
		charno = charno + 1
	line = line[:-1]
	line = line.replace(" ","")
	if cnt == 15:
		print "\"" + line + "\";"
	else:
		print "\"" + line + "\" & "

print ""
for i in range(26):
	cur = chr(97 + i)
	print str(i+1) + "=> Char_" + cur + ","
	