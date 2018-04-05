//
//  LoginViewController.swift
//  Coding Challenge
//
//  Created by Ricardo Duarte on 2018-04-04.
//  Copyright © 2018 KhromosTech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameTextField{
            self.usernameTextField.resignFirstResponder()
        }else {
            self.passwordTextField.resignFirstResponder()
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToImageVC"{
            let nextScene = segue.destination as? ImageViewController
            nextScene!.username = self.usernameTextField.text!
        }
    }
    
    func alertEmptyField(titleText: String, messageText: String){
        
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        if (self.usernameTextField.text == "") || self.usernameTextField.text!.count < 8 {
            self.alertEmptyField(titleText: "Login Error", messageText: "Username have to have more than 8 characters")
            self.usernameTextField.backgroundColor = UIColor.red
            print("Username error")
            print("\(self.usernameTextField.text!.count)")
        }
        
        if (self.passwordTextField.text == "") || (self.passwordTextField.text!.count < 8){
            self.alertEmptyField(titleText: "Login error", messageText: "Password have to have more than 8 characters")
            self.passwordTextField.backgroundColor = UIColor.red
            print("Password Error")
            print("\(self.passwordTextField.text!.count)")
        }
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: self.usernameTextField.text!, options: [], range: NSMakeRange(0, (self.usernameTextField.text?.characters.count)!)) != nil {
                self.alertEmptyField(titleText: "Login error", messageText: "Must not contain Number in Name")
                print("Username have numbers")
            } else {
                
            }
        }
        catch {
            
        }
    }
}
