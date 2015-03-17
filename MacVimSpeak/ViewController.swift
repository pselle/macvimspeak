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
    @IBOutlet weak var listeningButton: NSButton!
    @IBOutlet weak var commandDisplay: NSTextField!
    
    @IBAction func ListenButton(sender: AnyObject) {
        toggleSpeakingStatus()
        println("huzzah button!")
    }

    func toggleSpeakingStatus() {
        if(!isSpeaking) {
            speechListener.startListening()
            listeningButton.title = "Stop Listening"
            isSpeaking = true
        } else {
            speechListener.stopListening()
            listeningButton.title = "Start Listening"
            isSpeaking = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        speechListener.commands = vimCommands + ["shush", "quiet-you"]
        speechListener.listensInForegroundOnly = false
        speechListener.delegate = self
        toggleSpeakingStatus()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: AnyObject?) {
        println("Got to speech recognizer")
        if(command as String == "shush" || command as String == "quiet-you") {
            speechListener.commands = ["wake up"]
        } else if (command as String == "wake up") {
            speechListener.commands = vimCommands
        } else {
            if let keyStrokes = completeCommands[command as String] {
                executeKeyCommands(keyStrokes)
                commandDisplay.stringValue = voiceCommands.allCommands[command as String]!
            } else {
                println("Command not found!")
            }
        }

        if(command as String == "hello") {
            s.startSpeakingString("Hello Pam")
        }
        
    }
}

