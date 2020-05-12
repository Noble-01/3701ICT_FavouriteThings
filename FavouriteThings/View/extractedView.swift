//
//  extractedView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 12/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import SwiftUI
///separate view for the contents in the list
///allows fot the objects to be observed and therefore show changes to the items
struct ExtractedView: View {
    ///calls the context from the Mode
    @Environment(\.managedObjectContext) var context
    ///@ObservedObject:  property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.
    @ObservedObject var model: Thing
    var body: some View {
        ScrollView{
        VStack{
               Text("Location:").font(.title)
                   TextField("Enter location", text: $model.thingLocationName)
               }
               HStack{
                   Text("Latitude:")
                   TextField("Enter location", text: $model.thingLatitude, onCommit: {
                       self.model.updateNameFromCoordinate()
                   })
               }
               HStack{
                   Text("Longitude:")
                   TextField("Enter location", text: $model.thingLongitude, onCommit: {
                       self.model.updateNameFromCoordinate()
                   })
               }
               Button("Find coordinates for location name"){
                   ///call function in Place class  to update the name from the coordinates places in the textfields
                   self.model.updateCoordinateFromName()
               }
        }
    }
    }

