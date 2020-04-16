//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import SwiftUI
import XCTest
@testable import FavouriteThings

class FavouriteThingTests: XCTestCase {
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
    func testPotatModel(){
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
    
    
    func testPerformanceExample() {
        /// This is an example of a performance test case.
        self.measure {
            /// Put the code you want to measure the time of here.
        }
    }

}
