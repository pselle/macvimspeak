//
//  Grammar2.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/5/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation

typealias Sequence = Array<Any>

struct MWord {
    let say:String, keyCodes:[CGKeyCode]
    init(say:String, keystrokes:String, afterMode: Any?) {
        self.say = say
        self.keyCodes = stringToKeyCodes(keystrokes)
    }
}

func stringToKeyCodes(string:String) -> [CGKeyCode] {
    var keyCodes = [CGKeyCode]()
    for letter in string {
        let strLetter = String(letter)
        //keyCodes.append(KeyCodeDict[strLetter])
        println(KeyCodeDict[strLetter])
    }
    return keyCodes
}
//let nonCountedAction = [
//    Sequence [commentary; motion]
//    Sequence [Word ("align-on", ":Tab/", Some "command"); char] // TODO: complete Tabular support
//    Sequence [Word ("mark",           "m",   Some "prompt: marked %s"); char]
//    Sequence [Word ("record-macro",   "q",   Some "prompt: recording %s"); char]
//    Sequence [Word ("replace",        "r",   nil); char]
//    MWord(say: "display-current-line-number", keystrokes: "<C-g>", afterMode: nil)]
//    Word(say: "delete-remaining-line", keystrokes: "D", afterMode: nil),
//    Word(say: "change-remaining-line", keystrokes: "C", afterMode:      Some "insert"),
//    Word(say: "change-line", keystrokes: "cc", afterMode:     Some "insert"),
//    Word(say: "duplicate-line", keystrokes: "yyp", afterMode:    nil),
//    Word(say: "swap-characters", keystrokes: "xp", afterMode:     nil),
//    Word(say: "swap-words", keystrokes: "dwwP", afterMode:   nil),
//    Word(say: "swap-lines", keystrokes: "ddp", afterMode:    nil),
//    Word(say: "stop-recording", keystrokes: "q", afterMode:      Some "prompt: stopped"),
//    Word(say: "replace-mode", keystrokes: "R", afterMode:      Some "replace"),
//    Word(say: "overwrite", keystrokes: "R", afterMode:      Some "replace"),
//    Word(say: "visual", keystrokes: "v", afterMode:      Some "visual"),
//    Word(say: "select", keystrokes: "v", afterMode:      Some "visual"),
//    Word(say: "visual-line", keystrokes: "V", afterMode:      Some "visual"),
//    Word(say: "select-line", keystrokes: "V", afterMode:      Some "visual"),
//    Word(say: "visual-all", keystrokes: "ggVG", afterMode:   Some "visual"),
//    Word(say: "select-all", keystrokes: "ggVG", afterMode:   Some "visual"),
//    Word(say: "visual-block", keystrokes: "<C-v>", afterMode:  Some "visual"),
//    Word(say: "select-block", keystrokes: "<C-v>", afterMode:  Some "visual"),
//    Word(say: "scroll-top", keystrokes: "zt", afterMode:     nil),
//    Word(say: "scroll-middle", keystrokes: "zz", afterMode:     nil),
//    Word(say: "scroll-botton", keystrokes: "zb", afterMode:     nil),
//    Word(say: "scroll-top-reset-cursor", keystrokes: "z<enter>", afterMode:  nil),
//    Word(say: "scroll-middle-reset-cursor", keystrokes: ["z.", afterMode:         nil),
//    Word(say: "scroll-botton-reset-cursor", keystrokes: ["z-", afterMode:         nil)]
//    Word(say: \1, keystrokes: \2, afterMode: \3)

//Word \((.*?),\s*?(.*?),\s*?(.*?)\)