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
       function is used to update the  uiImage variable and assign a image to the prarameter.
        
            ##important Notes##
           1. UIImageView that downloads image data
           2. converts that data to a UIImage
           3. loads it back into the image view
        
        - parameter imageURL: String  contains the url for the location of the image
       */
    /*
       func updateImage() -> Image{           ///guard unrwaps the variable so it the program doesn't throw a fatal error
        guard let imageURL = imageURL,
           let url = URL(string: imageURL),
           let imageData = try? Data(contentsOf: url),
           let uiImage = UIImage(data: imageData)
           else{
               /**
               If no image is retrieved from the url return nil for the var.
               essentially not present anything and in this assignment reverting back to the default image of object.
                if the self.uiImage = nil is commented out or deleted the object will only revert to the previous image instead of default
               */
               return Image(image ?? "Potato")
           }
        return Image(uiImage: uiImage)
       }*/
       /**
        getter function that retrieves the image for the object, if a UIImage has been downloaded via remote URL it will set the Image porperty for the object to that downloaded UIImage. Else return an image if there is one assigned to the object already
        
       -Returns: Image for the potato object
       */
    /**
       func getterImage () -> Image{
           if let uiImage = uiImage {
               return Image (uiImage: uiImage)
           } else {
               return Image(image)
           }
       }
 */
}

