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

// Numbers must be said separately before their following motion, ex. "One" ... "Go"
let ones = [
    "one"  : [KeyCode.One],
    "two"  : [KeyCode.Two],
    "three": [KeyCode.Three],
    "four" : [KeyCode.Four],
    "five" : [KeyCode.Five],
    "six"  : [KeyCode.Six],
    "seven": [KeyCode.Seven],
    "eight": [KeyCode.Eight],
    "nine": [KeyCode.Nine],
]

let teens = [
    "ten"   : [KeyCode.One, KeyCode.Zero],
    "eleven": [KeyCode.One, KeyCode.One],
    "twelve": [KeyCode.One, KeyCode.Two],
    "thirteen" : [KeyCode.One, KeyCode.Three]
    // etc.
]

let something = [
    "select": [KeyCode.V],
    "word": [KeyCode.W],
    "delete": [KeyCode.D],
    "duplicate-line": [KeyCode.Y, KeyCode.Y, KeyCode.P],
    "go": [KeyCode.G, KeyCode.G] // gg

    // "big-word" : [(KeyCode.Shift,KeyCode.W)]
]

let vimCommands = ones // Import Dollar and use .merge to merge the dictionaries!

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


