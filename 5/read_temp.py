#!/usr/bin/python
from contextlib import closing
import serial
import sys
import time

if __name__ == '__main__':
    with closing(serial.Serial(sys.argv[1], baudrate=9600)) as s:
        print('Started')
        while True:
            k = int.from_bytes(s.read(2), byteorder='little')
            print(k)
