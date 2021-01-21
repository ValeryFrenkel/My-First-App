//
//  LoginFieldsValidator.swift
//  My First App
//
//  Created by Valery Frenkel on 1/12/21.
//

import Foundation
import UIKit

class LoginFieldsValidator {
    
    func validator(usernameTextField: String, passwordTextField: String) -> Bool {
        if usernameTextField != "" && passwordTextField != "" {
            return true
        } else {
            return false
        }
    }
}
