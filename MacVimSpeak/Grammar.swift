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

let nonCountedAction = [
//    Sequence [commentary; motion]
//    Sequence [Word ("align-on", ":Tab/", Some "command"); char] // TODO: complete Tabular support
//    Sequence [Word ("mark",           "m",   Some "prompt: marked %s"); char]
//    Sequence [Word ("record-macro",   "q",   Some "prompt: recording %s"); char]
//    Sequence [Word ("replace",        "r",   nil); char]
    Word(say: "display-current-line-number", keystrokes: [KeyCode.<C-g>", afterMode: nil),
    Word(say: "delete-remaining-line", keystrokes: [KeyCode.D", afterMode: nil),
    Word(say: "change-remaining-line", keystrokes: [KeyCode.C", afterMode:      Some "insert"),
    Word(say: "change-line", keystrokes: [KeyCode.cc", afterMode:     Some "insert"),
    Word(say: "duplicate-line", keystrokes: [KeyCode.Y, KeyCode.Y, KeyCode.P], afterMode:    nil),
    Word(say: "swap-characters", keystrokes: [KeyCode.xp", afterMode:     nil),
    Word(say: "swap-words", keystrokes: [KeyCode.dwwP", afterMode:   nil),
    Word(say: "swap-lines", keystrokes: [KeyCode.ddp", afterMode:    nil),
    Word(say: "stop-recording", keystrokes: [KeyCode.q", afterMode:      Some "prompt: stopped"),
    Word(say: "replace-mode", keystrokes: [KeyCode.R", afterMode:      Some "replace"),
    Word(say: "overwrite", keystrokes: [KeyCode.R", afterMode:      Some "replace"),
    Word(say: "visual", keystrokes: [KeyCode.v", afterMode:      Some "visual"),
    Word(say: "select", keystrokes: [KeyCode.v", afterMode:      Some "visual"),
    Word(say: "visual-line", keystrokes: [KeyCode.V", afterMode:      Some "visual"),
    Word(say: "select-line", keystrokes: [KeyCode.V", afterMode:      Some "visual"),
    Word(say: "visual-all", keystrokes: [KeyCode.ggVG", afterMode:   Some "visual"),
    Word(say: "select-all", keystrokes: [KeyCode.ggVG", afterMode:   Some "visual"),
    Word(say: "visual-block", keystrokes: [KeyCode.<C-v>", afterMode:  Some "visual"),
    Word(say: "select-block", keystrokes: [KeyCode.<C-v>", afterMode:  Some "visual"),
    Word(say: "scroll-top", keystrokes: [KeyCode.zt", afterMode:     nil),
    Word(say: "scroll-middle", keystrokes: [KeyCode.zz", afterMode:     nil),
    Word(say: "scroll-botton", keystrokes: [KeyCode.zb", afterMode:     nil),
    Word(say: "scroll-top-reset-cursor", keystrokes: [KeyCode.z<enter>", afterMode:  nil),
    Word(say: "scroll-middle-reset-cursor", keystrokes: [KeyCode.z.", afterMode:         nil),
    Word(say: "scroll-botton-reset-cursor", keystrokes: [KeyCode.z-", afterMode:         nil)]
    Word(say: \1, keystrokes: \2, afterMode: \3)

//Word \((.*?),\s*?(.*?),\s*?(.*?)\)

