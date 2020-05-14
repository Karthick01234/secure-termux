import os 
tgreen = '\033[32m'
print(" ")
p = input("Enter your password : ")
print(" ")
a = input("Enter your password again : ")
print(" ")
user = input("Enter your name : ")
print(" ")
if p == a:
   os.system("echo "+p+" >> $HOME/../usr/bin/secure-termux/pass.txt")
   os.system("echo "+user+" >> $HOME/../usr/bin/secure-termux/user.txt")
   os.system("echo cd $HOME/../usr/bin/secure-termux >> $HOME/../usr/etc/bash.bashrc")
   os.system("echo python $HOME/../usr/bin/secure-termux/textlogin.py >> $HOME/../usr/etc/bash.bashrc")
   os.system("echo cd >> $HOME/../usr/etc/bash.bashrc")
   print(" ")
   print( tgreen + "Your password is set successfull ...")
else:
   print(" ")
   print( tgreen + "Password do not match")
   print(" ")
   print( tgreen + "You want to set password run the script again")
   print(" ")
   print( tgreen + "By using this command : login.sh")


