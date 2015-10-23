//
//  ViewController.swift
//  PW
//
//  Created by Hugh Hopkins on 23/10/2015.
//  Copyright © 2015 io.pwapp. All rights reserved.
//

import Cocoa
import CryptoSwift

class ViewController: NSViewController {

    @IBOutlet weak var pwOutput: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBOutlet weak var serviceInput: NSTextField!
    @IBAction func serviceInputEdit(sender: AnyObject) {
        update()
    }
    
    @IBOutlet weak var passwordInput: NSSecureTextField!
    @IBAction func passwordInputEdit(sender: AnyObject) {
        update()
    }
    
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
    func update() {
        var srv: String = serviceInput.stringValue
        var pass: String = passwordInput.stringValue
        var srvLower = srv.lowercaseString
        var pw = "\(srvLower)" + "||" + "\(pass)" + "||"
        print(pw)
        var pwHash = pw.sha1()
        print(pwHash)
        var pwString = String(pwHash)
        var pwLowered = pwString.lowercaseString
        var index = 0

        
        func updateTwo() {
            for string in pwLowered.characters {
                var s = "\(string)"
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
        
//        func updateTwo() {
//            for (index, char) in enumerate(pwLowered) {
//                var s = "\(char)"
//                if index%2 == 0 {
//                    pwNew += s.uppercaseString
//                } else {
//                    pwNew += s
//                }
//            }
//            pwOutput.stringValue = pwNew
//            let pasteboard = NSPasteboard.generalPasteboard()
//            pasteboard.clearContents()
//            pasteboard.setString(pwOutput.stringValue, forType: NSPasteboardTypeString)
//        }
//        updateTwo()
//        
//        func updateThree() {
//            pwNew = ""
//        }
//        updateThree()
    }
    
    // end

}

