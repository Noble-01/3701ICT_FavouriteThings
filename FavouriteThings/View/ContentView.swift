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
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Things.listTitle, ascending: true)]) var things: FetchedResults<Things>
    ///is viewd by the viewmodel for any changes done to the array
    
    var body: some View{
                NavigationView {
                    ///shows the MasterView which then utalizes the ViewModel file
                    MasterView(things: things.first ?? Things(context: context))
                    ///Configures the navigation bar items for the view.
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:HStack {
                            ///A button is a  control that performs an action when triggered.
                            ///performs the addElement func in the ViewModel file
                            Button(action:{withAnimation{
                                let thing = Thing(context: self.context)
                                thing.list = self.things.first
                                try? self.context.save()}
                            }){
                                Image(systemName: "plus")
                            }
                        }
                    )
        }
    }
}
