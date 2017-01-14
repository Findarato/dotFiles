# Not Mine
# https://gist.github.com/the-c0d3r/5d04eb4e96ca074ed510
#
# Movie-like password cracking animation in Python that looks nifty. 
# Code for guessing a string written for a problem in "Problem Solving with 
# Algorithms and Data Structures" with my additional idea of printing every attempt and slowing down prints to make them readable.
#


import random
import time
import sys
import string


def generate_random_guess(chars):
    return random.choice(chars)

def repeated_guesses(target):
    #chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
    chars = string.ascii_letters + string.digits + ' '
    current_guess = len(target) * ['*']
    for count, char in enumerate(target):
        while current_guess[count] != char:
            current_guess[count] = generate_random_guess(chars)
            sys.stdout.write(str("\rCracking : "+''.join(current_guess)))
            # slight pause to make readable
            time.sleep(0.015)
            sys.stdout.flush()
    print "\n"

def main():
    target = "sUp3r Secret"
    repeated_guesses(target)

if __name__ == '__main__':
    main()
