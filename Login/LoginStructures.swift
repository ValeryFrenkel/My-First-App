//
//  LoginStructures.swift
//  My First App
//
//  Created by Valery Frenkel on 2/18/21.
//

import UIKit

struct User: Codable {
    let username : String
    let email : String
}

struct UserManager {
    static var username = ""
}
