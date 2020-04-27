//
//  Thing+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import Foundation

extension Thing {
    var title : String {
        set(newTitle) {self.thingTitle = newTitle}
        get {self.thingTitle ?? ""}
        }
    /**
       function is used to update the  uiImage variable and assign a image to the prarameter.
        
            ##important Notes##
           1. UIImageView that downloads image data
           2. converts that data to a UIImage
           3. loads it back into the image view
        
        - parameter imageURL: String  contains the url for the location of the image
       */
       func updateImage(imageURL: String){
           ///guard unrwaps the variable so it the program doesn't throw a fatal error
           guard let url = URL(string: imageURL),
           let imageData = try? Data(contentsOf: url),
           let uiImage = UIImage(data: imageData)
           else{
               /**
               If no image is retrieved from the url return nil for the var.
               essentially not present anything and in this assignment reverting back to the default image of object.
                if the self.uiImage = nil is commented out or deleted the object will only revert to the previous image instead of default
               */
               self.uiImage = nil
               return
           }
           self.uiImage = uiImage
       }
       /**
        getter function that retrieves the image for the object, if a UIImage has been downloaded via remote URL it will set the Image porperty for the object to that downloaded UIImage. Else return an image if there is one assigned to the object already
        
       -Returns: Image for the potato object
       */
       func getterImage () -> Image{
           if let uiImage = uiImage {
               return Image (uiImage: uiImage)
           } else {
               return Image(image)
           }
       }
}

