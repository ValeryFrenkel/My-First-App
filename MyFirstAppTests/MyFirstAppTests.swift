//
//  Covid19Tests.swift
//  Covid19Tests
//
//  Created by Valery Frenkel on 1/26/21.
//

import XCTest

@testable import My_First_App

class Covid19Tests: XCTestCase {
    
    var validator: LoginFieldsValidator!
        
        override func setUpWithError() throws {
            validator = LoginFieldsValidator()
    }

    override func tearDownWithError() throws {
       validator = nil
    }

    func testThatOnFilledFieldCheckPassed() throws {
        let result = validator.validator(usernameTextField: "123", passwordTextField: "123")
        assert(result)
    }

    func testThatOnEmptyFieldsCheckFailed() throws {
        let result = validator.validator(usernameTextField: "", passwordTextField: "")
        assert(result)
    }

}
