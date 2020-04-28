//
//  Thing+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import SwiftUI
import Foundation

extension Thing {
    ///placeholder variable for notes  label text
    static var notesPlaceHolder: String = "Notes:"
    
    ///placeholder variable for image URL  label text
    static var imageURLPlaceHolder: String = "Image URL:"
       ///placeholder variable for textfield heading values when new object is created
     static var newElementTextPlaceHolder: String = "<new>"
     ///placeholder variable for the title text/textfield property when a new object is created
     static var titleValuePlaceHolder: String = "<Title>"
     ///placeholder variable for sub title text/textfield property when a new object is created
     static var subtTitleValuePlaceHolder: String = "<Subtitle>"
     ///placeholder varaible for Image URL textfield default value
     static var imageURLTextFieldPlaceHolder: String = "URL of Image"
     ///placeholder variable for heading 1  textfield
     static var heading1PlaceHolder: String = "Heading1:"
     ///placeholder variable for heading 2  textfield
     static var heading2PlaceHolder: String = "Heading2:"
     ///placeholder variable for heading 3  textfield
     static var heading3PlaceHolder: String = "Heading3:"
     ///placeholder variable for notes textfield default value
     static var notesTextFieldPlaceHolder: String = "Add a note"
     ///placeholder variable for default image if no image is loaded by remote URL
     static var defaultImagePlaceHolder: String = "Potato"
    
    ///https://i.redd.it/qi0r0pdbsgs31.jpg
    
    var thingImageURL : String {
        set{imageURL = newValue}
        get {imageURL ?? ""}
        }
    var title : String {
        set {thingTitle = newValue}
        get {thingTitle ?? ""}
        }
    var subTitle : String {
        set{thingSubTitle = newValue}
        get {thingSubTitle ?? ""}
        }
    var heading1 : String {
        set{thingHeading1 = newValue}
        get {thingHeading1 ?? ""}
        }
    var heading2 : String {
        set{thingHeading2 = newValue}
        get {thingHeading2 ?? ""}
        }
    var heading3 : String {
        set{thingHeading3 = newValue}
        get {thingHeading3 ?? ""}
        }
    var heading1Value : String {
        set{thingHeading1Value = newValue}
        get {thingHeading1Value ?? ""}
        }
    var heading2Value : String {
        set{thingHeading2Value = newValue}
        get {thingHeading2Value ?? ""}
        }
    var heading3Value : String {
        set{thingHeading3Value = newValue}
        get {thingHeading3Value ?? ""}
        }
    var thingImage : String {
        set{image = newValue}
        get {image ?? ""}
        }
    var thingNote : String {
        set{note = newValue}
        get {note ?? ""}
        }
    /**
       function is used to update the  uiImage variable and assign a image to the prarameter. function also makes use of a dictionary to store image urls
        
            ##important Notes##
     1. check for dictionary in scenedelegate
     2. dictionary is used to download image urls
     3. UIImageView that downloads image data
     4. converts that data to a UIImage
     5. loads it back into the image view
        
       */
    func updateImage() -> Image {
        ///checking if dictionary exists and going through keys within the dictionary
        if SceneDelegate.imageDownloads.keys.contains(thingImageURL) {
            guard let uiImage = SceneDelegate.imageDownloads[thingImageURL] else {
                ///returns the image from the dictionary if not returns a default image
                return Image(image ?? "potato")
            }
            ///return value UIImage
            print("image recieved from the SceneDelegate dictionary")
            return Image(uiImage: uiImage)
        } else {
             ///guard unrwaps the variable so it the program doesn't throw a fatal error
            guard let imageURL = imageURL,
                let url = URL(string: imageURL),
                let imageData = try? Data(contentsOf: url),
                let uiImage = UIImage(data: imageData) else {
                    /**
                    If no image is retrieved from the url return nil for the var.
                    essentially not present anything and in this assignment reverting back to the default image of object.
                     if the self.uiImage = nil is commented out or deleted the object will only revert to the previous image instead of default
                    */
                    return Image(image ?? "potato")
            }
            ///places imagURL as key in the dictionary
            SceneDelegate.imageDownloads[imageURL] = uiImage
            print("Image URL downloaded from internet")
            ///return value UIImage
            return Image(uiImage: uiImage)
        }
    }


}

