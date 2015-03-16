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
