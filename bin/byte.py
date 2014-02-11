##!/usr/bin/env python


import sys
from numpy import binary_repr
from itertools import dropwhile


def to_hex(bytes):
    return hex(int(bytes, 2))[2:]

def groupn(l, n, p):
    ret = []
    for i in range(len(l)):
        if i % n == 0:
            ret.append([])
        ret[-1].append(l[i])

    while (i+1) %n != 0:
        ret[-1].append(p)
        i+=1

    return ret

def groupn_pfront(l,n,p):
    return reverse([reverse(x) for x in groupn(reverse(l), n, p)])

def reverse(l):
    return list(reversed(l))

def to_byte(x):
    bin = binary_repr(x, 32)
    rb = reverse(bin)
    return '0x'+''.join(list(dropwhile(lambda x: x=='0',
                                       iter(reverse(
                                           [to_hex(''.join(reverse(rbt)))
                                            for rbt in groupn_pfront(rb, 4, '0')])))))


if __name__ == '__main__':
    x = sys.argv[1]
    print to_byte(int(x))
