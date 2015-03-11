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

        speechListener.commands = vimCommands
        speechListener.listensInForegroundOnly = false
        speechListener.delegate = self
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: AnyObject?) {
        println("Got to speech recognizer")
        // if state is awake and command is Shush
        // Change commands to "Yo" to wake up
        // set state to sleep
        
        // else
        if let keyStrokes = completeCommands[command as String] {
            executeKeyCommands(keyStrokes)
        } else {
            println("Command not found!")
        }
        
        // else state is asleep
        // if command is Yo, then wake up and set commands to the commands

        if(command as String == "hello") {
            s.startSpeakingString("Hello Pam")
        }
        
    }
}

