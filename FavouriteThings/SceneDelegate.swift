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

    ///retrieve the reference for default FileManager to be used in the process
    private let fileManager = FileManager.default
    ///retireve url for document directory from the FileManager and gets the first url as the user's document folder
    lazy private var documentFolderUrl: URL = { FileManager.default.urls(for: .documentDirectory, in : .userDomainMask)[0]}()
    ///adds name of the "data" file for the viewModel and to the end of the document folder url which then becomes the new file url
    lazy private var fileURL =  documentFolderUrl.appendingPathComponent("data.json")
    
    var window: UIWindow?
    ///create new object of ViewModel class
    var viewModel = ViewModel()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        ///variable for the AppDelegate. cast the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError("no app delegate")
        }
        let context = appDelegate.persistentContainer.viewContext
    ///Handles the decoding of the viewModel and errors
        do{
            ///attempt to read the file data into memory
            let t = try Data(contentsOf: fileURL)
            ///assign a new JSON decoder Object
            let decoder = JSONDecoder()
            ///attempt to decode the file data with the JSON decoder to produce a ViewModel object
            let decodedModel = try decoder.decode(ViewModel.self, from: t)
            ///assign the decoded object to viewModel
            viewModel = decodedModel
        }
         ///if there file cannot be loaded catch the process and state it can not be opened. using catch helps the program from crashing.
        catch{
            print("Could not load \(fileURL): \(error)")
        }
        
        if (viewModel.favouriteThings.count < 1){
            ///insert hard coded objects into list array
            viewModel.addElement(favouriteThing: favouriteThing1)
            viewModel.addElement(favouriteThing: favouriteThing2)
            viewModel.addElement(favouriteThing: favouriteThing3)
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
        
        /**
        if you want the app to always have data in it each time u close it after deleting everything instead of reruning the app to get the hard coded objects appended again use the following code
         it will append the new objects to the list every time u leave the app to the background
         
        if (viewModel.favouriteThings.count < 1){
            ///insert hard coded objects into list array
            viewModel.addElement(favouriteThing: favouriteThing1)
            viewModel.addElement(favouriteThing: favouriteThing2)
            viewModel.addElement(favouriteThing: favouriteThing3)
        }
         */
        ///when app is minimised execute the following code
        do{
            ///assign a new JSON decoder Object
            let json = JSONEncoder()
            ///attempt to encode the data from the viewModel
            let data = try json.encode(viewModel)
            ///write encoded data to JSON file location
            try data.write(to: fileURL)
            ///if saving is successful print the following text
            print("successfully wrote file \(fileURL.path)")
            }catch{
                print("Could not write file \(fileURL.path): \(error)")
        }
    }


}

