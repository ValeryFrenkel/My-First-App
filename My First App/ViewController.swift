//
//  ViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/1/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextFieldTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      usernameTextFieldTopConstraint.constant = 300

      UIView.animate(withDuration: 3.5) { [weak self] in
        self?.view.layoutIfNeeded()
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isHidden = true
        
        usernameTextField.addTarget(self, action: #selector(buttonDidAppear), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(buttonDidAppear), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      usernameTextFieldTopConstraint.constant = view.bounds.height
    }
    

    @IBAction func loginButtonSelected(_ sender: UIButton) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
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

