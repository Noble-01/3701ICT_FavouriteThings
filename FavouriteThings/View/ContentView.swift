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
    ///calls the context from the Model
    ///inject context into environment from the scenedelegate and access it through the @environment property wrapper
    @Environment(\.managedObjectContext) var context
    ///fetches the database throug using a keypath and stores it as var things
    ///FetchRequest of Things and title
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
                        ///calls function addObject() which creates the object for the model and saves it as well in the function
                        self.things.first?.addObject(context:self.context)
                        print("Successfully saved context")
                        }
                    }){
                        Image(systemName: "plus")
                    }
                }
            )
        ///navigation style that allows for the screen to split in two shoing the navigation view and detail view
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
    }
}
