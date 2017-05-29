import re
import xlwt
import os
import sys
#wb = xlwt.Workbook()
#ws = wb.add_sheet('DNS or IP Address')
text=open('result2.txt').read()
f = open('log.txt','w')
for subtext in re.findall(r"(?<=已接收).*?(?=% 丢失)",text,re.DOTALL):
    print(subtext,file= f)
#for subtext in re.findall(r"(?<=Packets).*?(?=% loss)",text,re.DOTALL):
    #print(subtext)
f.close()

f1 = open('log.txt')
f2 = open('LocalResult.csv','w')
for s in f1.readlines():
	a = len(f1.readlines())
	f2.write(s.replace('已发送','').replace('已接收','').replace('丢失','').replace('=','').replace(':','').replace('(',',').replace('，',','))
	#	f2.write(s.replace('Sent','').replace('Received','').replace('Lost','').replace('=','').replace(':','').replace('(',','))
#a = len(f1.readlines())
#for i in range(1,a + 1):
    #print (i)
    #i = i+1
    #for k in f1.readlines():
    	#f2.write(k.replace(':'),(i))
f1.close()
f2.close()
#if os.path.exists(r'c:/users/meng/desktop/log.txt) :os.remove(r'c:/users/meng/desktop/log.txt)

text=open('result2.txt').read()
f = open('time.txt','w')
for subtext in re.findall(r"(?<=    最短).*?(?=======================================================================)",text,re.DOTALL):
#for subtext in re.findall(r"(?<=    Minimum).*?(?=======================================================================)",text,re.DOTALL):    
    print(subtext,file= f)

f.close()

f2 = open('time_nospace.txt','w')
with open('time.txt') as f1:
	for line in f1:
		if not line.isspace():
			f2.write(line)
f1.close()
f2.close()

f3 = open('time_nospace.txt')
f4 = open('LocalTime.csv','w')
for s in f3.readlines():
	a = len(f3.readlines())
	f4.write(s.replace('ms','').replace('最长','').replace('平均','').replace('=','').replace('，',','))
	#f4.write(s.replace('ms','').replace('Maximum','').replace('Average','').replace('=',''))
#a = len(f1.readlines())
#for i in range(1,a + 1):
    #print (i)
    #i = i+1
    #for k in f1.readlines():
    	#f2.write(k.replace(':'),(i))
f3.close()
f4.close()
#if os.path.exists(r'c:/users/meng/desktop/log.txt) :os.remove(r'c:/users/meng/desktop/log.txt)