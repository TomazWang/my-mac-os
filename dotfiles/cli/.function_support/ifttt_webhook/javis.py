import json
import sys

import requests

from javis_help import javis_help

JAVIS_URL = 'https://maker.ifttt.com/trigger/javis_event/with/key/bTj8X1RCAfA-h-gbbtdQuw'
EVENT_WIFI = 'JAVIS_WIFI'
EVENT_VIB = 'JAVIS_VIB'


def send_event(event_name: str, *args):
    v2 = '^'.join(args)
    dataObj = {'value1': event_name, 'value2': v2}
    requests.post(JAVIS_URL, json=dataObj)


def javis_wifi(args):
    if not args:
        print('Javis wifi need at least one argument.\n'
              'See \'javis wifi help\' for more information.')
        return

    command = args[0]

    if command == 'on':
        print('Turn on wifi.')
        send_event(EVENT_WIFI, command)

    elif command == 'check':
        print('Wifi status of Javis will send to you via Line.')
        send_event(EVENT_WIFI, command)

    elif command == 'help':
        javis_help('wifi')

    else:
        print('Javis wifi command not found :{}'.format(command))
        print('See \'javis wifi help\' for more information.')


def javis_vib(args):
    if not args:
        print('Send a vibrate command to Javis.')
        send_event(EVENT_VIB, '')

    if args == 'help':
        javis_help('vib')


def javis_brightness(args):
    if not args:
        print('Javis brightness requires at least one arguments.\n'
              'See \'javis brightness help\' for more information.')
        return

    if 'help' in args:
        javis_help('brightness')

    auto = 'N'
    level_str = '255'

    for a in args:
        if a == '-a':
            auto = 'Y'
        else:
            level_str = a

    level_str = level_str.lower()
    if level_str in ['max', 'min', 'mid', 'auto'] and auto != 'Y':
        print('Adjust screen brightness.')
        send_event('JAVIS_BRIGHTNESS', level_str, auto)
    else:
        print('The parameter must be one of \'auto\', \'max\', \'mid\' or \'min\'')


def main():
    if sys.argv[1:]:
        event_name = sys.argv[1]
    else:
        # no arguments input
        event_name = 'help'

    args = sys.argv[2:]

    if event_name == 'help':
        javis_help(args)

    elif event_name == 'wifi':
        javis_wifi(args)

    elif event_name == 'vib':
        javis_vib(args)

    elif event_name == 'brightness':
        javis_brightness(args)

    else:
        print('Javis command not found: {}'.format(event_name))

if __name__ == '__main__':
    main()
