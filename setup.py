import os 
import speech_recognition as sr
import time
tgreen = '\033[32m'
def run():
  print(" ")
  print( tgreen + "your password will not be more than three words ...")
  time.sleep(3)
  print(" ")
  print( tgreen + "Start speaking ...")
  print(" ")
  os.system("termux-microphone-record -f $HOME/secure-termux/gee.mp3 -l 3")
  time.sleep(4)
  os.system("ffmpeg -i gee.mp3 kar.wav")
  os.system("rm gee.mp3")
  r = sr.Recognizer()
  with sr.AudioFile("kar.wav") as source:
      audio = r.record(source)
   
  try: 
      password = r.recognize_google(audio)
      print(" ")
      print( tgreen + "Your password is : "+password)
      os.system("rm kar.wav")
      print(" ")
      print( tgreen + "Did you want to set this password")
      print(" ")
      p = input("Enter yes or no : ")
      if p == "yes" or p == "Yes" or p == "YES":
         print(" ")
         user = input("Enter your name : ")
         os.system("echo "+password+" >> $HOME/../usr/bin/secure-termux/pass.txt")
         os.system("echo "+user+" >> $HOME/../usr/bin/secure-termux/user.txt")
         os.system("echo cd $HOME/../usr/bin/secure-termux >> $HOME/../usr/etc/bash.bashrc")
         os.system("echo python $HOME/../usr/bin/secure-termux/login.py >> $HOME/../usr/etc/bash.bashrc")
         os.system("echo cd >> $HOME/../usr/etc/bash.bashrc")
         print(" ")
         print( tgreen + "Your password is set successfull ...")
   
      elif p == "no" or p == "No" or p == "NO":
         print(" ")
         print( tgreen + "Your password is not set")
         print(" ")
         print( tgreen + "You want to set password run the script again")
         print(" ")
         print( tgreen + "By using this command : login.sh")
      else:
         print(" ")
         print( tgreen + "Invalid option")
     
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
  run()

