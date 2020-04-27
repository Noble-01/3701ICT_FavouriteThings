//
//  FavouriteThing.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 16/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//


///the struct contains all the parameters that make for the objects in "FavouriteThing"
import SwiftUI
import Foundation
class FavouriteThing : ObservableObject, Identifiable{
    /**
     A class of types whose instances hold the value of an entity with stable identity
     1. id is given to identify the objects of favouriteThings in the array
    */
    var id = UUID()
    ///generic title for favouriteThing
    @Published var thingTitle:String = "Title"
    ///italics style text for favouriteThing object
    @Published var thingSubTitle:String = "subTitle"
    /**
    remote URL variable name
    
    1. UIImage: An object that manages image data in your app.
    2.  Either stores an image or is blank
    */
    @Published var uiImage:UIImage?
    ///string for textfield  note
    var note: String = ""
    ///image name for potato in the assets folder
    var image:String = "Potato"
    ///value associated with  heading 1
    var thingHeading1Value:String = ""
    ///value associated with  heading 2
    var thingHeading2Value: String = ""
    ////value associated with  heading 3
    var thingHeading3Value:String = ""
    ///textfield for the first heading
    var thingHeading1: String = ""
    ///textfield for the second heading
    var thingHeading2: String = ""
    ///textfield for the last heading
    var thingHeading3: String = ""

    
    /**
     initialises a new favouriteThing with a default FavouriteThing data
     
     - Returns: New favouriteThing object
     */

    init() {
    }
    /**
     initialize the attributes of the class with the provided FavouriteThing data
    - parameter thingTitle: name for the FavouriteThing
    - parameter thingSubTitle: sub title of the FavouriteThing in italics
    - parameter thingHeading1: Heading for first textfield
    - parameter thingHeading2: Heading for second textfield
    - parameter thingHeading3: Heading for third textfield
    - parameter thingHeading1Value: Value associated with the first heading
    - parameter thingHeading2Value: Value associated with the second heading
    - parameter thingHeading3Value: Value associated with the third heading
    - parameter image: string of image, can be a local or URL
    - parameter note: notes of the object
     
    - Returns: New favouriteThing object
    */
    init(thingTitle:String, thingSubTitle:String, thingHeading1Value:String, thingHeading2Value:String, thingHeading3Value:String,thingHeading1:String, thingHeading2:String,thingHeading3:String,image: String, note: String) {
        self.thingTitle = thingTitle
        self.thingSubTitle = thingSubTitle
        self.thingHeading1 = thingHeading1
        self.thingHeading2 = thingHeading2
        self.thingHeading3 = thingHeading3
        self.thingHeading1Value = thingHeading1Value
        self.thingHeading2Value = thingHeading2Value
        self.thingHeading3Value = thingHeading3Value
        self.image = image
        self.note = note
    }

 

}

