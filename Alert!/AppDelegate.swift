//
//  AppDelegate.swift
//  HaventDecidedYet
//
//  Created by Abhishek Tiwari on 05/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(Realm.Configuration.defaultConfiguration.fileURL) //prints the file path
        do{
            let realm = try Realm()
        }catch{
            print(error)
        }
      
        return true
    }
}


