//
//  Parser.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/10/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation

// from http://benscheirman.com/2014/06/regex-in-swift/
public class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.internalExpression = NSRegularExpression(pattern: pattern, options: nil, error: &error)!
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, countElements(input)))
        return matches.count > 0
    }
}

public func Parser(keyset:String) {
    for c in keyset {
        if Regex("[a-z]").test(String(c)) {
            println("cats")
        }
    }
}
// handle modifier key sequences:
// special = mystring.match(<.*>)
// special = - -> [[]]
// special = [[1,2]]
// return [[1,2]], 7 (number of characters)

/// "gg<C-v>" -> [[KeyCode.G], [KeyCode.G], [KeyCode.Control, KeyCode.V]]
//  "<Enter>" -> [[KeyCode.Enter]]