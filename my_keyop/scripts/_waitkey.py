import termios
import fcntl
import sys
import os


def check_key(c):
    if c != '\x1b':
        return c

    c = sys.stdin.read(1)
    if c != '[':
        return None

    c = sys.stdin.read(1)
    if c == 'A':
        return  'up'
    elif c == 'B':
        return  'down'
    elif c == 'C':
        return 'right'
    elif c == 'D':
        return 'left'
    else:
        return None


def waitkey():
    fd = sys.stdin.fileno()

    oldterm = termios.tcgetattr(fd)
    newattr = termios.tcgetattr(fd)
    newattr[3] = newattr[3] & ~termios.ICANON & ~termios.ECHO
    termios.tcsetattr(fd, termios.TCSANOW, newattr)

    oldflags = fcntl.fcntl(fd, fcntl.F_GETFL)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags | os.O_NONBLOCK)

    try:
        while True:
            try:
                c = sys.stdin.read(1)
                key = check_key(c)
                # print "Got character", key
                return key
            except IOError:
                pass
    finally:
        termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
        fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)


if __name__ == '__main__':
    waitkey()
