//
//  AppDelegate.swift
//  MacVimSpeak
//
//  Created by Pam Selle on 2/27/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var showOnTopMenuItem: NSMenuItem!
    @IBOutlet weak var showAsNormalMenuItem: NSMenuItem!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        turnOnFloat()
    }

    @IBAction func showWindowOnTop(sender: AnyObject) {
            turnOnFloat()
    }
    
    func turnOnFloat() {
        showOnTopMenuItem.state = NSOnState
        showAsNormalMenuItem.state = NSOffState
        let window: NSWindow = NSApp.windows[0] as! NSWindow
        window.level = Int(CGWindowLevelForKey(CGWindowLevelKey(kCGStatusWindowLevelKey)))

    }
    
    @IBAction func showWindowAsNormal(sender: AnyObject) {
        let window: NSWindow = NSApp.windows[0] as! NSWindow
        window.level = Int(CGWindowLevelForKey(CGWindowLevelKey(kCGNormalWindowLevelKey)))
        showOnTopMenuItem.state = NSOffState
        showAsNormalMenuItem.state = NSOnState


    }
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}
