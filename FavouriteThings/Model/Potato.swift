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
    @Published var name:String
    ///scientific name for potato
    @Published var scienceName:String
    ///type of family for potato
    var family:String
    ///weight of the potato
    var weight: String
    ///nutrition values of potato
    var nutrition:String
    ///textfield for the first heading
    var textFieldTitle1: String
    ///textfield for the second heading
    var textFieldTitle2: String
    ///textfield for the last heading
    var textFieldTitle3: String
    
    ///image name for potato in the assets folder
    @Published var image:String
    /**
    remote URL variable name
    
    1. UIImage: An object that manages image data in your app.
    2.  Either stores an image or is blank
    */
    @Published var uiImage:UIImage?
    ///string for textfield car note
    @Published var note: String = ""
    

    enum CodingKeys: String, CodingKey{
        case name
        case scienceName
        case family
        case weight
        case nutrition
        case textFieldTitle1
        case textFieldTitle2
        case textFieldTitle3
        case note
        case image
    }
    
    init() {
        name = "Kipfler"
        scienceName = "Solanum tuberosum"
        family = "Sweet Potato"
        weight = "200 grams"
        nutrition = "manganese, potassium and vitamin C"
        textFieldTitle1 = "Family:"
        textFieldTitle2 = "Weight:"
        textFieldTitle3 = "Nutrition:"
        image = "potato"
    }
    required init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        scienceName = try container.decode(String.self, forKey: .scienceName)
        family = try container.decode(String.self, forKey: .family)
        weight = try container.decode(String.self, forKey: .weight)
        nutrition = try container.decode(String.self, forKey: .nutrition)
        textFieldTitle1 = try container.decode(String.self, forKey: .textFieldTitle1)
        textFieldTitle2 = try container.decode(String.self, forKey: .textFieldTitle2)
        textFieldTitle3 = try container.decode(String.self, forKey: .textFieldTitle3)
        note = try container.decode(String.self, forKey: .note)
        image = try container.decode(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(scienceName, forKey: .scienceName)
        try container.encode(family, forKey: .family)
        try container.encode(weight, forKey: .weight)
        try container.encode(nutrition, forKey: .nutrition)
        try container.encode(textFieldTitle1, forKey: .textFieldTitle1)
        try container.encode(textFieldTitle2, forKey: .textFieldTitle2)
        try container.encode(textFieldTitle3, forKey: .textFieldTitle3)
        try container.encode(note, forKey: .note)
        try container.encode(image, forKey: .image)
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

