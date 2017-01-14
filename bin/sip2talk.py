#!/usr/bin/env python

# Eli Fulkerson
# http://www.elifulkerson.com for updates

import socket
import sys
import time

def appendChecksum(text):
#calculate checksum
  check = 0
  for each in text:
    check = check + ord(each)
  check = check + ord('\0')
  check = (check ^ 0xFFFF) + 1

  checksum = "%4.4X" % (check)  

  text = text + checksum

  #print text

  return text

def formPatronInformationRequest(cardno):
  code = "63"
  language = "001"
  timestamp = time.strftime("%Y%m%d    %H%M%S")
  summary = " " * 10

  message = code + language + timestamp + summary + "AO|AA" + cardno + "|AC|AD|AY1AZ"

  return message


def formLoginMessage(username,password):
  code = "93"
  uid_alg = "0"
  pwd_alg = "0"
  loc_code = ""

  message = code + uid_alg + pwd_alg + "CN" + username + "|CO" + password + "|CP|AY1AZ"

  return message

def readUntilCR(sock):
  print "Raw Response:"

  done = False
  data = ""
  tmp = ""
  while not done:
    tmp = sock.recv(4096)
    print tmp,
    data = data + tmp
    try:
      if ord(data[-1:]) == 13:
        done = True
    except:
      print "Error, should have had data by now."
      sys.exit(1)
  print
  print
  return data

def send(sock,data):
  print "Raw Message:"
  print data
  sock.send(data + '\r')
  print

#extremely lame argument checking...
try:
  HOST = sys.argv[1]
  PORT = int(sys.argv[2])
  cardno = sys.argv[3]
except:
  print "Syntax:    sip2talk.py <HOST> <PORT> <CARDNUMBER> [optional:username] [optional:password]"
  sys.exit(1)

print "Checking card# %s against %s:%s" % (cardno, HOST, PORT)

username = False
password = False
try:
  username = sys.argv[4]
  password = sys.argv[5]
  print "Username/Password: %s/%s" % (username, password)
except:
  print "..assuming no username/password"

print "---"

try:
  sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
except socket.error, msg:
  sys.stderr.write("[ERROR] %s\n" % msg[1])
  sys.exit(1)

try:
  sock.connect((HOST, PORT))
except socket.error, msg:
  sys.stderr.write("[ERROR] %s\n" % msg[1])
  sys.exit(2)


if (username and password):
  login = formLoginMessage(username,password)
  login = appendChecksum(login)

  send(sock,login)

  data = readUntilCR(sock)

  if data[:3] == "941":
    print "Login OK"
    pass
  else:
    print "Login FAIL"
    sys.exit(1)
  print


message = formPatronInformationRequest(cardno)
message = appendChecksum(message)

send(sock,message)

data = readUntilCR(sock)

print
print "Fields:"
count = 0
for each in data.split("|"):
  if count == 0:
    print each
  else:
    print each[:2] + " - "  + each[2:]
  count = count + 1

sys.exit(0)

