//
//  Grammar.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/2/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation
import Dollar

// I'm not 100% sure what this is, but gotta have it!
let src = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()

let voiceCommands = VoiceCommands()
let completeCommands = mapDict(voiceCommands.allCommands, Parser)
let vimCommands = $.merge(completeCommands).keys.array //ones, teens, something)


func executeKeyCommands(keys: [KeySet]) {
    println("===============ExecuteKeyCommands called")
    for keySet in keys {
            println("key set is", keySet)
            executeMultiKey(keySet)
    }
}

func executeMultiKey(keys: [UInt16]) {
    println("pressing keys")
    pressKeys(keys)
    liftKeys(keys)
}

func pressKeys(keys:[UInt16]) {
    for key in keys {
        println("Down", key)
        let keyDown = CGEventCreateKeyboardEvent(src, key, true).takeRetainedValue()
        //CGEventSetFlags(keyDown, CGEventFlags(kCGEventFlagMaskShift))
        CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyDown)
    }
}

func liftKeys(keys:[UInt16]) {
    for key in keys {
        println("Up", key)
        let keyUp = CGEventCreateKeyboardEvent(src, key, false).takeRetainedValue()
        CGEventPost(CGEventTapLocation(kCGHIDEventTap), keyUp)
    }
}


