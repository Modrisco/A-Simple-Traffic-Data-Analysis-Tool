import os
import re
import sys
from tkinter import *

root = Tk()
root.title('Tool')
root.geometry('350x120+800+400')

text = Label(root, text = 'Welcome to use the network traffic data catcher!\nDo you want to start now?')
text.pack()

def on_click():
    test = Tk()
    test.title('Test')
    test.geometry('350x120+800+400')
    text = Label(test, text = 'Which kind of test do you want?')
    text.pack()
    basic = Button(test, text = 'Network Status Test', command = tool1)
    basic['width'] = 20
    basic['height'] = 2
    basic.pack()
    quit = Button(test, text = 'Local ISP test', command = tool2)
    quit['width'] = 20
    quit['height'] = 2
    quit.pack()

start = Button(root, text = 'START', command = on_click)
start['width'] = 6
start['height'] = 2
start.place(x=100, y=60)
quit = Button(root, text = 'EXIT', fg = 'red', command = quit)
quit['width'] = 6
quit['height'] = 2
quit.place(x=200, y=60)

def tool1():
    os.system('Tool1.bat')
    os.system('dataprocess1.pyw')
    os.system('histogram1.plt')
    os.remove('time.txt')
    os.remove('time_nospace.txt')
    os.remove('log.txt')
def tool2():
    os.system('Tool2.bat')
    os.system('dataprocess2.pyw')
    os.system('histogram2.plt')
    os.remove('time.txt')
    os.remove('time_nospace.txt')
    os.remove('log.txt')

root.mainloop()