//
//  Grammar.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/2/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation

struct Word {
    let saying, expression:String
    init(saying:String, expression:String) {
        self.saying = saying
        self.expression = expression
    }
}

let one = Word(saying: "one", expression: "1")
