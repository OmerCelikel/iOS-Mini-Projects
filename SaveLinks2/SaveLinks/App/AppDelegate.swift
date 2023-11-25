//
//  AppDelegate.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 31.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let userDefaults = UserDefaults.standard
        
        if !userDefaults.bool(forKey: "hasLaunchedBefore") {

            let onboardStoryboard = UIStoryboard(name: "Onboard", bundle: nil)
            if let onboardViewController = onboardStoryboard.instantiateInitialViewController() {
                window?.rootViewController = onboardViewController
            }
            
            userDefaults.set(true, forKey: "hasLaunchedBefore")
        } else {
            let linksDashboardStoryboard = UIStoryboard(name: "LinksDashboard", bundle: nil)
            if let linksDashboardViewController = linksDashboardStoryboard.instantiateInitialViewController() {
                window?.rootViewController = linksDashboardViewController
            }
        }
        
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

