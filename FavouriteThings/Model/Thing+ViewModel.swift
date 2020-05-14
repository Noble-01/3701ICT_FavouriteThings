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
import MapKit
import CoreLocation

extension Thing{
    ///placeholder variable for notes  label text
    static var notesPlaceHolder: String = "Notes:"
    ///placeholder variable for image URL  label text
    static var imageURLPlaceHolder: String = "Image URL:"
    ///placeholder variable for textfield heading values
     static var newElementTextPlaceHolder: String = "<value>"
     ///placeholder variable for the title text/textfield property
     static var titleValuePlaceHolder: String = "<Title>"
     ///placeholder variable for sub title text/textfield property
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
     ///placeholder variable for image URL textfield
     static var defaultImagePlaceHolder: String = "Image URL"
    ///placeholder variable for location text
    static var LocationTextPlaceHolder: String = "Location"
    ///placeholder variable for location name textfield
    static var locationNameTextFieldPlaceHolder: String = "Location Name"
    ///placeholder variable for latitude text
    static var latitudeTextPlaceHolder: String = "Latitude:"
     ///placeholder variable for longitude text
    static var longitudeTextPlaceHolder: String = "Longitude:"
    ///placeholder variable for latitude textfield
    static var latitudeTextFieldPlaceHolder: String = "Enter latitude"
    ///placeholder variable for longitude textfield
    static var longitudeTextFieldPlaceHolder: String = "Enter longitude"
    ///placeholder variable for location view button text
    static var coordinatesOfLocationButton: String = "Find coordinates for location name"
    ///image to test the remoteURL for images
    ///https://i.redd.it/qi0r0pdbsgs31.jpg
     ///setter and getter for imageURL  of object thing
    var thingImageURL : String {
        ///set the attribute imageURL for entity Things to a new value
        set{imageURL = newValue}
        ///retrieve the value stored in attribute imageURL or return an empty string if value is nil
        get {imageURL ?? ""}
        }
    ///setter and getter for title  of object thing
    var title : String {
        set {thingTitle = newValue}
        get {thingTitle ?? ""}
        }
    ///setter and getter for imageURL  of object thing
    var subTitle : String {
        set{thingSubTitle = newValue}
        get {thingSubTitle ?? ""}
        }
    ///setter and getter for heading1   of object thing
    var heading1 : String {
        set{thingHeading1 = newValue}
        get {thingHeading1 ?? ""}
        }
    ///setter and getter for heading 2  of object thing
    var heading2 : String {
        set{thingHeading2 = newValue}
        get {thingHeading2 ?? ""}
        }
    ///setter and getter for heading 3  of object thing
    var heading3 : String {
        set{thingHeading3 = newValue}
        get {thingHeading3 ?? ""}
        }
    ///setter and getter for heading 1 value  of object thing
    var heading1Value : String {
        set{thingHeading1Value = newValue}
        get {thingHeading1Value ?? ""}
        }
    ///setter and getter for heading 2 value  of object thing
    var heading2Value : String {
        set{thingHeading2Value = newValue}
        get {thingHeading2Value ?? ""}
        }
    ///setter and getter for heading 3 value  of object thing
    var heading3Value : String {
        set{thingHeading3Value = newValue}
        get {thingHeading3Value ?? ""}
        }
    ///setter and getter for image  of object thing
    var thingImage : String {
        set{image = newValue}
        get {image ?? ""}
        }
    ///setter and getter for notes of object thing
    var thingNote : String {
        set{note = newValue}
        get {note ?? ""}
        }
    var thingLocationName: String{
        set {locationName = newValue}
        get {locationName ?? ""}
    }
    
    var thingLatitude: String {
        ///default coordinates for which the below vars use
        set {latitude = Double(newValue) ?? -27.962}
        get {"\(latitude)"}
    }
    
    var thingLongitude: String {
        ///default coordinates for which the below vars use
        set {longitude = Double(newValue) ??  153.382}
        get {"\(longitude)"}
    }
    /**
       function is used to update the  uiImage variable and assign a image to the prarameter. function also makes use of a dictionary to store image urls
        
            ##important Notes##
     1. check for dictionary in scenedelegate
     2. dictionary is used to download/store image urls
     3. UIImageView downloads image data
     4. converts that data to a UIImage
     5. loads it back into the image view
     6. load imageURL into dictionary
        
       */
    func updateImage() -> Image {
        ///checking if dictionary exists and going through keys within the dictionary
        if SceneDelegate.imageDownloads.keys.contains(thingImageURL) {
            guard let uiImage = SceneDelegate.imageDownloads[thingImageURL] else {
                ///returns the image from the dictionary if not, returns a default image
                return Image(image ?? "potato")
            }
            ///return value UIImage
            //print("image recieved from the SceneDelegate dictionary")
            return Image(uiImage: uiImage)
        } else {
             ///guard unrwaps the variable so it the program doesn't throw a fatal error
            guard let imageURL = imageURL,
                let url = URL(string: imageURL),
                let imageData = try? Data(contentsOf: url),
                let uiImage = UIImage(data: imageData) else {
                    /**
                    If no image is retrieved from the url return default name for the var.
                    */
                    return Image(image ?? "potato")
            }
            ///places imagURL as key in the dictionary
            SceneDelegate.imageDownloads[imageURL] = uiImage
            //print("Image URL downloaded from internet")
            ///return value UIImage
            return Image(uiImage: uiImage)
        }
    }

}


