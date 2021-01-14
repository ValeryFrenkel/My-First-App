//
//  DataValidation.swift
//  My First App
//
//  Created by Valery Frenkel on 1/14/21.
//

import Foundation
import UIKit

protocol FieldValidator {
    func validator(usernameTextField: String, passwordTextField: String) -> Bool
}

class CredentialsFieldsValidator {
    
    func validator(usernameTextField: String, passwordTextField: String) -> Bool {
        if usernameTextField != "" && passwordTextField != "" {
            return true
        } else {
            return false
        }
    }
}
    
    

