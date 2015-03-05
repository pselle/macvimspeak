//
//  Grammar.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/2/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation

struct Word {
    let say:String, keystrokes:[KeyCode]
    init(say:String, keystrokes:[KeyCode], afterMode: Any?) {
        self.say = say
        self.keystrokes = keystrokes
    }
}
typealias Choice = [Any]
typealias Sequence = Array<Any>

enum Mode {
    case Normal, VisualMode, Replace, Insert
}

let ones:Choice = [
//    Word (say:"one",   keystrokes:"1", nil),
//    Word (say:"two",   keystrokes:"2", nil),
//    Word (say:"three", keystrokes:"3", nil),
//    Word ("four",  "4", nil),
//    Word ("five",  "5", nil),
//    Word ("six",   "6", nil),
//    Word ("seven", "7", nil),
//    Word ("eight", "8", nil),
    Word (say: "nine", keystrokes: [KeyCode.Nine], afterMode: nil)]

//

let vimCommands = [
    "select": [KeyCode.V],
    "word": [KeyCode.W],
    "delete": [KeyCode.D],
    "duplicate-line": [KeyCode.Y, KeyCode.Y, KeyCode.P]
    // "big-word" : [(KeyCode.Shift,KeyCode.W)]
]

func executeKeyCommands(keys: [KeyCode]) {
    for key in keys {
        executeKey(key)
    }
}

let src = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()

func executeKey(key: KeyCode) {
    let keyDown = CGEventCreateKeyboardEvent(src, key.rawValue, true).takeRetainedValue()
    let keyUp = CGEventCreateKeyboardEvent(src, key.rawValue, false).takeRetainedValue()
    CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyDown)
    CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyUp)
}

//let nonCountedAction =
//Choice [
//    Sequence [commentary; motion]
//    Sequence [Word ("align-on", ":Tab/", Some "command"); char] // TODO: complete Tabular support
//    Sequence [Word ("mark",           "m",   Some "prompt: marked %s"); char]
//    Sequence [Word ("record-macro",   "q",   Some "prompt: recording %s"); char]
//    Sequence [Word ("replace",        "r",   None); char]
//    Word(say: "display-current-line-number", keystrokes: "<C-g>", mode:      None)
//    Word(say: "delete-remaining-line", keystrokes: "D", mode:      None)
//    Word(say: "change-remaining-line", keystrokes: "C", mode:      Some "insert")
//    Word(say: "change-line", keystrokes: "cc", mode:     Some "insert")
//    Word(say: "duplicate-line", keystrokes: "yyp", mode:    None)
//    Word(say: "swap-characters", keystrokes: "xp", mode:     None)
//    Word(say: "swap-words", keystrokes: "dwwP", mode:   None)
//    Word(say: "swap-lines", keystrokes: "ddp", mode:    None)
//    Word(say: "stop-recording", keystrokes: "q", mode:      Some "prompt: stopped")
//    Word(say: "replace-mode", keystrokes: "R", mode:      Some "replace")
//    Word(say: "overwrite", keystrokes: "R", mode:      Some "replace")
//    Word(say: "visual", keystrokes: "v", mode:      Some "visual")
//    Word(say: "select", keystrokes: "v", mode:      Some "visual")
//    Word(say: "visual-line", keystrokes: "V", mode:      Some "visual")
//    Word(say: "select-line", keystrokes: "V", mode:      Some "visual")
//    Word(say: "visual-all", keystrokes: "ggVG", mode:   Some "visual")
//    Word(say: "select-all", keystrokes: "ggVG", mode:   Some "visual")
//    Word(say: "visual-block", keystrokes: "<C-v>", mode:  Some "visual")
//    Word(say: "select-block", keystrokes: "<C-v>", mode:  Some "visual")
//    Word(say: "scroll-top", keystrokes: "zt", mode:     None)
//    Word(say: "scroll-middle", keystrokes: "zz", mode:     None)
//    Word(say: "scroll-botton", keystrokes: "zb", mode:     None)
//    Word(say: "scroll-top-reset-cursor", keystrokes: "z<enter>", mode:  None)
//    Word(say: "scroll-middle-reset-cursor", keystrokes: "z.", mode:         None)
//    Word(say: "scroll-botton-reset-cursor", keystrokes: "z-", mode:         None)]
//    Word(say: \1, keystrokes: \2, mode: \3)

//Word \((.*?),\s*?(.*?),\s*?(.*?)\)

