//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import Foundation
///@Identifiable: A class of types whose instances hold the value of an entity with stable identity.
class ViewModel: ObservableObject, Identifiable, Codable{
    
    ///placeholder variable for list title  text
    @Published var listTitle: String = "Favourite Things"
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
    ///placeholder variable for notes  label text
    static var notesPlaceHolder: String = "Notes:"
    ///placeholder variable for notes textfield default value
    static var notesTextFieldPlaceHolder: String = "Add a note"
    ///placeholder variable for image URL  label text
    static var imageURLPlaceHolder: String = "Image URL:"
    ///placeholder variable for default image if no image is loaded by remote URL
    static var defaultImagePlaceHolder: String = "Potato"
  
    /**
    class is used to hold the array
     ##Important Notes##
    1. Using @published we can look at the new array when a change is made to it
    */
    @Published var favouriteThings : [FavouriteThing]
    /**
    key components of the JSON key value paris.
    A type that can be used as a key for encoding and decoding.
    encodes the listTitle and array of objects
     */
    enum CodingKeys: String, CodingKey{
        case favouriteThings
        case listTitle
    }
    /**
     initialises a new ViewModel with the provided ViewModel data
    - Returns: a new ViewModel object
    */
    init() {
        favouriteThings = [FavouriteThing]()
    }
    /**
     decodes the favouriteThing based on the CodingKeys above
    - Parameter from: A Decoder object used to decode the viewModel data
     
    - Returns: A new viewModel object
     
     */
    required init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        favouriteThings = try container.decode([FavouriteThing].self, forKey:.favouriteThings)
        listTitle = try container.decode(String.self, forKey: .listTitle)
     }
     /**
      decodes the favouriteThing based on the CodingKeys above
     - Parameter encoder: A Encoder object used to encode the favouriteThing data
      
      */
     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(favouriteThings, forKey: CodingKeys.favouriteThings)
         try container.encode(listTitle, forKey: CodingKeys.listTitle)
     }
    /**
    func creates new object using the FavouriteThing model
    append new object to potato array "favouriteThings"
    */
    func addElement(){
        ///create new instance of object with placeholder text variables and blank properties to be filled in later
        favouriteThings.insert(FavouriteThing(), at: 0)
    }
    /**
    func creates new object using the FavouriteThing model
    append new object to potato array "favouriteThings" by using a second addElement function parameters can be based into the class to create new objects
    - parameters favouriteThing:    object name
    */
    func addElement(favouriteThing: FavouriteThing){
        ///create new instance of object with placeholder text variables and blank properties to be filled in later
        favouriteThings.insert(favouriteThing, at: 0)
    }
    /**
    func deletes item from favouriteThings array at index int
     - parameter index:   int to specify location of item in array to delete
    */
    func deleteItems(index: Int){
        favouriteThings.remove(at: index)
    }
    /**
     function is used to move objects in the ViewModel
    - Parameter source: index place of object being moved in list
    - Parameter destination: index place that object is being moved to
     */
    func moveItems(from source: IndexSet, to destination: Int) {
    favouriteThings.move(fromOffsets: source, toOffset: destination)
    }
}
