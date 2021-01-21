//
//  ListEventManager.swift
//  My First App
//
//  Created by Valery Frenkel on 1/21/21.
//

import Foundation

class ListEventManager: EventManager {
    
    static var singleton = ListEventManager()
    
    private var listeners = [Listener]()
    
    func subscribe(listener: Listener) {
        listeners.append(listener)
    }
    
    func notify() {
        for listner in listeners {
            listner.update()
        }
    }
}
