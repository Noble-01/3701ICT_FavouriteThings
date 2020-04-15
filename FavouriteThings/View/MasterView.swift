//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    /**
            the following code is used to create a naviagtion view that displays all the potato objects saved into an array
     */
    ///the list changes according to the array in the model
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ///creates the list that utalises the array of potato information
        VStack {
            TextField(viewModel.listTitle, text: $viewModel.listTitle)
            List{
                ///creates a for loop to run through the array with the var potato
                ForEach(viewModel.potatos) { potato in
                    ///links the items in the list to the detailView for the potato object selected
                    NavigationLink(destination: DetailView(model: potato)){
                            RowView(potato: potato)
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
}

}
