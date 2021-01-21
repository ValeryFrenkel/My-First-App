//
//  EventListener.swift
//  My First App
//
//  Created by Valery Frenkel on 1/21/21.
//

import Foundation

protocol EventManager {
    func subscribe(listener: Listener)
    func notify()
}
