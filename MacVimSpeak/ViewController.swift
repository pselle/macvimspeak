//
//  ViewController.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 2/27/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Cocoa

// Listening states
enum ListeningState {
    case Awake, Shushed, NotListening
}

class ViewController: NSViewController, NSSpeechRecognizerDelegate {
    lazy var speechListener: NSSpeechRecognizer = {
        let speechListener = NSSpeechRecognizer()
        speechListener.commands = self.vc.voiceCommands
        speechListener.listensInForegroundOnly = false
        speechListener.delegate = self
        return speechListener
    }()

//    let s = NSSpeechSynthesizer()
    let vc = VoiceCommands()
    var listeningState:ListeningState = .NotListening

    var isSpeaking:Bool! {
        didSet {
            if isSpeaking == true {
                speechListener.startListening()
                listeningState = .Awake
                view.layer?.backgroundColor = NSColor.greenColor().CGColor
                listeningButton.title = "Stop Listening"
            } else {
                speechListener.stopListening()
                listeningState = .NotListening
                view.layer?.backgroundColor = NSColor.redColor().CGColor
                listeningButton.title = "Start Listening"
            }
            commandDisplay.stringValue = ""
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

        isSpeaking = false
    }

    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: String!) {
        println("Got to speech recognizer", command)

        // Guard for sleep and wake up states
        switch (command, listeningState) {
        case ("wake up", .Shushed):
            commandDisplay.stringValue = "hello again!"
            listeningState = .Awake
            return
        case ("shush", .Awake):
            commandDisplay.stringValue = "shushed"
            listeningState = .Shushed
            return
        default:
            println("Processing keys")
        }

        if listeningState == .Shushed {
            return
        }
        
        // Execute key commands if we're good to go
        if let keyStrokes = vc.keyCodeCommands[command] {
            executeKeyCommands(keyStrokes)
            commandDisplay.stringValue = vc.allCommands[command]!
        } else {
            println("Command not found!")
        }

//        if(command as String == "hello") {
//            s.startSpeakingString("Hello Pam")
//        }
    }
}

