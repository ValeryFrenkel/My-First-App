//
//  AppDelegate.swift
//  My First App
//
//  Created by Valery Frenkel on 11/1/20.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var logger: Logger?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let container = Container()
        container.register(ApplicationStyle.self, name: "Day") {_ in ApplicationDayDesign() }
        container.register(ApplicationStyle.self, name: "Night") {_ in ApplicationNightDesign() }
        container.register(EventManager.self) {_ in ListEventManager()}.inObjectScope(.container)
        Dependencies.container = container
        
        logger = Logger(eventManager: Dependencies.container.resolve(EventManager.self)!)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

