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
    var body: some View{
                NavigationView {
                    ///shows the MasterView which then utalizes the ViewModel file
                    MasterView(things: things.first ?? Things(context: context))
                    ///Configures the navigation bar items for the view.
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:HStack {
                            ///A button is a  control that performs an action when triggered.
                            ///creates new object then saves the context to the CoreData
                            Button(action:{withAnimation{
                                ///create new object
                                let thing = Thing(context: self.context)
                                thing.list = self.things.first
                                ///save the context to CoreData
                                try? self.context.save()
                                print("Successfully saved context")
                                }
                            }){
                                Image(systemName: "plus")
                            }
                        }
                    )
        }
    }
}
