//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import SwiftUI
import UIKit
import XCTest
@testable import FavouriteThings

class FavouriteThingTests: XCTestCase {
    
    ///retrieve the reference for default FileManager to be used in the process
    private let fileManager = FileManager.default
    ///retireve url for document directory from the FileManager and gets the first url as the user's document folder
    lazy private var documentFolderUrl: URL = { FileManager.default.urls(for: .documentDirectory, in : .userDomainMask)[0]}()
    ///adds name of the "data" file for the viewModel and to the end of the document folder url which then becomes the new file url 
    lazy private var fileURL =  documentFolderUrl.appendingPathComponent("test.json")
    
    private let decoder = JSONDecoder()
    
    ///assign var favouriteThing to class FavouriteThing
    ///make class FavouriteThing optional
    var favouriteThing: FavouriteThing?
    
    ///create array for class FavouriteThing
    var favouriteThings: [FavouriteThing] = []
    
    ///assign var viewModel to class ViewModel
    var viewModel: ViewModel?
    
    ///sets up the objects before they can be used by the tests
    override func setUp() {
        
        /// Handle errors from encoding and saving viewModel data. make sure the file exists before starting the tests
              do{
                ///assign a new JSON decoder Object
                let json = JSONEncoder()
                ///attempt to encode the data from the viewModel
                let data = try json.encode(viewModel)
                ///write encoded data to JSON file location
                try data.write(to: fileURL)
                }catch{
                  XCTFail("Encoding failed \(fileURL.path): \(error)")
              }

        /// Put setup code here. This method is called before the invocation of each test method in the class.
        ///create favouriteThing array with set properties
        favouriteThing = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight: ", thingHeading3: "Nutrition: ", image: "Potato", note: "")
        
        ///unwrap object favouriteThing to be safely used by the viewModel
        guard let favouriteThing = favouriteThing else {
            return
        }
        
        ///assign var favouriteThings to an array which contains the FavouriteThing objects
        favouriteThings = [favouriteThing]
        
        ///assign viewModel to the unwrapped favouriteThing object
        viewModel = ViewModel()
        
        ///unwrap viewModel
        guard let viewModel = viewModel else {
            return
        }
        ///variable to test title of the viewModel object
        viewModel.listTitle = "Favourite Things"
    }

    override func tearDown() {
        /// Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    ///function tests all properties and functions of the favouriteThing  model
    func testFavouriteThingsModel(){
        ///Assign test varaibles to assert
        ///variable to test favouriteThing title
        let thingTitle = "Kipfler"
        ///variable to test favouriteThing heading 2 value
        let thingHeading2Value = "20grams"
        ///variable to test favouriteThing sub title
        let thingSubTitle = "Solanum tuberosum"
        ///variable to test favouriteThing heading 1 value
        let thingHeading1Value = "Sweet Potato"
        ///variable to test favouriteThing image
        let thingImage = "Potato"
        ///variable to test favouriteThing heading 3 value
        let thingHeading3Value = "manganese, potassium and vitamin C"
        ///variable to test favouriteThing heading 1
        let thingHeading1 = "Family: "
        ///variable to test favouriteThing heading 2
        let thingHeading2 = "Weight: "
        ///variable to test favouriteThing heading 3
        let thingHeading3 = "Nutrition: "
        
        ///XCTAssertEqual compares two non-optional values of the same type.
        ///test favourtiteThing title are the same
        XCTAssertEqual(favouriteThing?.thingTitle,thingTitle)
        ///test favourtiteThing sub title are the same
        XCTAssertEqual(favouriteThing?.thingSubTitle,thingSubTitle)
        ///test favourtiteThing heading 1 are the same
        XCTAssertEqual(favouriteThing?.thingHeading1, thingHeading1)
        ///test favourtiteThing heading 2 are the same
        XCTAssertEqual(favouriteThing?.thingHeading2, thingHeading2)
        ///test favourtiteThing heading 3 are the same
        XCTAssertEqual(favouriteThing?.thingHeading3, thingHeading3)
        
        ///test favourtiteThing heading 1 value are the same
        XCTAssertEqual(favouriteThing?.thingHeading1Value,thingHeading1Value)
        ///test favourtiteThing heading 2 value  are the same
        XCTAssertEqual(favouriteThing?.thingHeading2Value,thingHeading2Value)
        ///test favourtiteThing heading 3 value are the same
        XCTAssertEqual(favouriteThing?.thingHeading3Value,thingHeading3Value)
        ///test image of the favouriteThing are the same
        XCTAssertEqual(favouriteThing?.image, thingImage)

        ///testing if array has anything inisde it
        XCTAssert((favouriteThing as Any)is FavouriteThing)
        ///testing if array is not eqault to nil
        XCTAssertNotNil([favouriteThing])
        ///testing if array has 1 object inside
        XCTAssertEqual([favouriteThing].count, 1)
        
        ///download image through function updateImage with url string
        favouriteThing?.updateImage(imageURL:"https://i.redd.it/qi0r0pdbsgs31.jpg")
        ///test returned image is of type Image using the getter function called getterImage()
         XCTAssert((favouriteThing?.getterImage() as Any)is Image)
        
        ///test if getter function works with uiImage as Nil
        XCTAssertNotNil(favouriteThing?.getterImage())

    }
    ///function test all functions that are in the ViewModel
    func testViewModel(){
        ///variable to test the list title of the view model class
        let title = "Favourite Things"
        
        ///test if the list title of the view model are the same
        XCTAssertEqual(viewModel?.listTitle, title)
        
        ///testing if ViewModel exists or contents
        XCTAssertNotNil(viewModel)
        
        ///execute addElement func which will a new object to the potato array
        viewModel?.addElement()
        ///test if the total number of objects in array is now eqaul to two
        XCTAssertEqual(viewModel?.favouriteThings.count, 1)
        
        /**
         execute deleteItems array which deletes an object from the potato array
        pass parameter index position of object to delete from array as type int
         */
        viewModel?.deleteItems(index: 0)
        ///test if the total number of objects in array is now eqaul to one after deleting object using the deleteItems func
        XCTAssertEqual(viewModel?.favouriteThings.count, 0)
        
    }
    func testJSON(){
        
        ///create object with the following parameters
        let favouriteThingTest = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "Potato", note: "")
       
        ///unwrap viewmodel to safetly use
        guard let viewModel = viewModel else{
            XCTFail("ViewModel NIL")
            return
        }
        ///add the new object into the view model
        viewModel.addElement(favouriteThing: favouriteThingTest)
        /// Handle errors from encoding and saving viewModel data
        do{
          ///assign a new JSON decoder Object
          let json = JSONEncoder()
          ///attempt to encode the data from the viewModel
          let data = try json.encode(viewModel)
          ///write encoded data to JSON file location
          try data.write(to: fileURL)
          }catch{
            XCTFail("Encoding failed \(fileURL.path): \(error)")
        }
        ///create variable of ViewModel
        var model : ViewModel
       ///decodes the viewModel which then can be used for testing also handles the errors
        do{
            ///read the data from the file into memory
            let t = try Data(contentsOf: fileURL)
           ///assign a new JSON decoder Object
            let decoder = JSONDecoder()
           ///attempt to decode the file data with the JSON decoder to produce a ViewModel object
            let decodedModel = try decoder.decode(ViewModel.self, from: t)
           ////test if the view model was saved to the JSON file
           print("There are this many objects in the JSON file: \(decodedModel.favouriteThings.count)")
            ///assign array in decodedModel to model var
           model = decodedModel
        }catch{
           ///if the try throws an error it is cuaght prints the below text to the console
             fatalError("decode failed \(fileURL)")
         }
        ///compare that the orignal data is the same to the decoded model for the object title
        XCTAssertEqual(favouriteThingTest.thingTitle, model.favouriteThings[0].thingTitle)
        ///compare that the orignal data is the same to the decoded model for the object sub title
        XCTAssertEqual(favouriteThingTest.thingSubTitle, model.favouriteThings[0].thingSubTitle)
        ///compare that the orignal data is the same to the decoded model for the object heading 1
        XCTAssertEqual(favouriteThingTest.thingHeading1, model.favouriteThings[0].thingHeading1)
        ///compare that the orignal data is the same to the decoded model for the object heading 2
        XCTAssertEqual(favouriteThingTest.thingHeading2, model.favouriteThings[0].thingHeading2)
        ///compare that the orignal data is the same to the decoded model for the object heading 3
        XCTAssertEqual(favouriteThingTest.thingHeading3, model.favouriteThings[0].thingHeading3)
        ///compare that the orignal data is the same to the decoded model for the object heading 1 value
        XCTAssertEqual(favouriteThingTest.thingHeading1Value, model.favouriteThings[0].thingHeading1Value)
        ///compare that the orignal data is the same to the decoded model for the object heading 2 value
        XCTAssertEqual(favouriteThingTest.thingHeading2Value, model.favouriteThings[0].thingHeading2Value)
        ///compare that the orignal data is the same to the decoded model for the object heading 3 value
        XCTAssertEqual(favouriteThingTest.thingHeading3Value, model.favouriteThings[0].thingHeading3Value)
        ///compare that the orignal data is the same to the decoded model for the object image name
        XCTAssertEqual(favouriteThingTest.image, model.favouriteThings[0].image)
        ///compare that the orignal data is the same to the decoded model for the object notes
        XCTAssertEqual(favouriteThingTest.note, model.favouriteThings[0].note)
        
    }
    
    func testPerformanceExample() {
        /// This is an example of a performance test case.
        self.measure {
            /// Put the code you want to measure the time of here.
        }
    }

}
