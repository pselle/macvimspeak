//
//  ViewController.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 2/27/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechRecognizerDelegate {
    let speechListener = NSSpeechRecognizer()
    let s = NSSpeechSynthesizer()
    var isSpeaking = false
    let src = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()
    
    @IBAction func ListenButton(sender: AnyObject) {
        if(!isSpeaking) {
            speechListener.startListening()
            isSpeaking = true
        } else {
            speechListener.stopListening()
            isSpeaking = false
        }
        println("huzzah button!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        speechListener.commands = ["select", "word", "delete"]
        speechListener.listensInForegroundOnly = false
        speechListener.delegate = self
        
        println(one)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: AnyObject?) {
        println("Got to speech recognizer")
        switch command as String {
        case "select":
             // type s
            println("select")
            let v = CGEventCreateKeyboardEvent(src, 9, true).takeRetainedValue()
            let vu = CGEventCreateKeyboardEvent(src, 9, false).takeRetainedValue()
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), v)
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), vu)
            println("select")
            break
        case "word":
            let w = CGEventCreateKeyboardEvent(src, 0x0D, true).takeRetainedValue()
            let wu = CGEventCreateKeyboardEvent(src, 0x0D, false).takeRetainedValue()
            println("word")
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), w)
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), wu)
            break
        case "delete":
            let d = CGEventCreateKeyboardEvent(src, 0x33, true).takeRetainedValue()
            let du = CGEventCreateKeyboardEvent(src, 0x33, false).takeRetainedValue()
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), d)
            CGEventPost(CGEventTapLocation(kCGHIDEventTap), du)
            break
        default:
            println("default")
        }
        if(command as String == "hello") {
            s.startSpeakingString("Hello Pam")
        }
        
    }
}

