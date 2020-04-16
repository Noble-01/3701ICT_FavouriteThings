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
    ///@ObservedObject:  property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.
    @ObservedObject var potato: Potato
    var body: some View {
        HStack(){
            ///calls image from the func "getterImage" for the potato object
            potato.getterImage().resizable()
            .padding(.vertical, 5.0)
            .frame(width: 80.0, height: 80.0)
            .shadow(radius: 10)
            .scaledToFit()
            
            ///display name of potato
            Text(potato.thingTitle).fontWeight(.bold)
            
            ///display scientific name of potato
            Text(potato.thingSubTitle)
            .font(.subheadline)
            .fontWeight(.light)
            .italic()
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
