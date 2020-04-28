//
//  List+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import Foundation

extension Things {

    
    var entries: [Thing]{
        set {things = NSOrderedSet(array: newValue)}
        get {(things?.array as? [Thing]) ?? []}
    }
    var title: String {
        set(newTitle) {self.listTitle = newTitle}
        get {self.listTitle ?? ""}
    }
        /**
     function is used to move objects in the ViewModel
    - Parameter source: index place of object being moved in list
    - Parameter destination: index place that object is being moved to
     */
    func moveItems(from source: IndexSet, to destination: Int) {
        entries.move(fromOffsets: source, toOffset: destination)
    }
}
