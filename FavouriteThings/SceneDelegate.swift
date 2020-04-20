//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import UIKit
import SwiftUI

let favouriteThing1 = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "potato ")
let favouriteThing2 = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "potato ")
let favouriteThing3 = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "potato ")


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let fileManager = FileManager.default
    lazy private var documentFolderUrl: URL = { FileManager.default.urls(for: .documentDirectory, in : .userDomainMask)[0]}()
    lazy private var fileURL =  documentFolderUrl.appendingPathComponent("data.json")
    
    var window: UIWindow?
    var viewModel = ViewModel()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        do{
            ///attempt to read the file data into memory
            let t = try Data(contentsOf: fileURL)
            ///assign a new JSON decoder Object
            let decoder = JSONDecoder()
            ///attempt to decode the file data with the JSON decoder to produce a ViewModel object
            let decodedModel = try decoder.decode(ViewModel.self, from: t)
            ////test is there are any data in the file
            print(decodedModel.favouriteThings.first?.thingTitle ?? "No products")
            ///assign the decoded object to viewModel
            viewModel = decodedModel
        }catch{
            print("Could not load \(fileURL): \(error)")
        }

            viewModel.addElement(favouriteThing: favouriteThing1)
            viewModel.addElement(favouriteThing: favouriteThing2)
            viewModel.addElement(favouriteThing: favouriteThing3)

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(viewModel: viewModel)

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
        do{
            let json = JSONEncoder()
            let data = try json.encode(viewModel)
            try data.write(to: fileURL)
            print("successfully wrote file \(fileURL.path)")
            }catch{
                print("Could not write file \(fileURL.path): \(error)")
        }
    }


}

