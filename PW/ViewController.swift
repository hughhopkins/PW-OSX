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
    
    var timer = Timer.init()

    @IBOutlet weak var pwOutput: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector(("autoUpdate")), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
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
        var srvLower = srv.lowercased()
        var pw = "\(srvLower)" + "||" + "\(pass)" + "||"
        var pwHash = pw.sha1()
        var pwString = String(pwHash)
        var pwLowered = pwString.lowercased()
        var index = 0
        
        func updateTwo() {
            for string in pwLowered {
                let s = "\(string)"
                if index%2 == 0 {
                    pwNew += s.uppercased()
                } else {
                    pwNew += s
                }
                index += 1
            }
            pwOutput.stringValue = pwNew
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(pwOutput.stringValue, forType: NSPasteboard.PasteboardType.string)
        }
        updateTwo()
        
        func updateThree() {
            pwNew = ""
        }
        updateThree()
    }
    // end

}

