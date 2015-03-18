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
    let vc = VoiceCommands()
    var isSpeaking:Bool! {
        didSet {
            if isSpeaking == true {
                speechListener.startListening()
                view.layer?.backgroundColor = NSColor.greenColor().CGColor
                listeningButton.title = "Stop Listening"
            } else {
                speechListener.stopListening()
                view.layer?.backgroundColor = NSColor.redColor().CGColor
                listeningButton.title = "Start Listening"
            }
        }
    }
    @IBOutlet weak var listeningButton: NSButton!
    @IBOutlet weak var commandDisplay: NSTextField!
    
    @IBAction func ListenButton(sender: AnyObject) {
        isSpeaking = !isSpeaking
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        speechListener.commands = vc.voiceCommands
        speechListener.listensInForegroundOnly = false
        speechListener.delegate = self
        isSpeaking = false
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: String!) {
        println("Got to speech recognizer")
        if(command == "shush") {
            commandDisplay.stringValue = "shushed"
            speechListener.commands = ["wake up"]
        } else if (command == "wake up") {
            speechListener.commands = vc.voiceCommands
            commandDisplay.stringValue = ""
        } else {
            if let keyStrokes = vc.keyCodeCommands[command] {
                executeKeyCommands(keyStrokes)
                commandDisplay.stringValue = vc.allCommands[command]!
            } else {
                println("Command not found!")
            }
        }

        if(command as String == "hello") {
            s.startSpeakingString("Hello Pam")
        }
        
    }
}

