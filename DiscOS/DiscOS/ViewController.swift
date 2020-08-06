//
//  ViewController.swift
//  DiscOS
//
//  Created by admin on 8/4/20.
//  Copyright © 2020 Aaron Peskin. All rights reserved.
//Moderation: kick, ban, unban
//utility: add role, remove, create channel, delete channel
//Interaction: send message

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var botToken: UITextField!
    @IBOutlet weak var serverID: UITextField!
    @IBOutlet weak var moderationOptions: UIButton!
    @IBOutlet weak var utilityOptions: UIButton!
    @IBOutlet weak var interactionOptions: UIButton!
    
    static var currentBotToken:String = ""
    static var currentServerID:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botToken.delegate = self
        serverID.delegate = self
        moderationOptions.isHidden = true
        utilityOptions.isHidden = true
        interactionOptions.isHidden = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        ViewController.currentBotToken = botToken.text!
        ViewController.currentServerID = serverID.text!
        
        if botToken.text! != "" && serverID.text! != "" {
            moderationOptions.isHidden = false
            utilityOptions.isHidden = false
        }
        else {
            moderationOptions.isHidden = true
            utilityOptions.isHidden = true
        }
        
        if botToken.text != "" {
            interactionOptions.isHidden = false
        }
        else {
            interactionOptions.isHidden = true
        }
        
        return true
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

