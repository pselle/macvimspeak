
//
//  VoiceCommands.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/16/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation
import Dollar

struct VoiceCommands {
    let allCommands: [String:String]
    
    // Numbers must be said separately before their following motion, ex. "One" ... "Down"
    let number = [
        "one":       "1",
        "two":       "2",
        "three":     "3",
        "four":      "4",
        "five":      "5",
        "six":       "6",
        "seven":     "7",
        "eight":     "8",
        "nine":      "9",
        "ten":       "10",
        "eleven":    "11",
        "twelve":    "12",
        "thirteen":  "13",
        "fourteen":  "14",
        "fifteen":   "15",
        "sixteen":   "16",
        "seventeen": "17",
        "eighteen":  "18",
        "nineteen":  "19",
        "twenty":    "20"
    ]

    let letter = [
        "a":         "a",
        "b":         "b",
        "c":         "c",
        "d":         "d",
        "e":         "e",
        "f":         "f",
        "g":         "g",
        "h":         "h",
        "i":         "i",
        "j":         "j",
        "k":         "k",
        "l":         "l",
        "m":         "m",
        "n":         "n",
        "o":         "o",
        "p":         "p",
        "q":         "q",
        "r":         "r",
        "s":         "s",
        "t":         "t",
        "u":         "u",
        "v":         "v",
        "w":         "w",
        "x":         "x",
        "y":         "y",
        "z":         "z",
        "capital-a": "A",
        "capital-b": "B",
        "capital-c": "C",
        "capital-d": "D",
        "capital-e": "E",
        "capital-f": "F",
        "capital-g": "G",
        "capital-h": "H",
        "capital-i": "I",
        "capital-j": "J",
        "capital-k": "K",
        "capital-l": "L",
        "capital-m": "M",
        "capital-n": "N",
        "capital-o": "O",
        "capital-p": "P",
        "capital-q": "Q",
        "capital-r": "R",
        "capital-s": "S",
        "capital-t": "T",
        "capital-u": "U",
        "capital-v": "V",
        "capital-w": "W",
        "capital-x": "X",
        "capital-y": "Y",
        "capital-z": "Z"
    ]
    
    let symbol = [
        "bang":                   "!",
        "exclamation-point":      "!",
        "at":                     "@",
        "pound":                  "#",
        "dollar":                 "$",
        "percent":                "%",
        "caret":                  "^",
        "ampersand":              "&",
        "star":                   "*",
        "asterisk":               "*",
        "underscore":             "_",
        "dash":                   "-",
        "minus":                  "-",
        "plus":                   "+",
        "equals":                 "=",
        "pipe":                   "|",
        "backslash":              "\\",
        "tilde":                  "~",
        "backtick":               "`",
        "tick":                   "'",
        "single-quote":           "'",
        "appostrophe":            "'",
        "quote":                  "\"",
        "quotes":                 "\"",
        "double-quote":           "\"",
        "double-quotes":          "\"",
        "comma":                  ",",
        "less-than":              "<",
        "period":                 ".",
        "dot":                    ".",
        "greater-than":           ">",
        "slash":                  "/",
        "question-mark":          "?",
        "colon":                  ":",
        "semi-colon":             ";",
        "opening-angle-bracket":  "<",
        "opening-curly-brace":    "{",
        "opening-brace":          "{",
        "opening-square-bracket": "[",
        "opening-bracket":        "[",
        "opening-parenthesis":    "(",
        "opening-paren":          "(",
        "closing-angle-bracket":  ">",
        "closing-curly-brace":    "}",
        "closing-brace":          "}",
        "closing-square-bracket": "]",
        "closing-bracket":        "]",
        "closing-parenthesis":    ")",
        "closing-paren":          ")",
        "left-angle-bracket":     "<",
        "left-curly-brace":       "{",
        "left-brace":             "{",
        "left-square-bracket":    "[",
        "left-bracket":           "[",
        "left-parenthesis":       "(",
        "left-paren":             "(",
        "right-angle-bracket":    ">",
        "right-curly-brace":      "}",
        "right-brace":            "}",
        "right-square-bracket":   "]",
        "right-bracket":          "]",
        "right-parenthesis":      ")",
        "right-paren":            ")"
    ]
    
    let countedNavigate = [
        "back":                           "b",
        "back-word":                      "b",
        "big-back":                       "B",
        "big-back-word":                  "B",
        "word":                           "w",
        "big-word":                       "W",
        "end":                            "e",
        "big-end":                        "E",
        "back-end":                       "ge",
        "back-big-end":                   "gE",
        "left":                           "h",
        "down":                           "j",
        "up":                             "k",
        "right":                          "l"
    ]
    
    let navigate = [
        "next":                           "n",
        "next-reversed":                  "N",
        "previous":                       "N",
        "column-zero":                    "0",
        "column":                         "|",
        "start-of-line":                  "^",
        "end-of-line":                    "$",
        "search-under-cursor":            "*",
        "search-under-cursor-reversed":   "#",
        "again":                          ";",
        "again-reversed":                 ",",
        "down-sentence":                  ")",
        "up-sentence":                    "(", // <LeftParetheses>
        "down-paragraph":                 "}",
        "up-paragraph":                   "{", // <
        "start-of-next-section":          "]]",
        "start-of-previous-section":      "[[",
        "end-of-next-section":            "][",
        "end-of-previous-section":        "[]",
        "matching":                       "%",
        "down-line":                      "+",
        "up-line":                        "-",
        "first-character":                "_",
        "cursor-home":                    "H",
        "cursor-middle":                  "M",
        "cursor-last":                    "L",
        "start-of-document":              "gg",
        "end-of-document":                "G",
        "retrace-movements":              "<Control-o>", // <Control-[letter]>
        "retrace-movements-forward":      "<Control-i>",
    ]
    
    let edit = [
        "change":        "c",
        "delete":        "d",
        "indent":        "<",
        "unindent":      ">",
        "join":          "J",
        "format":        "=",
        "put":           "p",
        "paste":         "p",
        "undo":          "u",
        "redo":          "<C-r>",
        "yank":          "y",
        "copy":          "y"
    ]
    
    // Join these with numbers, in addition to alone
    let countedAction = [
        "after":                    "a",
        "append":                   "a",
        "after-line":               "A",
        "append-line":              "A",
        "insert":                   "i",
        "insert-before-line":       "I",
        "insert-column-zero":       "gI",
        "open":                     "o",
        "open-below":               "o",
        "open-above":               "O",
        "substitute":               "s",
        "substitute-line":          "S",
        "undo":                     "u",
        "undo-line":                "U",
        "redo":                     "<Control-r>",
        "erase":                    "x",
        "erase-reversed":           "X",
        "erase-back":               "X",
        "put":                      "p",
        "paste":                    "p",
        "put-before":               "P",
        "paste-before":             "P",
        "put-above":                "P",
        "paste-above":              "P",
        "repeat":                   ".",
        "scroll-up":                "<Control-y>",
        "scroll-down":              "<Control-e>",
        "page-down":                "<Control-f>",
        "page-up":                  "<Control-b>",
        "half-page-down":           "<Control-d>",
        "half-page-up":             "<Control-u>",
        "indent-line":              ">>",
        //    "unindent-line":            "<<", Not covered in parser atm
        "toggle-case":              "~",
        // idk what these are with the @ or whatever
        //    "comment-line":             @"\\\",
        //    "comment-lines":            @"\\\",
        //    "uncomment-line":           @"\\\",
        //    "uncomment-lines":          @"\\\",
        "scroll-left":              "zh",
        "scroll-right":             "zl",
        "scroll-half-screen-left":  "zH",
        "scroll-half-screen-right": "zL",
        "scroll-start":             "zs",
        "scroll-end":               "ze",
        "play-again":               "@@",
    ]
    
    let nonCountedAction = [
        "display-current-line-number": "<Control-g>",
        "delete-remaining-line": "D",
        "change-remaining-line": "C",
        "change-line":           "cc",
        "duplicate-line":        "yyp",
        "swap-characters":       "xp",
        "swap-words":            "dwwP",
        "swap-lines":            "ddp",
        "stop-recording":        "q",
        "replace-mode":          "R",
        "overwrite":             "R",
        "visual":                "v",
        "select":                "v",
        "visual-line":           "V",
        "select-line":           "V",
        "visual-all":            "ggVG",
        "select-all":            "ggVG",
        "visual-block":          "<Control-v>",
        "select-block":          "<Control-v>",
        "scroll-top":            "zt",
        "scroll-middle":         "zz",
        "scroll-botton":         "zb",
        "scroll-top-reset-cursor":    "z<Enter>",
        "scroll-middle-reset-cursor": "z.",
        "scroll-botton-reset-cursor": "z-"
    ]
    
    // all followed by enter
    let commandLine = [
        "save":                     ":w",
        "quit":                     ":q",
        "save-and-quit":            ":x",
        "quit-without-saving":      ":q!",
        "escape":                   "<Escape>"
//        "set-number":               ":set nu",
//        "set-no-number":            ":set nonu",
//        "set-highlight-search":     ":set hls",
//        "set-no-highlight-search":  ":set nohls"
    ]
    
    let insertCommands = [
        //"undo": "(^o)u",
        "complete": "<Control-n>",
        "complete-next": "<Control-n>",
        "complete-previous": "<Control-p>",
        "space": "<Space>",
        "backspace": "<Backspace>",
        "tab": "<Tab>",
        "enter": "<Enter>",
        "return": "<Enter>"
    ]
    
    init() {
        let countedCommands = combineDictionaries(number, countedAction, "-")
        let countedNavigation = combineDictionaries(number, countedNavigate, " ")
        let countedEdit = combineDictionaries(edit, countedNavigation, " ")
        let commandLineWithEnter = mapDict(commandLine, addEnter)
        allCommands = $.merge(number, letter, symbol, navigate, edit, countedAction, nonCountedAction, insertCommands,
            commandLineWithEnter, countedCommands,
            countedNavigation, countedEdit)
    }
}

func addEnter(s:String) -> String {
    return s + "<Enter>"
}
