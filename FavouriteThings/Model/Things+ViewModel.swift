//
//  List+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import SwiftUI
extension Things {
    ///placeholder variable for things title  text
    static var thingsTitle: String = "Favourite Things"
    ///setter and getter for array of entries in CoreData
    var entries: [Thing]{
        ///set array as an OrderedSet array
        set {things = NSOrderedSet(array: newValue)}
        ///if no array,  create new empty array
        get {(things?.array as? [Thing]) ?? []}
    }
    ///setter and getter for list title of things 
    var title: String {
        set {listTitle = newValue}
        get {listTitle ?? ""}
    }
        /**
     function is used to move objects in the ViewModel
    - Parameter source: index place of object being moved in list
    - Parameter destination: index place that object is being moved to
     */
    func moveItems(from source: IndexSet, to destination: Int) {
        /**change the entry position using function inbuilt move
         - Parameter source: index place of object being moved in list
         - Parameter destination: index place that object is being moved to
         */
        entries.move(fromOffsets: source, toOffset: destination)
    }
    
    func addObject (context: NSManagedObjectContext){
        ///create new object
        let thing = Thing(context:context)
        thing.things = self
        ///save the context to CoreData
        self.save()
    }
    ///function is used to save the context of the app delegate
    func save(){
        ///unwrap app delegate and see if it exists
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError("No App delegate")
        }
        ///save content of the app delegate
        appDelegate.saveContent()
    }
}
