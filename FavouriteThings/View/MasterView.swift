//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) var context
    ///create a variable for the editMode envrionment of the app
    @Environment(\.editMode) var mode
   
    /**
        the following code is used to create a naviagtion view that displays all the Thing objects saved into an array
     */
    @ObservedObject var things: Things
    var body: some View {

        ///creates the list that utalises the array of favouriteThings information
        VStack {
            ///if the current mode has changed environment into editMode execute the following code
           if mode?.wrappedValue == .active{
                HStack{
                ///show the textfield of the thing tile
                Text("📝").font(Font.system(.largeTitle).bold())
                    TextField("", text: self.$things.title).font(Font.system(.largeTitle).bold())
                }
            }
            List{
            ///creates a for loop to run through the array with the var thing
                ForEach(things.entries, id: \.self)
                {
                    thing in
                    ///links the items in the list to the detailView for the thing object selected
                        NavigationLink(destination: DetailView(model: thing))
                        {
                            RowView(thing: thing)
                        }
                    ///move items in list when the edit button is selected
                }.onMove(perform: self.things.moveItems)
                ///when an item is deleted it's removed from array with at index position
                    .onDelete{indices in indices.forEach
                    {
                        self.things.removeFromThings(at: $0)
                    }
                }
            }
        }
        ///use an empty title if in edit mode or use the listTitle variable string
            .navigationBarTitle(mode?.wrappedValue == .active ? "" : things.title)
    }

}
