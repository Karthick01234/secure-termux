import os 
import time
from signal import signal, SIGINT
tgreen = '\033[32m'

def signal_handler(signal, frame):
  print("ctrl +c detected existing termux ...")
  time.sleep(3)
  os.system("killall -9 com.termux")

def run():
	print(" ")
	p = input("Enter your password : ")
	with open('pass.txt', 'r') as read_obj:
		for line in read_obj:
			file = open('pass.txt', 'r')
			data = file.read().strip()
			if p in line and len(p) == len(data):
				print(" ")
				print("Log In success")
				file = open('user.txt', 'r')
				os.system("termux-tts-speak welcome"+file.read())
			else:
				print("wrong password existing termux ...")
				time.sleep(3)
				os.system("killall -9 com.termux")
if __name__ == '__main__':
  signal(SIGINT, signal_handler)
  run()
