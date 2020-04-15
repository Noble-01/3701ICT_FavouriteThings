//
//  Potato.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

//the struct contains all the parameters that make for the objects in "Potato"
import SwiftUI
import Foundation
class Potato : ObservableObject, Identifiable, Codable{
    /**
     A class of types whose instances hold the value of an entity with stable identity
     1. id is given to identify the objects of potatos in the array
    */
    var id = UUID()
    ///generic name for potato
    @Published var name:String = "Kipfler"
    ///scientific name for potato
    @Published var scienceName:String = "Solanum tuberosum"
    ///type of family for potato
    var family:String = "Sweet Potato"
    ///weight of the potato
    var weight: String = "200 grams"
    ///nutrition values of potato
    var nutrition:String = "manganese, potassium and vitamin C"
    ///textfield for the first heading
    var textFieldTitle1: String = "Family:"
    ///textfield for the second heading
    var textFieldTitle2: String = "Weight:"
    ///textfield for the last heading
    var textFieldTitle3: String = "Nutrition:"
    
    ///image name for potato in the assets folder
    @Published var image:String = "Potato"
    /**
    remote URL variable name
    
    1. UIImage: An object that manages image data in your app.
    2.  Either stores an image or is blank
    */
    @Published var uiImage:UIImage?
    ///string for textfield car note
    @Published var note: String = ""
    

    /**
     initialize the attributes of the class
    - parameter name: The common name of the potato
    - parameter family: The family of the potato
    - parameter weight: Average weight of potato
    - parameter scienceName: Scientific name of the potato
    - parameter nutrition: Nutritional value of potato
    - parameter image: string of image, can be a local or URL
    - parameter textFieldTitle1: string for title of one of the headings in the detail view
    - parameter textFieldTitle2: string for title of one of the headings in the detail view
    - parameter textFieldTitle3: string for title of one of the headings in the detail view
     
    - Returns: New Potato object
    */
    init() {
    }
    required init(from decoder: Decoder)throws{
    }
    
    func encode(to encoder: Encoder) throws {
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

