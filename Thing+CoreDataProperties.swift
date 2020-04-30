//
//  Thing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
//

import Foundation
import CoreData

///declares an extension to hold the @NSManaged properties representing attributes and relationships,
extension Thing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thing> {
        ///entity name
        return NSFetchRequest<Thing>(entityName: "Thing")
    }
    ///attributes for the entity called Thing
    @NSManaged public var image: String?
    @NSManaged public var note: String?
    @NSManaged public var thingHeading1: String?
    @NSManaged public var thingHeading1Value: String?
    @NSManaged public var thingHeading2: String?
    @NSManaged public var thingHeading2Value: String?
    @NSManaged public var thingHeading3: String?
    @NSManaged public var thingHeading3Value: String?
    @NSManaged public var thingSubTitle: String?
    @NSManaged public var thingTitle: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var list: Things?

}
