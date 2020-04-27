//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI
/*
 Content view is used to create the structure of the navigation which then utalises the MasterView to place
 items within the navigation
 */
struct ContentView : View {
     @Environment(\managedObjectContext) var context
    ///is viewd by the viewmodel for any changes done to the array
    @ObservedObject var viewModel:ViewModel
    
    var body: some View{
                NavigationView {
                    ///shows the MasterView which then utalizes the ViewModel file
                    MasterView(viewModel: viewModel)
                    ///Configures the navigation bar items for the view.
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:HStack {
                            ///A button is a  control that performs an action when triggered.
                            ///performs the addElement func in the ViewModel file
                            Button(action:{withAnimation{self.viewModel.addElement()}
                            }){
                                Image(systemName: "plus")
                            }
                        }
                    )
        }
    }
}
