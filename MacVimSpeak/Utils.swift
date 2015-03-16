//
//  Utils.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 3/16/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Foundation

func mapDict<S, T, U>(myDict:[S:T], f: T -> U) -> [S:U] {
    var newDict = [S: U]()
    for (key, val) in myDict {
        newDict[key] = f(val)
    }
    return newDict
}

// Takes 2 dictionaries and combines them with an optional separator for the keys
func combineDictionaries(dict1: [String:String], dict2: [String:String], separator: String?) -> [String:String] {
    var combinedDictionary = [String:String]()
    var combinedKey: String, combinedVal:String
    for i in dict1 {
        for j in dict2 {
            if((separator) != nil) {
                combinedKey = i.0 + separator! + j.0
            } else {
                combinedKey = i.0 + j.0
            }
            combinedVal = i.1 + j.1
            combinedDictionary[combinedKey] = combinedVal
        }
    }
    return combinedDictionary
}