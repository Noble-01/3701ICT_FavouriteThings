//
//  FavouriteThing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 26/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
//

import Foundation
import CoreData


extension FavouriteThing {
    ///fetch all entitiies named FavouriteThing
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteThing> {
        return NSFetchRequest<FavouriteThing>(entityName: "FavouriteThing")
    }

    @NSManaged public var thingTitle: String?
    @NSManaged public var thingSubTitle: String?
    @NSManaged public var thingHeading1: String?
    @NSManaged public var thingHeading2: String?
    @NSManaged public var thingHeading3: String?
    @NSManaged public var thingHeading1Value: String?
    @NSManaged public var thingHeading2Value: String?
    @NSManaged public var thingHeading3Value: String?
    @NSManaged public var note: String?
    @NSManaged public var image: String?
    @NSManaged public var viewModel: ViewModel?

}