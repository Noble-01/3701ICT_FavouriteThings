//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    ///create a variable for the editMode envrionment of the app
    @Environment(\.editMode) var mode
    
    /**
            the following code is used to create a naviagtion view that displays all the favouriteThing objects saved into an array
     */
    ///the list changes according to the array in the model
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ///creates the list that utalises the array of favouriteThings information
        VStack {
            ///if the current mode has changed environment into editMode execute the following code
            if mode?.wrappedValue == .active{
                HStack{
                ///show the textfield of the listTile
                Text("📝").font(Font.system(.largeTitle).bold())
                TextField(viewModel.listTitle, text: $viewModel.listTitle).font(Font.system(.largeTitle).bold())
                }
            }
                List{
                ///creates a for loop to run through the array with the var favouriteThing
                ForEach(viewModel.favouriteThings) { favouriteThing in
                    ///links the items in the list to the detailView for the favouriteThing object selected
                    NavigationLink(destination: DetailView(model: favouriteThing)){
                            RowView(favouriteThing: favouriteThing)
                        }
                    ///move items in list when the edit button is selected
                }.onMove(perform: self.viewModel.moveItems(from:to:))
                ///when an item is deleted send index position of item through fun deleteItems() as var index in the ViewModel file
                .onDelete{indices in
                        indices.forEach {self.viewModel.deleteItems(index:$0)
                }
            }
            }
        }
        ///use an empty title if in edit mode or use the listTitle variable string
        .navigationBarTitle(mode?.wrappedValue == .active ? "" : viewModel.listTitle)
}

}
