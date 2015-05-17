//
//  Parser.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/10/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation
import Dollar

// from http://benscheirman.com/2014/06/regex-in-swift/, with the case-insensitve flag removed
class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.internalExpression = NSRegularExpression(pattern: pattern, options: nil, error: &error)!
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, count(input)))
        return matches.count > 0
    }
}

class KeyBatch {
    let batch:Array<UInt16>

    init(_ keys: UInt16...) {
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
//    println("---- PARSER CALLED")
    if(count(keyset) == 1) {
        return checkSingleChar(keyset, set)
    } else {
        return parseKeys(set, keyset)
    }
}

internal func parseKeys(set: Array<KeySet>, remaining:String) -> Array<KeySet> {
    if(remaining == "") {
        return set
    } else {
        var updatedSet = set
        var nextString = ""
        let firstChar = (remaining as NSString).substringToIndex(1)
        if (firstChar == "<") {
            // We have us a sequence!
            (updatedSet, nextString) = parseCombo(set, remaining)
        } else {
            updatedSet = checkSingleChar(firstChar, set)
            nextString = (remaining as NSString).substringFromIndex(1)
        }
        return parseKeys(updatedSet, nextString)
    }
}

internal func checkSingleChar(c: String, oldSet:Array<KeySet>) -> Array<KeySet> {
    var set: Array<KeySet> = oldSet
    let symbolsRequiringShift = ["<", ">", "{", "}", ")", "(", "!", "|", ":", "`", "'", "&", "%", "?", "*", "~", "@", "$", "^", "+", "#"]

    if (Regex("[A-Z]").test(c) || $.contains(symbolsRequiringShift, value: c)) { // test for capital letters or the symbols above
        let keys:KeySet = [KeyCode["Shift"]!, lookupKey(c)]
        set.append(keys)
    } else { // lowercase and symbols
        let keys:KeySet = KeyBatch(lookupKey(c)).batch
        set.append(keys)
    }
    return set
}

internal func parseCombo(oldSet:Array<KeySet>, string:String) -> (Array<KeySet>, String) {
    var set = oldSet
    var keys:KeySet = []
    let endingChar = (string as NSString).rangeOfString(">")
    if(endingChar.length > 0) {
        let comboString = (string as NSString).substringWithRange(NSMakeRange(1,endingChar.location-1))
        let comboArray = comboString.componentsSeparatedByString("-")
        for c in comboArray {
            keys.append(lookupKey(c))
        }
        set.append(keys)
        return (set, (string as NSString).substringFromIndex(endingChar.location+1))
    } else {
        // We don't actually have a combo string, just a < action
        keys.append(lookupKey("<"))
        set.append(keys)
        return (set, (string as NSString).substringFromIndex(1))
    }

}

internal func lookupKey(char: String) -> UInt16 {
    if let keyCode = KeyCode[char] {
        return keyCode
    } else {
        let lookup = char.uppercaseString
        return KeyCode[lookup]!
    }
}