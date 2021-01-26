//
//  Covid19Tests.swift
//  Covid19Tests
//
//  Created by Valery Frenkel on 1/26/21.
//

import XCTest

@testable import My_First_App

class MyFirstAppTests: XCTestCase {
    
    var validator: LoginFieldsValidator!
        
        override func setUpWithError() throws {
            validator = LoginFieldsValidator()
    }

    override func tearDownWithError() throws {
       validator = nil
    }

    func testThatBothFieldsAreFilled() throws {
        let result = validator.validator(usernameTextField: "vfrenkel", passwordTextField: "qwerty123")
        XCTAssertFalse(result)
    }

    func testThatBothFieldsAreEmpty() throws {
        let result = validator.validator(usernameTextField: "", passwordTextField: "")
        XCTAssertFalse(result)
    }
    
    func testThatUsernameFieldIsEmpty() throws {
        let result = validator.validator(usernameTextField: "", passwordTextField: "qwerty123")
        XCTAssertFalse(result)
    }
    
    func testThatPasswordFieldIsEmpty() throws {
        let result = validator.validator(usernameTextField: "vfrenkel", passwordTextField: "")
        XCTAssertFalse(result)
    }

}
