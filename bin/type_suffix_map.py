import sys
import gflags
FLAGS=gflags.FLAGS
gflags.DEFINE_string("langtype", "cpp", "language type")
def _parse_argv(argv):
    try:
        argv = FLAGS(argv)
    except gflags.FlagsError as e:
        print '%s\nUsage: %s ARGS\n%s' % (e, sys.argv[0], FLAGS)
        raise SystemExit

_parse_argv(sys.argv)

type_suffix_map= {
    "cpp" : ".cpp .c .cc .h",
    "py" : ".py",
    "js" : ".js"
}

print type_suffix_map[FLAGS.langtype]
