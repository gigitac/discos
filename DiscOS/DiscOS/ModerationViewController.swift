//
//  ModerationViewController.swift
//  DiscOS
//
//  Created by admin on 8/5/20.
//  Copyright © 2020 Aaron Peskin. All rights reserved.
//

import UIKit

class ModerationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var kickUser: UITextField!
    @IBOutlet weak var banUser: UITextField!
    @IBOutlet weak var unbanUser: UITextField!
    @IBOutlet weak var reasonFor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kickUser.delegate = self
        banUser.delegate = self
        unbanUser.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            if textField == kickUser {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740647108947738725/vTWpELVjjIm9joVDRhhY0-8gsf_b3_g7taWfrryBmJ5DtaqD3gedm9BvKR3zBMwqLTWP", parameters: [
                    "content": "\(ViewController.currentBotToken),\(kickUser.text!),\(ViewController.currentServerID),\(reasonFor.text!)"
                ])
            }
            if textField == banUser {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740646818488254464/gYz7W8uhX7PIB2NRDHFPCBt1ZP6mNXjlt17d0Tlz8tRL2CnA-obMw667Gfng5c8327w6", parameters: [
                    "content": "\(ViewController.currentBotToken),\(banUser.text!),\(ViewController.currentServerID),\(reasonFor.text!)"
                ])
            }
            if textField == unbanUser {
                postRequest(urlLink: "https://discordapp.com/api/webhooks/740646992719380481/VI4KGEF2QBzbSoVqMfmUVDDlYHeDVaMKauRJtbvjrDwHUXiQoWwVQ61JXYCp2cNGMzD6", parameters: [
                    "content": "\(ViewController.currentBotToken),\(unbanUser.text!),\(ViewController.currentServerID),\(reasonFor.text!)"
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
