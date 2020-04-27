//
//  ViewModel+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 26/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
//

import Foundation
import CoreData


extension ViewModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ViewModel> {
        return NSFetchRequest<ViewModel>(entityName: "ViewModel")
    }

    @NSManaged public var listTitle: String?
    @NSManaged public var favouriteThings: NSOrderedSet?

}

// MARK: Generated accessors for favouriteThings
extension ViewModel {

    @objc(insertObject:inFavouriteThingsAtIndex:)
    @NSManaged public func insertIntoFavouriteThings(_ value: FavouriteThing, at idx: Int)

    @objc(removeObjectFromFavouriteThingsAtIndex:)
    @NSManaged public func removeFromFavouriteThings(at idx: Int)

    @objc(insertFavouriteThings:atIndexes:)
    @NSManaged public func insertIntoFavouriteThings(_ values: [FavouriteThing], at indexes: NSIndexSet)

    @objc(removeFavouriteThingsAtIndexes:)
    @NSManaged public func removeFromFavouriteThings(at indexes: NSIndexSet)

    @objc(replaceObjectInFavouriteThingsAtIndex:withObject:)
    @NSManaged public func replaceFavouriteThings(at idx: Int, with value: FavouriteThing)

    @objc(replaceFavouriteThingsAtIndexes:withFavouriteThings:)
    @NSManaged public func replaceFavouriteThings(at indexes: NSIndexSet, with values: [FavouriteThing])

    @objc(addFavouriteThingsObject:)
    @NSManaged public func addToFavouriteThings(_ value: FavouriteThing)

    @objc(removeFavouriteThingsObject:)
    @NSManaged public func removeFromFavouriteThings(_ value: FavouriteThing)

    @objc(addFavouriteThings:)
    @NSManaged public func addToFavouriteThings(_ values: NSOrderedSet)

    @objc(removeFavouriteThings:)
    @NSManaged public func removeFromFavouriteThings(_ values: NSOrderedSet)

}
