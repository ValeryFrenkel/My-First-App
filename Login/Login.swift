//
//  ViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/1/20.
//

import UIKit
import Swinject

struct User: Codable {
    let username : String
    let email : String
}

struct UserManager {
    static var username = ""
}

class ViewController: UIViewController {

    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var usernameTextFieldTopConstraint: NSLayoutConstraint!
    private let usernameKey = "lastSuccessLogin"
    
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      usernameTextFieldTopConstraint.constant = 300

      UIView.animate(withDuration: 1.5) { [weak self] in
        self?.view.layoutIfNeeded()
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isHidden = true
        
        usernameTextField.addTarget(self, action: #selector(buttonDidAppear), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(buttonDidAppear), for: .editingChanged)
        
        
        let user = User (username: "Vasya", email: "vasya@apple.com")
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(user)
        UserDefaults.standard.setValue(data, forKey: usernameKey)
        
        let lastSuccessLoginData = UserDefaults.standard.data(forKey: usernameKey)
        
        if let lastSuccessLoginData = lastSuccessLoginData {
            
        let decoder = PropertyListDecoder()
            
        let restoredUser = try? decoder.decode(User.self, from: lastSuccessLoginData)
        
        print(restoredUser)
        }
        
        loginButton.setTitle(NSLocalizedString("Log in", comment: "Log in"),
                             for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      usernameTextFieldTopConstraint.constant = view.bounds.height
    }
    

    @IBAction private func loginButtonSelected(_ sender: UIButton) {
        UserManager.username = usernameTextField.text!
        let viewController = TabBar ()
        viewController.textLabel = usernameTextField.text ?? ""
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func buttonDidAppear ( _ sender : UITextField ){
        if usernameTextField.text == "" || passwordTextField.text == ""{
            loginButton.isHidden = true
        }else{
            loginButton.isHidden = false
        }
    }
    
    
    
    
    
}

