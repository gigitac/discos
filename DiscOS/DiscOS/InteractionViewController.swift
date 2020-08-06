//
//  InteractionViewController.swift
//  DiscOS
//
//  Created by admin on 8/5/20.
//  Copyright © 2020 Aaron Peskin. All rights reserved.
//

import UIKit

class InteractionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sendMessage: UITextField!
    @IBOutlet weak var channelID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMessage.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        if textField == sendMessage {
            print(ViewController.currentBotToken)
            print(channelID.text!)
            print(sendMessage.text!)
            
            postRequest(urlLink: "https://discordapp.com/api/webhooks/740647107874127904/M8Nv1rY1h0YsSnntAHGMU34-Db38iB0rOBMpq5B0PZZKTZNyEO7NgsdctzZQtf_Wg6Tf", parameters: [
                    "content": "\(ViewController.currentBotToken),\(channelID.text!),\(sendMessage.text!)"
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
