//
//  AppDelegate.swift
//  PW
//
<<<<<<< HEAD
//  Created by Hugh Hopkins on 23/10/2015.
=======
//  Created by Hugh Hopkins on 28/10/2015.
>>>>>>> master
//  Copyright © 2015 io.pwapp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
<<<<<<< HEAD
=======

>>>>>>> master
    @IBAction func menubarPwSite(sender: AnyObject) {
        if let checkURL = NSURL(string: "http://pwapp.io/?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }

    @IBAction func menubarPwHelp(sender: AnyObject) {
        if let checkURL = NSURL(string: "http://pwapp.io/about.html?utm_source=OSX&utm_medium=link&utm_content=menubar-help&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }

}

