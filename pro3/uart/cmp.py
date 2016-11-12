# import os
f1 = open('chuankou.ucf').read().lower().split('\n')
f2 = open('uart.ucf').read().lower().split('\n')
for l in f2:
    if l not in f1:
        print l
    else:
        print 'nothing different'
for l in f1:
    if l not in f2:
        print l
    else:
        print 'nothing differend either'
