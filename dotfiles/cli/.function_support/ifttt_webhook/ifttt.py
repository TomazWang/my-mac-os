import sys

from ifttt_help import ifttt_help


def main():
    if sys.argv[1:]:
        event_name = sys.argv[1]
    else:
        # no arguments input
        event_name = 'help'

    args = sys.argv[2:]

    if event_name == 'help':
        ifttt_help(args)

if __name__ == '__main__':
    main()
