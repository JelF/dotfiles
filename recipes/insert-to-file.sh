#!/bin/sh

STRING = $1
FILE = $2

grep $STRING $FILE || echo $STRING >> $FILE
