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

//let internalExpression: NSRegularExpression?
//let pattern: String
//
//init(_ pattern: String) {
//    self.pattern = pattern
//    var error: NSError?
//    self.internalExpression = NSRegularExpression(pattern: pattern, options: nil, error: &error)
//}
//
//func test(input: String) -> Bool {
//    var matched:Bool
//    if let internalExpression = self.internalExpression as NSRegularExpression! {
//        let matches = internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, countElements(input)))
//        matched = matches.count > 0
//    } else {
//        matched = false
//    }
//    return matched
//}

public class KeyBatch {
    public let batch:Array<UInt16>

    public init(_ keys: UInt16...) {
        var batch:Array<UInt16> = []
        for key in keys {
            batch.append(key)
        }
        self.batch = batch
    }
}

public typealias KeySet = Array<UInt16>

public func Parser(keyset:String) -> Array<KeySet> {
    var set: Array<KeySet> = [] // [[0x00]]
    for c in keyset {
        if Regex("[a-z]").test(String(c)) {
            let keys:KeySet = KeyBatch(lookupKey(c)).batch
            set.append(keys)
        }
        
        if Regex("[A-Z]").test(String(c)) {
            let keys:KeySet = [KeyCode["Shift"]!, lookupKey(c)]
            set.append(keys)
        }
    }
    return set
}

internal func lookupKey(char: Character) -> UInt16 {
    let lookup = String(char).uppercaseString
    return KeyCode[lookup]!
}
// handle modifier key sequences:
// special = mystring.match(<.*>)
// special = - -> [[]]
// special = [[1,2]]
// return [[1,2]], 7 (number of characters)

/// "gg<C-v>" -> [[KeyCode.G], [KeyCode.G], [KeyCode.Control, KeyCode.V]]
//  "<Enter>" -> [[KeyCode.Enter]]