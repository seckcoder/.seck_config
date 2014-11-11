#!/usr/bin/env python

"""Usage:
   hs.py install <pkg>
   hs.py link <pkg>
   hs.py -h | --help | --version

"""


import subprocess as sh
from docopt import docopt

def install(pkg):
    print "Installing %s..." % (pkg)
    sh.call(["_hs_inst.sh", pkg])
    print "Done"

def link(pkg):
    print "Linking %s..." % (pkg)
    sh.call(["_hs_link.sh", pkg])
    print "Done"
def main():
    args = docopt(__doc__, version="0.0.1")
    if args["install"]:
        install(args["<pkg>"])
    elif args["link"]:
        link(args["<pkg>"])
main()
