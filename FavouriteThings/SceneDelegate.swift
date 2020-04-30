//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    ///dictionary to store the UIImages
    static var imageDownloads: [String: UIImage] = [:]
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        
        ///variable for the AppDelegate. cast the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError("no app delegate")
        }
        let context = appDelegate.persistentContainer.viewContext

        ///create array for things
        var thingsArray: [Things] = [Things]()
        ///fetch the data from the persistent store  Things
        let thingsFetch: NSFetchRequest<Things> = Things.fetchRequest()
        ///instructions to be used by thingsFetch to define the order of the items
        let thingsSort: NSSortDescriptor = NSSortDescriptor(keyPath: \Things.listTitle, ascending: true)
        ///store instructions in array to be used for context.fetch
        thingsFetch.sortDescriptors = [thingsSort]
        do{
            ///returns an array of Things from the model
            thingsArray = try context.fetch(thingsFetch)
            
        }catch{
            print("didn't return anything")
        }
        ///check if things has any entries in it
        let count = thingsArray.count
        ///if it doesn't execute the following code
        if (count == 0){
            ///create "things" to store the entires
            if let things = NSEntityDescription.insertNewObject(forEntityName: "Things", into: context) as? Things{
                ///set the title attribute for the entity things to Favourite Things
                things.listTitle = "Favourite Things"
                ///append title to Things entity
                thingsArray.append(things)
                ///save context
                appDelegate.saveContent()
                ///create new objects with the following porperties
                let object1 = Thing(context: context)
                    object1.thingTitle = "Potato"
                    object1.subTitle = "subTitle"
                    object1.heading1 = "heading1"
                    object1.heading1Value = "A"
                    object1.heading2 = "heading2"
                    object1.heading2Value = "B"
                    object1.heading3 = "heading3"
                    object1.heading3Value = "C"
                    object1.image = "potato"
                    object1.imageURL = ""
                    object1.note = ""
                ///define the objects relationship to entity things
                    object1.list = things
                ///add object to things using the functions provided in the Things+CoreDataProperties.swift
                things.addToThings(object1)
                
                let object2 = Thing(context: context)
                    object2.thingTitle = "Potato"
                    object2.subTitle = "subTitle"
                    object2.heading1 = "heading1"
                    object2.heading1Value = "A"
                    object2.heading2 = "heading2"
                    object2.heading2Value = "B"
                    object2.heading3 = "heading3"
                    object2.heading3Value = "C"
                    object2.image = "potato"
                    object2.imageURL = ""
                    object2.note = ""
                    object2.list = things
                things.addToThings(object2)
                
                let object3 = Thing(context: context)
                    object3.thingTitle = "Potato"
                    object3.subTitle = "subTitle"
                    object3.heading1 = "heading1"
                    object3.heading1Value = "A"
                    object3.heading2 = "heading2"
                    object3.heading2Value = "B"
                    object3.heading3 = "heading3"
                    object3.heading3Value = "C"
                    object3.image = "potato"
                    object3.imageURL = ""
                    object3.note = ""
                    object3.list = things
                things.addToThings(object3)
                ///save the context to the CoreData
                appDelegate.saveContent()
            }
        }


        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        ///calls AppDelegate ensuring that it is actually the app delegate
        guard let appDelegate = UIApplication.shared.delegate as?
            AppDelegate else{
                fatalError("No app delegate")
        }
        ///retrieves the context from the persisten container in Model
        let context  = appDelegate.persistentContainer.viewContext
        ///check if there are any changes made to the context, if so save context
        if context.hasChanges{
            ///save context
            _ = try? context.save()
            print("Successfully saved context")
        }
    }


}

