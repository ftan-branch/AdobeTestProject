//
//  AppDelegate.swift
//  AdobeTestProject
//
//  Created by Frank Tan on 9/3/20.
//  Copyright © 2020 Frank Tan. All rights reserved.
//

import UIKit
import ACPCore
import AdobeBranchExtension.AdobeBranchExtension
import ACPAnalytics
import ACPUserProfile
import ACPGriffon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ACPCore.setLogLevel(.debug)
        ACPCore.configure(withAppId: "d10f76259195/0d70362f5752/launch-999223127273-development")
        ACPAnalytics.registerExtension()
        ACPIdentity.registerExtension()
        ACPLifecycle.registerExtension()
        ACPSignal.registerExtension()
        ACPUserProfile.registerExtension()
        ACPGriffon.registerExtension()
        
        do {
            try ACPCore.registerExtension(AdobeBranchExtension.self)
        } catch  {
            print("error registering AdobeBranchExtension")
        }
        
        ACPCore.start {
            ACPCore.lifecycleStart(nil)
        }
        
        AdobeBranchExtension.configureEventTypes(nil, andEventSources: nil)
        
        AdobeBranchExtension.initSession(launchOptions: [:]) { (params, error) in
            if let error = error {
                print("error! message: ", error)
                return
            }
            
            guard let params = params else {
                print("error unwrapping params")
                return
            }
            
            print("deeplinking params")
            print(params)
        }

        //        xcrun simctl openurl booted 'adobetestproject://hello?adb_validation_sessionid=07bfa87d-4fb3-4170-85bb-4dea46563c6c'
        return true
    }
    
/*
     This does not apply since I'm using SceneDelegate
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        do {
            ACPGriffon.startSession(url)
            return false
        }
    }
     */

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

