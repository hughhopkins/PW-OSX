//
//  AppDelegate.swift
//  PW
//
//  Created by hugh on 04/03/2016.
//  Copyright © 2016 hugh. All rights reserved.
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

    @IBAction func menubarPWHelp(sender: AnyObject) {
        if let checkURL = NSURL(string: "http://pwapp.io/about.html?utm_source=OSX&utm_medium=link&utm_content=menubar-help&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }

    @IBAction func menubarPWSite(sender: AnyObject) {
        if let checkURL = NSURL(string: "http://pwapp.io/?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }
    @IBAction func menubarGitHub(sender: AnyObject) {
        if let checkURL = NSURL(string: "https://github.com/hughhopkins/PW-OSX?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }
    @IBAction func menubarTwitter(sender: AnyObject) {
        if let checkURL = NSURL(string: "https://twitter.com/pwappio?utm_source=OSX&utm_medium=link&utm_content=menubar-site&utm_campaign=OSX") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }

}

