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
}
