//
//  ViewController.swift
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
<<<<<<< HEAD
=======

>>>>>>> master
    @IBOutlet weak var serviceInput: NSTextField!
    @IBAction func serviceInputEdit(sender: AnyObject) {
        update()
    }
<<<<<<< HEAD
    
=======

>>>>>>> master
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
        var pwHash = pw.sha1()
        var pwString = String(pwHash)
        var pwLowered = pwString.lowercaseString
        var index = 0
<<<<<<< HEAD

=======
        
>>>>>>> master
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

