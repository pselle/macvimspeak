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
