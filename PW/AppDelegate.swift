//
//  AppDelegate.swift
//  PW
//
//  Created by hugh on 04/03/2016.
//  Copyright © 2016 hugh. All rights reserved.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ notification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func menubarPWHelp(_ sender: Any) {
        if let checkURL = URL(string: "http://pwapp.io/about.html?utm_source=OSX&utm_medium=link&utm_content=menubar-help&utm_campaign=OSX") {
            NSWorkspace.shared.open(checkURL)
        }
    }

    @IBAction func menubarPWSite(_ sender: Any) {
        if let checkURL = URL(string: "http://pwapp.io/?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            NSWorkspace.shared.open(checkURL)
        }
    }

    @IBAction func menubarGitHub(_ sender: Any) {
        if let checkURL = URL(string: "https://github.com/hughhopkins/PW-OSX?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            NSWorkspace.shared.open(checkURL)
        }
    }

    @IBAction func menubarTwitter(_ sender: Any) {
        if let checkURL = URL(string: "https://twitter.com/pwappio?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            NSWorkspace.shared.open(checkURL)
        }
    }
}

