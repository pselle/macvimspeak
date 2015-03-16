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
    println("---- PARSER CALLED")
    if(countElements(keyset) == 1) {
        return checkSingleChar(keyset, set)
    } else {
        return inner(set, keyset)
    }
}

public func inner(set: Array<KeySet>, remaining:String) -> Array<KeySet> {
    println("inner", remaining)
    if(remaining == "") {
        return set
    } else {
        var updatedSet = set
        var nextString = ""
        let firstChar = (remaining as NSString).substringToIndex(1)
        if (firstChar == "<") {
            // We have us a sequence!
            (updatedSet, nextString) = parseCombo(set, remaining) // setting this to updatedSet and nextString didn't work
        } else {
            updatedSet = checkSingleChar(firstChar, set)
            println(updatedSet)
            nextString = (remaining as NSString).substringFromIndex(1)
        }
        return inner(updatedSet, nextString)
    }
}

internal func checkSingleChar(c: String, oldSet:Array<KeySet>) -> Array<KeySet> {
    var set: Array<KeySet> = oldSet
    println(c)
    if Regex("[A-Z]").test(c) { // test for capital letters
        let keys:KeySet = [KeyCode["Shift"]!, lookupKey(c)]
        set.append(keys)
    } else { // lowercase and symbols
        let keys:KeySet = KeyBatch(lookupKey(c)).batch
        set.append(keys)
    }
    return set
}

func parseCombo(oldSet:Array<KeySet>, string:String) -> (Array<KeySet>, String) {
    var set = oldSet
    let endingChar = (string as NSString).rangeOfString(">")
    let comboString = (string as NSString).substringWithRange(NSMakeRange(1,endingChar.location-1))
    println(comboString)
    let comboArray = comboString.componentsSeparatedByString("-")
    var keys:KeySet = []
    for c in comboArray {
        keys.append(lookupKey(c))
    }
    set.append(keys)
    return (set, (string as NSString).substringFromIndex(endingChar.location+1))
}

internal func lookupKey(char: String) -> UInt16 {
    if let keyCode = KeyCode[char] {
        return keyCode
    } else {
        let lookup = char.uppercaseString
        return KeyCode[lookup]!
    }
}
// handle modifier key sequences:
// special = mystring.match(<.*>)
// special = - -> [[]]
// special = [[1,2]]
// return [[1,2]], 7 (number of characters)

/// "gg<C-v>" -> [[KeyCode.G], [KeyCode.G], [KeyCode.Control, KeyCode.V]]
//  "<Enter>" -> [[KeyCode.Enter]]