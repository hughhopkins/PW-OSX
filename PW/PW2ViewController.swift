import CryptoSwift

class PW2ViewController: NSViewController {
    
    @IBOutlet weak var serviceInput: NSTextField!
    @IBOutlet weak var passwordInput: NSSecureTextField!
    @IBOutlet weak var pwOutput: NSTextField!
    @IBOutlet weak var buttonCopy: NSButton!
    @IBOutlet weak var buttonCopy15Char: NSButton!
    @IBOutlet weak var buttonWebsiteLink: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure text fields
        serviceInput.focusRingType = .none
        passwordInput.focusRingType = .none
        
        // Configure buttons
        [buttonCopy, buttonCopy15Char, buttonWebsiteLink].forEach { button in
            button?.wantsLayer = true
            button?.layer?.cornerRadius = 5
        }
        
        // Configure pwOutput
        pwOutput.isSelectable = true
        pwOutput.isEditable = false
        pwOutput.maximumNumberOfLines = 4
        pwOutput.cell?.lineBreakMode = .byCharWrapping
        
        showHide()
    }
    
    @IBAction func serviceInputEdit(_ sender: Any) {
        update()
    }
    
    @IBAction func passwordInputEdit(_ sender: Any) {
        update()
    }
    
    @IBAction func copyFullPassword(_ sender: Any) {
        let password = pwOutput.stringValue
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(password, forType: .string)
    }
    
    @IBAction func copy15CharPassword(_ sender: Any) {
        let fullPassword = pwOutput.stringValue
        let shortened = String(fullPassword.prefix(15))
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(shortened, forType: .string)
    }
    
    @IBAction func websiteLink(_ sender: Any) {
        if let url = URL(string: "http://pwapp.io/?utm_source=OSX&utm_medium=link&utm_content=footer&utm_campaign=OSX") {
            NSWorkspace.shared.open(url)
        }
    }
    
    private func update() {
        showHide()
        updatePassword()
    }
    
    private func showHide() {
        let shouldShow = !serviceInput.stringValue.isEmpty && !passwordInput.stringValue.isEmpty
        pwOutput.isHidden = !shouldShow
        buttonCopy.isHidden = !shouldShow
        buttonCopy15Char.isHidden = !shouldShow
    }
    
    private func updatePassword() {
        guard let service = serviceInput.stringValue,
              let password = passwordInput.stringValue,
              !service.isEmpty,
              !password.isEmpty else {
            pwOutput.stringValue = ""
            return
        }
        
        // Combine inputs and compute SHA256 hash
        let inputString = "\(service.lowercased())||\(password)||"
        let hash = inputString.sha256()
        
        // Character sets for required categories
        let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let digits    = "0123456789"
        let specials  = "!@#$%^&*()-_=+[]{}|;:,.<>/?"
        let allChars  = uppercase + lowercase + digits + specials
        
        // Helper: deterministically pick a character from a given set using a hash substring
        func pickChar(from set: String, using hashSubstring: String) -> Character {
            if let num = Int(hashSubstring, radix: 16) {
                return set[set.index(set.startIndex, offsetBy: num % set.count)]
            }
            return set[set.startIndex] // fallback
        }
        
        // Generate characters using different parts of the hash
        var pwChars: [Character] = []
        
        // Ensure at least one of each required type within first 10 chars
        pwChars.append(pickChar(from: uppercase, using: String(hash.prefix(2))))
        pwChars.append(pickChar(from: lowercase, using: String(hash[hash.index(hash.startIndex, offsetBy: 2)..<hash.index(hash.startIndex, offsetBy: 4)])))
        pwChars.append(pickChar(from: digits, using: String(hash[hash.index(hash.startIndex, offsetBy: 4)..<hash.index(hash.startIndex, offsetBy: 6)])))
        pwChars.append(pickChar(from: specials, using: String(hash[hash.index(hash.startIndex, offsetBy: 6)..<hash.index(hash.startIndex, offsetBy: 8)])))
        
        // Fill positions 5-10 with random chars
        let firstTenRemaining = 6 // We already have 4 chars, need 6 more to reach 10
        let firstTenChunks = stride(from: 8, to: min(hash.count - 1, 8 + (firstTenRemaining * 2)), by: 2).map {
            String(hash[hash.index(hash.startIndex, offsetBy: $0)..<hash.index(hash.startIndex, offsetBy: $0 + 2)])
        }
        
        for chunk in firstTenChunks {
            pwChars.append(pickChar(from: allChars, using: chunk))
        }
        
        // Fill remaining positions (11-40)
        let remainingLength = 30 // to make total of 40 chars
        let remainingChunks = stride(from: 20, to: min(hash.count - 1, 20 + (remainingLength * 2)), by: 2).map {
            String(hash[hash.index(hash.startIndex, offsetBy: $0)..<hash.index(hash.startIndex, offsetBy: $0 + 2)])
        }
        
        for chunk in remainingChunks {
            pwChars.append(pickChar(from: allChars, using: chunk))
        }
        
        // Replace random shuffle with deterministic shuffle using the hash
        let shuffledPassword = deterministicShuffle(array: pwChars, using: hash)
        pwOutput.stringValue = String(shuffledPassword)
    }
    
    private func deterministicShuffle(array: [Character], using hash: String) -> [Character] {
        var result = array
        let n = result.count
        
        // Use chunks of the hash to generate swap indices
        for i in 0..<(n-1) {
            // Get 2 characters from hash at position (i*2) % hash.length
            let hashIndex = (i * 2) % (hash.count - 1)
            let hashChunk = String(hash[hash.index(hash.startIndex, offsetBy: hashIndex)..<hash.index(hash.startIndex, offsetBy: hashIndex + 2)])
            
            // Convert hash chunk to number and use it to determine swap index
            if let num = Int(hashChunk, radix: 16) {
                let j = i + (num % (n - i))  // This ensures we only swap with remaining positions
                result.swapAt(i, j)
            }
        }
        
        return result
    }
} 