import re
import xlwt
import os
#wb = xlwt.Workbook()
#ws = wb.add_sheet('DNS or IP Address')
text=open('test.txt').read()
f = open('log.txt','w')
for subtext in re.findall(r"(?<=Packets).*?(?=% loss)",text,re.DOTALL):
    print(subtext,file= f)
#for subtext in re.findall(r"(?<=正在).*?(?=% 的数据)",text,re.DOTALL):
    #print(subtext)
f.close()

f1 = open('log.txt')
f2 = open('result.csv','w')
for s in f1.readlines():
	a = len(f1.readlines())
	f2.write(s.replace('Sent','').replace('Received','').replace('Lost','').replace('=','').replace(':','').replace('(',','))
#a = len(f1.readlines())
#for i in range(1,a + 1):
    #print (i)
    #i = i+1
    #for k in f1.readlines():
    	#f2.write(k.replace(':'),(i))
f1.close()
f2.close()
#if os.path.exists(r'c:/users/meng/desktop/log.txt) :os.remove(r'c:/users/meng/desktop/log.txt)