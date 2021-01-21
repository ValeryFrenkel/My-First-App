//
//  LogoutListener.swift
//  My First App
//
//  Created by Valery Frenkel on 1/21/21.
//

import Foundation

class Logger: Listener {
    init(eventManager: EventManager) {
        eventManager.subscribe(listener: self)
    }
    
    func update() {
        print("Successful logout")
    }
}
