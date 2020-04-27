//
//  AppDelegate.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

    ///contains the objects that represent the database. calls the closure
    ///if the database doesn't exist then it will create it
    lazy var persistentContainer: NSPersistentContainer = {
        ///name of database
        let container = NSPersistentContainer(name: "Model")
        ///loads the database
        container.loadPersistentStores { (storeDescription, error) in
            ///if database can't be opened
            if let actualError = error as NSError? {
                fatalError("can't load database \(actualError): \(actualError.userInfo)")
            }
        }
            return container
    }()
    ///save any changes made to the database
    func saveContent(){
        let context = persistentContainer.viewContext
        ///if context has any changes try save the data
        if context.hasChanges{
            do{
                ///save data
                try context.save()
            }catch{
                let nserror = error as NSError
                ///alternate to forcefully crashing the app
                print("can't save data to database \(nserror): \(nserror.userInfo)")
            }
        }
    }
}

