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
    
    private let fileManager = FileManager.default
    lazy private var documentFolderUrl: URL = { FileManager.default.urls(for: .documentDirectory, in : .userDomainMask)[0]}()
    lazy private var fileURL =  documentFolderUrl.appendingPathComponent("data.json")
    private let decoder = JSONDecoder()
    
    ///assign var potato to class Potato
    ///make class Potato optional
    var favouriteThing: FavouriteThing?
    
    ///create array for class Potato
    var favouriteThings: [FavouriteThing] = []
    
    ///assign var viewModel to class ViewModel
    var viewModel: ViewModel?
    
    ///sets up the objects before they can be used by the tests
    override func setUp() {

        /// Put setup code here. This method is called before the invocation of each test method in the class.
        ///create potato array with set properties
        favouriteThing = FavouriteThing()
        viewModel = ViewModel()
        ///unwrap object potato to be safely used by the viewModel
        guard let favouriteThing = favouriteThing else {
            return
        }

        favouriteThing.thingTitle = "Kipfler"
        favouriteThing.thingSubTitle = "Solanum tuberosum"
        favouriteThing.thingHeading1 = "Family: "
        favouriteThing.thingHeading2 = "Weight: "
        favouriteThing.thingHeading3 = "Nurtition: "
        favouriteThing.thingHeading1Value = "Sweet Potato"
        favouriteThing.thingHeading2Value = "20grams"
        favouriteThing.thingHeading3Value = "manganese, potassium and vitamin C"
        favouriteThing.image = "potato"
        
        
        
        ///assign var potato to an array which contains the potato objects
        favouriteThings = [favouriteThing]
        
        ///assign viewModel to the unwrapped potato object
        viewModel = ViewModel()
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.listTitle = "Favourite Things"
    }

    override func tearDown() {
        /// Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    ///function tests all properties and functions of the potato model
    func testFavouriteThingsModel(){
        ///Assign test varaibles to assert
        ///variable to test potato name
        let thingTitle = "Kipfler"
        ///variable to test potato weight
        let thingHeading2Value = "20grams"
        ///variable to test potato scientific name
        let thingSubTitle = "Solanum tuberosum"
        ///variable to test potato family name
        let thingHeading1Value = "Sweet Potato"
        ///variable to test potato image
        let thingImage = "potato"
        
        let thingHeading3Value = "manganese, potassium and vitamin C"
        
        let thingHeading1 = "Family: "
        
        let thingHeading2 = "Weight: "
        
        let thingHeading3 = "Nurtition: "
        
        ///XCTAssertEqual compares two non-optional values of the same type.
        ///test name of potatoare the same
        XCTAssertEqual(favouriteThing?.thingTitle,thingTitle)
        ///test scientific name of potato are the same
        XCTAssertEqual(favouriteThing?.thingSubTitle,thingSubTitle)
        
        XCTAssertEqual(favouriteThing?.thingHeading1, thingHeading1)
        
        XCTAssertEqual(favouriteThing?.thingHeading2, thingHeading2)
        
        XCTAssertEqual(favouriteThing?.thingHeading3, thingHeading3)
        
        ///test family name of the potato are the same
        XCTAssertEqual(favouriteThing?.thingHeading1Value,thingHeading1Value)
        ///test weight of potato are the same
        XCTAssertEqual(favouriteThing?.thingHeading2Value,thingHeading2Value)
        
        XCTAssertEqual(favouriteThing?.thingHeading3Value,thingHeading3Value)
        ///test image of the potato are the same
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
        let title = "Favourite Things"
        
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
        let favouriteThing4 = FavouriteThing(thingTitle: "Kipfler", thingSubTitle: "Solanum tuberosum", thingHeading1Value:"Sweet Potato", thingHeading2Value: "20grams", thingHeading3Value: "manganese, potassium and vitamin C", thingHeading1: "Family: ", thingHeading2: "Weight:", thingHeading3: "Nutrition: ", image: "potato", note: "")
        	
        viewModel?.addElement(favouriteThing: favouriteThing4)
        
        do{
          ///assign a new JSON decoder Object
          let json = JSONEncoder()
          ///attempt to encode the data from the viewModel
          let data = try json.encode(viewModel)
          ///write encoded data to JSON file location
          try data.write(to: fileURL)
          print("successfully wrote file \(fileURL.path)")
          }catch{
              print("Could not write file \(fileURL.path): \(error)")
        }
        var model : ViewModel
       ///decodes the data.json file which then can be used for testing
        do{
            let t = try Data(contentsOf: fileURL)
           ///assign a new JSON decoder Object
            let decoder = JSONDecoder()
           ///attempt to decode the file data with the JSON decoder to produce a ViewModel object
            let decodedModel = try decoder.decode(ViewModel.self, from: t)
           ////test is there are any data in the file
           print("There are this many objects in the JSON file: \(decodedModel.favouriteThings.count)")
           model = decodedModel
        }catch{
           ///if the try throws an error it is cuaght prints the below text to the console
             fatalError("did not load \(fileURL)")
         }
        XCTAssertEqual(favouriteThing4.thingTitle, model.favouriteThings[0].thingTitle)
        XCTAssertEqual(favouriteThing4.thingSubTitle, model.favouriteThings[0].thingSubTitle)
        XCTAssertEqual(favouriteThing4.thingHeading1, model.favouriteThings[0].thingHeading1)
        XCTAssertEqual(favouriteThing4.thingHeading2, model.favouriteThings[0].thingHeading2)
        XCTAssertEqual(favouriteThing4.thingHeading3, model.favouriteThings[0].thingHeading3)
        XCTAssertEqual(favouriteThing4.thingHeading1Value, model.favouriteThings[0].thingHeading1Value)
        XCTAssertEqual(favouriteThing4.thingHeading2Value, model.favouriteThings[0].thingHeading2Value)
        XCTAssertEqual(favouriteThing4.thingHeading3Value, model.favouriteThings[0].thingHeading3Value)
        XCTAssertEqual(favouriteThing4.image, model.favouriteThings[0].image)
        XCTAssertEqual(favouriteThing4.note, model.favouriteThings[0].note)
        
    }
    
    func testPerformanceExample() {
        /// This is an example of a performance test case.
        self.measure {
            /// Put the code you want to measure the time of here.
        }
    }

}
