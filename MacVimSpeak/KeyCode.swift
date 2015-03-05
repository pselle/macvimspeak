//
//  KeyCode.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/3/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//
//  Summary:
//    Virtual keycodes
//
//  Discussion:
//    These constants are the virtual keycodes defined originally in
//    Inside Mac Volume V, pg. V-191. They identify physical keys on a
//    keyboard. Those constants with "ANSI" in the name are labeled
//    according to the key position on an ANSI-standard US keyboard.
//    For example, kVK_ANSI_A indicates the virtual keycode for the key
//    with the letter 'A' in the US keyboard layout. Other keyboard
//    layouts may have the 'A' key label on a different physical key;
//    in this case, pressing 'A' will generate a different virtual
//    keycode.
// Source: http:forums.macrumors.com/showthread.php?t=780577

import Foundation

enum KeyCode:CGKeyCode {
    case A                    = 0x00
    case S                    = 0x01
    case D                    = 0x02
    case F                    = 0x03
    case H                    = 0x04
    case G                    = 0x05
    case Z                    = 0x06
    case X                    = 0x07
    case C                    = 0x08
    case V                    = 0x09
    case B                    = 0x0B
    case Q                    = 0x0C
    case W                    = 0x0D
    case E                    = 0x0E
    case R                    = 0x0F
    case Y                    = 0x10
    case T                    = 0x11
    case One                  = 0x12
    case Two                  = 0x13
    case Three                = 0x14
    case Four                 = 0x15
    case Five                 = 0x16
    case Six                  = 0x17
    case Equal                = 0x18
    case Nine                 = 0x19
    case Seven                = 0x1A
    case Minus                = 0x1B
    case Eight                = 0x1C
    case Zero                 = 0x1D
    case RightBracket         = 0x1E
    case O                    = 0x1F
    case U                    = 0x20
    case LeftBracket          = 0x21
    case I                    = 0x22
    case P                    = 0x23
    case L                    = 0x25
    case J                    = 0x26
    case Quote                = 0x27
    case K                    = 0x28
    case Semicolon            = 0x29
    case Backslash            = 0x2A
    case Comma                = 0x2B
    case Slash                = 0x2C
    case N                    = 0x2D
    case M                    = 0x2E
    case Period               = 0x2F
    case Grave                = 0x32
    case KeypadDecimal        = 0x41
    case KeypadMultiply       = 0x43
    case KeypadPlus           = 0x45
    case KeypadClear          = 0x47
    case KeypadDivide         = 0x4B
    case KeypadEnter          = 0x4C
    case KeypadMinus          = 0x4E
    case KeypadEquals         = 0x51
    case Keypad0              = 0x52
    case Keypad1              = 0x53
    case Keypad2              = 0x54
    case Keypad3              = 0x55
    case Keypad4              = 0x56
    case Keypad5              = 0x57
    case Keypad6              = 0x58
    case Keypad7              = 0x59
    case Keypad8              = 0x5B
    case Keypad9              = 0x5C

/* keycodes for keys that are independent of keyboard layout*/
    case Return                    = 0x24
    case Tab                       = 0x30
    case Space                     = 0x31
    case Delete                    = 0x33
    case Escape                    = 0x35
    case Command                   = 0x37
    case Shift                     = 0x38
    case CapsLock                  = 0x39
    case Option                    = 0x3A
    case Control                   = 0x3B
    case RightShift                = 0x3C
    case RightOption               = 0x3D
    case RightControl              = 0x3E
    case Function                  = 0x3F
    case F17                       = 0x40
    case VolumeUp                  = 0x48
    case VolumeDown                = 0x49
    case Mute                      = 0x4A
    case F18                       = 0x4F
    case F19                       = 0x50
    case F20                       = 0x5A
    case F5                        = 0x60
    case F6                        = 0x61
    case F7                        = 0x62
    case F3                        = 0x63
    case F8                        = 0x64
    case F9                        = 0x65
    case F11                       = 0x67
    case F13                       = 0x69
    case F16                       = 0x6A
    case F14                       = 0x6B
    case F10                       = 0x6D
    case F12                       = 0x6F
    case F15                       = 0x71
    case Help                      = 0x72
    case Home                      = 0x73
    case PageUp                    = 0x74
    case ForwardDelete             = 0x75
    case F4                        = 0x76
    case End                       = 0x77
    case F2                        = 0x78
    case PageDown                  = 0x79
    case F1                        = 0x7A
    case LeftArrow                 = 0x7B
    case RightArrow                = 0x7C
    case DownArrow                 = 0x7D
    case UpArrow                   = 0x7E


// Icase SO keyboards only
    case Section               = 0x0A

// Jcase IS keyboards only
    case Yen                   = 0x5D
    case Underscore            = 0x5E
    case KeypadComma           = 0x5F
    case Eisu                  = 0x66
    case Kana                  = 0x68
}

let KeyCodeDict = [
    "a"                   : 0x00,
    "s"                   : 0x01,
    "d"                   : 0x02,
    "f"                   : 0x03,
    "h"                   : 0x04,
    "g"                   : 0x05,
    "z"                   : 0x06,
    "x"                   : 0x07,
    "c"                   : 0x08,
    "v"                   : 0x09,
    "b"                   : 0x0B,
    "q"                   : 0x0C,
    "w"                   : 0x0D,
    "e"                   : 0x0E,
    "r"                   : 0x0F,
    "y"                   : 0x10,
    "t"                   : 0x11,
    "one"                  : 0x12,
    "two"                  : 0x13,
    "three"                : 0x14,
    "four"                 : 0x15,
    "five"                 : 0x16,
    "six"                  : 0x17,
    "equal"                : 0x18,
    "nine"                 : 0x19,
    "seven"                : 0x1A,
    "minus"                : 0x1B,
    "eight"                : 0x1C,
    "zero"                 : 0x1D,
    "rightBracket"         : 0x1E,
    "o"                    : 0x1F,
    "u"                    : 0x20,
    "leftBracket"          : 0x21,
    "i"                    : 0x22,
    "p"                    : 0x23,
    "l"                    : 0x25,
    "j"                    : 0x26,
    "quote"                : 0x27,
    "k"                    : 0x28,
    "semicolon"            : 0x29,
    "backslash"            : 0x2A,
    "comma"                : 0x2B,
    "slash"                : 0x2C,
    "n"                    : 0x2D,
    "m"                    : 0x2E,
    "period"               : 0x2F,
    "grave"                : 0x32,
    "keypadDecimal"        : 0x41,
    "keypadMultiply"       : 0x43,
    "keypadPlus"           : 0x45,
    "keypadClear"          : 0x47,
    "keypadDivide"         : 0x4B,
    "keypadEnter"          : 0x4C,
    "keypadMinus"          : 0x4E,
    "keypadEquals"         : 0x51,
    "keypad0"              : 0x52,
    "keypad1"              : 0x53,
    "keypad2"              : 0x54,
    "keypad3"              : 0x55,
    "keypad4"              : 0x56,
    "keypad5"              : 0x57,
    "keypad6"              : 0x58,
    "keypad7"              : 0x59,
    "keypad8"              : 0x5B,
    "keypad9"              : 0x5C
]
//
//    /* keycodes for keys that are independent of keyboard layout*/
//    "return"                    = 0x24
//    "tab"                       = 0x30
//    "space"                     = 0x31
//    "delete"                    = 0x33
//    "escape"                    = 0x35
//    "command"                   = 0x37
//    "Shift"                     = 0x38
//    "CapsLock                  = 0x39
//    "Option                    = 0x3A
//    "Control                   = 0x3B
//    "RightShift                = 0x3C
//    "RightOption               = 0x3D
//    "RightControl              = 0x3E
//    "Function                  = 0x3F
//    "F17                       = 0x40
//    "VolumeUp                  = 0x48
//    "VolumeDown                = 0x49
//    "Mute                      = 0x4A
//    "F18                       = 0x4F
//    "F19                       = 0x50
//    "F20                       = 0x5A
//    "F5                        = 0x60
//    "F6                        = 0x61
//    "F7                        = 0x62
//    "F3                        = 0x63
//    "F8                        = 0x64
//    "F9                        = 0x65
//    "F11                       = 0x67
//    "F13                       = 0x69
//    "F16                       = 0x6A
//    "F14                       = 0x6B
//    "F10                       = 0x6D
//    "F12                       = 0x6F
//    "F15                       = 0x71
//    "Help                      = 0x72
//    "Home                      = 0x73
//    "PageUp                    = 0x74
//    "ForwardDelete             = 0x75
//    "F4                        = 0x76
//    "End                       = 0x77
//    "F2                        = 0x78
//    "PageDown                  = 0x79
//    "F1                        = 0x7A
//    "LeftArrow                 = 0x7B
//    "RightArrow                = 0x7C
//    "DownArrow                 = 0x7D
//    "UpArrow                   = 0x7E
//
//
//    // I"SO keyboards only
//    "Section               = 0x0A
//
//    // J"IS keyboards only
//    "Yen                   = 0x5D
//    "Underscore            = 0x5E
//    "KeypadComma           = 0x5F
//    "Eisu                  = 0x66
//    "Kana                  = 0x68

