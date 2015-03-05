//
//  Grammar.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/2/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation
typealias Choice = [Word]

// I'm not 100% sure what this is, but gotta have it!
let src = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()

struct Word {
    let say:String, keystrokes:[KeyCode]
    init(say:String, keystrokes:[KeyCode], afterMode: Any?) {
        self.say = say
        self.keystrokes = keystrokes
    }
}

enum Mode {
    case Normal, VisualMode, Replace, Insert
}

let ones:Choice = [
    Word (say:"one",   keystrokes:[KeyCode.One], afterMode:nil),
    Word (say:"two",   keystrokes:[KeyCode.Two], afterMode:nil),
    Word (say:"three", keystrokes:[KeyCode.Three], afterMode:nil),
    Word (say:"four",  keystrokes:[KeyCode.Four], afterMode:nil),
    Word (say:"five",  keystrokes:[KeyCode.Five], afterMode:nil),
    Word (say:"six",   keystrokes:[KeyCode.Six], afterMode:nil),
    Word (say:"seven", keystrokes:[KeyCode.Seven], afterMode:nil),
    Word (say:"eight", keystrokes:[KeyCode.Eight], afterMode:nil),
    Word (say: "nine", keystrokes: [KeyCode.Nine], afterMode: nil)
]

let vimCommands = [
    "select": [KeyCode.V],
    "word": [KeyCode.W],
    "delete": [KeyCode.D],
    "duplicate-line": [KeyCode.Y, KeyCode.Y, KeyCode.P]
    // "big-word" : [(KeyCode.Shift,KeyCode.W)]
]

let myCommands = ones.map {
    (var num) -> String in
    return num.say
}

func executeKeyCommands(keys: [KeyCode]) {
    for key in keys {
        executeKey(key)
    }
}


func executeKey(key: KeyCode) {
    let keyDown = CGEventCreateKeyboardEvent(src, key.rawValue, true).takeRetainedValue()
    let keyUp = CGEventCreateKeyboardEvent(src, key.rawValue, false).takeRetainedValue()
    CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyDown)
    CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyUp)
}


