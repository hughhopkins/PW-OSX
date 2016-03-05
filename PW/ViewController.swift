//
//  ViewController.swift
//  PW
//
//  Created by hugh on 04/03/2016.
//  Copyright © 2016 hugh. All rights reserved.
//

import Cocoa
import CryptoSwift

class ViewController: NSViewController {
    
    var timer = NSTimer.init()

    @IBOutlet weak var pwOutput: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "autoUpdate", userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBOutlet weak var serviceInput: NSTextField!

    @IBOutlet weak var passwordInput: NSSecureTextField!
    
    // declare vars
    var pw: String = ""
    var srv: String = ""
    var srvLower: String = ""
    var pass: String = ""
    var pwFirst: String = ""
    var pwLowered: String = ""
    var pwNew: String = ""
    var pwHash: String = ""
    var pwString: String = ""
    
    // PW Code
    func autoUpdate() {
        var srv: String = serviceInput.stringValue
        var pass: String = passwordInput.stringValue
        var srvLower = srv.lowercaseString
        var pw = "\(srvLower)" + "||" + "\(pass)" + "||"
        var pwHash = pw.sha1()
        var pwString = String(pwHash)
        var pwLowered = pwString.lowercaseString
        var index = 0
        
        func updateTwo() {
            for string in pwLowered.characters {
                let s = "\(string)"
                if index%2 == 0 {
                    pwNew += s.uppercaseString
                } else {
                    pwNew += s
                }
                index++;
            }
            pwOutput.stringValue = pwNew
            let pasteboard = NSPasteboard.generalPasteboard()
            pasteboard.clearContents()
            pasteboard.setString(pwOutput.stringValue, forType: NSPasteboardTypeString)
        }
        updateTwo()
        
        func updateThree() {
            pwNew = ""
        }
        updateThree()
    }
    // end

}

