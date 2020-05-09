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


extension Things {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Things> {
        return NSFetchRequest<Things>(entityName: "Things")
    }

    @NSManaged public var listTitle: String?
    @NSManaged public var things: NSOrderedSet?

}

// MARK: Generated accessors for things
extension Things {

    @objc(insertObject:inThingsAtIndex:)
    @NSManaged public func insertIntoThings(_ value: Thing, at idx: Int)

    @objc(removeObjectFromThingsAtIndex:)
    @NSManaged public func removeFromThings(at idx: Int)

    @objc(insertThings:atIndexes:)
    @NSManaged public func insertIntoThings(_ values: [Thing], at indexes: NSIndexSet)

    @objc(removeThingsAtIndexes:)
    @NSManaged public func removeFromThings(at indexes: NSIndexSet)

    @objc(replaceObjectInThingsAtIndex:withObject:)
    @NSManaged public func replaceThings(at idx: Int, with value: Thing)

    @objc(replaceThingsAtIndexes:withThings:)
    @NSManaged public func replaceThings(at indexes: NSIndexSet, with values: [Thing])

    @objc(addThingsObject:)
    @NSManaged public func addToThings(_ value: Thing)

    @objc(removeThingsObject:)
    @NSManaged public func removeFromThings(_ value: Thing)

    @objc(addThings:)
    @NSManaged public func addToThings(_ values: NSOrderedSet)

    @objc(removeThings:)
    @NSManaged public func removeFromThings(_ values: NSOrderedSet)

}
