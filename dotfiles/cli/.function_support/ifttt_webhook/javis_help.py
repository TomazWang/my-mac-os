def print_javis_help():
    help = \
        '''
javis <function> [<var>...]

Simple Command:
    vib                 Javis will vibrate once.
    wifi                Control wifi on Javis.
    brightness          Control screen brightness.
    
Use javis help <function> for more information to the function.
        '''
    print(help)
    pass


def print_wifi_help():
    help = \
        '''
Control wifi of Javis.

usage: javis wifi <command>
    
    on      Turn on Wi-Fi of Javis
    check   Check Wi-Fi status. The result will send back via Line.
    help    Display the help document to 'wifi' function.
 
        '''
    print(help)
    pass


def print_vib_help():
    help = \
        '''
Send a vibration command to Javis.

usage: javis vib [<help>]

    help    Display the help document to 'vib' function.
    
        '''
    print(help)


def print_brightness_help():
    help = \
        '''
Control brightness.

usage: javis brightness [-a] <level>

    level       brightness level. It must be one of \'auto\', \'max\', \'mid\', or \'min\'
    -a          Enable auto brightness. If enable, level won't function.
    
        '''
    print(help)


def javis_help(func_name=''):
    if not func_name:
        print_javis_help()
        return

    if func_name == 'wifi':
        print_wifi_help()
    elif func_name == 'vib':
        print_vib_help()
    elif func_name == 'brightness':
        print_brightness_help()
    else:
        print('no document found for ' + func_name)
