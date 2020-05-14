import os
import speech_recognition as sr
import time
from signal import signal, SIGINT
tgreen = '\033[32m'

def signal_handler(signal, frame):
  print("ctrl +c detected existing termux ...")
  time.sleep(3)
  os.system("rm gee.mp3")
  os.system("rm kar.wav")
  os.system("killall -9 com.termux")

def run():
	print(" ")
	print(tgreen + " Tell your password...")
	print(" ")
	os.system("termux-microphone-record -f gee.mp3 -l 3")
	time.sleep(4)
	os.system("ffmpeg -i gee.mp3 kar.wav")
	os.system("rm gee.mp3")
	r = sr.Recognizer()
	with sr.AudioFile('kar.wav') as source:
		audio = r.record(source)
   
	try: 
		password = r.recognize_google(audio)
		os.system("rm kar.wav")
		with open('pass.txt', 'r') as read_obj:
			for line in read_obj:
				if password in line:
					print(" ")
					print("Log In success")
					file = open('user.txt', 'r')
					os.system("termux-tts-speak welcome"+file.read())
				else:
					print("wrong password existing termux ...")
					time.sleep(3)
					os.system("killall -9 com.termux")
   
	except IndexError:
		print(" ")
		print( tgreen + "No internet connection")
	except KeyError:
		print(" ")
		print( tgreen + "Invalid api key")
	except LookupError:
		print(" ")
		print( tgreen + "Couldn't understand your voice")  
	except sr.UnknownValueError:
		print(" ")
		os.system("rm kar.wav")
		print("Didn't recognize your voice ")

if __name__ == '__main__':
  signal(SIGINT, signal_handler)
  run()
