//
//  rowView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI
///separate view for the contents in the list
///allows fot the objects to be observed and therefore show changes to the items
struct RowView: View {
    ///calls the context from the Mode
    @Environment(\.managedObjectContext) var context
    ///@ObservedObject:  property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.
    @ObservedObject var thing: Thing
    var body: some View {
        HStack(){
            ///calls image from the func "updateImage" for the thing object
            thing.updateImage().resizable()
            .padding(.vertical, 5.0)
            .frame(width: 80.0, height: 80.0)
            .shadow(radius: 10)
            .scaledToFit()
            
            ///display title of thing
            Text(thing.thingTitle ?? Thing.titleValuePlaceHolder).fontWeight(.bold)
            
            ///display sub title of thing
            Text(thing.thingSubTitle ?? Thing.subtTitleValuePlaceHolder)
            .font(.subheadline)
            .fontWeight(.light)
            .italic()
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
