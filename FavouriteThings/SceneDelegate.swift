//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import UIKit
import SwiftUI

///creation of object with certain parameters using the FavouriteThings class
let favouriteThing1 = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "Potato", note: "")
let favouriteThing2 = FavouriteThing(thingTitle: "Vitelotte", thingSubTitle: "Solanum Vitelotte", thingHeading1Value:"Starch Potato", thingHeading2Value: "300grams", thingHeading3Value: "protien, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "Potato1", note: "")
let favouriteThing3 = FavouriteThing(thingTitle: "Laura", thingSubTitle: "Laura tuberosum", thingHeading1Value:"Cultivar Potato", thingHeading2Value: "150grams", thingHeading3Value: "Laura tuberosum", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "Potato2", note: "")


class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    var window: UIWindow?
    ///create new object of ViewModel class
    var viewModel = ViewModel()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        ///variable for the AppDelegate. cast the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError("no app delegate")
        }
        let context = appDelegate.persistentContainer.viewContext

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

    }


}

