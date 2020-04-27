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
        (self.things?.array as? [Thing]) ?? []
    }
    var title: String {
        set(newTitle) {self.listTitle = newTitle}
        get {self.listTitle ?? ""}
    }
}
