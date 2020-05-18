//
//  Things+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 9/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
//

import Foundation
import CoreData

///declares an extension to hold the @NSManaged properties representing attributes and relationships, their accessors, and helper functionality for fetching instances of this type
extension Things {
///attributes of entity Things
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Things> {
        ///name of entity
        return NSFetchRequest<Things>(entityName: "Things")
    }
    ///attribute title with type optional string
    @NSManaged public var listTitle: String?
    ///attribute title with type optional string
    @NSManaged public var things: NSOrderedSet?

}

// MARK: Generated accessors for things
///attribute title with type optional string
extension Things {

    ///func to insert objects into entity Things at index
    @objc(insertObject:inThingsAtIndex:)
    @NSManaged public func insertIntoThings(_ value: Thing, at idx: Int)
    ///func to delete objects  from entity Things at index
    @objc(removeObjectFromThingsAtIndex:)
    @NSManaged public func removeFromThings(at idx: Int)
    ///func to insert objects into entity Things at index
    ///NSIndexSet class represents an immutable collection of unique unsigned integers
    @objc(insertThings:atIndexes:)
    @NSManaged public func insertIntoThings(_ values: [Thing], at indexes: NSIndexSet)
    ///func to insert arrays into entity Things at index
    @objc(removeThingsAtIndexes:)
    @NSManaged public func removeFromThings(at indexes: NSIndexSet)
    ///func to replace objects in entity Things at index
    @objc(replaceObjectInThingsAtIndex:withObject:)
    @NSManaged public func replaceThings(at idx: Int, with value: Thing)
    ///func to replace objects with array  in entity Things at index
    @objc(replaceThingsAtIndexes:withThings:)
    @NSManaged public func replaceThings(at indexes: NSIndexSet, with values: [Thing])
    ///func to append objects to entity Things
    @objc(addThingsObject:)
    @NSManaged public func addToThings(_ value: Thing)
    ///func to remove object from entity Things
    @objc(removeThingsObject:)
    @NSManaged public func removeFromThings(_ value: Thing)
    ///func to insert objects into entity Things
    ///NSOrderedSet declares the programmatic interface for static sets of distinct objects
    @objc(addThings:)
    @NSManaged public func addToThings(_ values: NSOrderedSet)
    ///func to remove objects from entity Things
    @objc(removeThings:)
    @NSManaged public func removeFromThings(_ values: NSOrderedSet)

}
