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

        speechListener.commands = vimCommands.keys.array //["select", "word", "delete"]
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
        executeKeyCommands(vimCommands[command as String]!)

        if(command as String == "hello") {
            s.startSpeakingString("Hello Pam")
        }
        
    }
}

