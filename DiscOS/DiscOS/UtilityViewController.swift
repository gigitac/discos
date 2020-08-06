//
//  UtilityViewController.swift
//  DiscOS
//
//  Created by admin on 8/5/20.
//  Copyright © 2020 Aaron Peskin. All rights reserved.
//

import UIKit

class UtilityViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var giveRole: UITextField!
    @IBOutlet weak var removeRole: UITextField!
    @IBOutlet weak var createChannel: UITextField!
    @IBOutlet weak var deleteChannel: UITextField!
    @IBOutlet weak var roleID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giveRole.delegate = self
        removeRole.delegate = self
        createChannel.delegate = self
        deleteChannel.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            if textField == giveRole {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740647103872762006/vgdebzLhMOZLu0zFOaNVmqfW88nPMTKYg2NS1iETXu-Ts285CnjGXUToNcEvLCTz5G4M", parameters: [
                    "content": "\(ViewController.currentBotToken),\(roleID.text!),\(giveRole.text!),\(ViewController.currentServerID)"

                ])
            }
            if textField == removeRole {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740647100353740880/5GHiFeO2cDFsZ-bKNcE0mvy2q7Gq1VaOVSfwtGQ0que6PyUdW7019PW4n4D0FmZUR0Fz", parameters: [
                    "content": "\(ViewController.currentBotToken),\(roleID.text!),\(removeRole.text!),\(ViewController.currentServerID)"
                ])
            }
            if textField == createChannel {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740647088693575680/qunOy18rUhPp5mXq_YMo5pIWdhvm7tXSxAWGT37FKQKpqnldMT6nVX00qOLC0nCYx_Ir", parameters: [
                    "content": "\(ViewController.currentBotToken),\(createChannel.text!),\(ViewController.currentServerID)"
                ])
            }
            if textField == deleteChannel {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740647554496069785/B_Qilk9VP0ydP9MdNSJ8XXnpPfZZXgjbfC7IehKyoApDWBGt1_NBlHXFGDK9YkP-WmmR", parameters: [
                    "content": "\(ViewController.currentBotToken),\(deleteChannel.text!),\(ViewController.currentServerID)"
                ])
            }
      
            return true
        }
        
        func postRequest(urlLink: String, parameters: [String: Any]) {
            let url = URL(string: urlLink)!
            var request = URLRequest(url: url) //API
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST" //Client will be sending data
            request.httpBody = parameters.percentEncoded()

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
                }

                guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    return
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))") //Server side response
            }

            task.resume()
        }
        
    }
