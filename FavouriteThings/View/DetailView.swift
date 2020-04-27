//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//


import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var context
    /**
        the follwoing code is used to display the information about the favouriteThing objects when they are selcted from the MasterView
     */
    ///@ObservedObject is a property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes. links the class FavouriteThing so that objects can use its parameters
    @ObservedObject var model: Thing
    
    var body: some View {

        
        ///formats all text and images in a vertical stack
        VStack(alignment: .center) {
            ///display the title for the object on the screen
            TextField("Title", text: self.$model.title)
                .font(.title)
                
                ///display the sub title of favouriteThing
            TextField("", text: self.$model.subTitle)
                    .font(.subheadline)
                    .lineLimit(nil)
            
            ///retrieve image from getter func
            self.model.updateImage()
                .resizable()
                .padding(.vertical, 15.0)
                .frame(width: 299.0, height: 300.0)
                .clipShape(Circle())
                .shadow(radius: 10)
                .scaledToFit()
            
            HStack(alignment: .center) {
                ///display the following elements horizontally
                VStack(alignment: .trailing){
                    ///display text "Heading1:"
                    TextField("", text: self.$model.heading1)
                    .multilineTextAlignment(.trailing)
                    .frame(maxHeight: .infinity)
                    
                    ///display text "Heading2t:"
                    TextField("", text: self.$model.heading2)
                    .multilineTextAlignment(.trailing)
                    .frame(maxHeight: .infinity)
                    
                    ///display text "Heading3:"
                    TextField("", text: self.$model.heading3)
                    .multilineTextAlignment(.trailing)
                    .frame(maxHeight: .infinity)

                    ///display text "Image URL"
                    Text(ViewModel.imageURLPlaceHolder)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
                    
                    ///display text "Notes:"
                    Text(ViewModel.notesPlaceHolder)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)

                }
                
                VStack(alignment: .leading){
                    ///display default text "<new>" or display the heading 1 value of favouriteThing if there is a string in the object property
                    TextField("",text: self.$model.heading1Value)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    ///display default text "<new>" or display the heading 2 value of favouriteThing if there is a string in the object property
                    TextField("", text: self.$model.heading2Value)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    ///display default text "<new>" or display the heading 3 value of favouriteThing if there is a string in the object property
                    TextField("", text: self.$model.heading3Value)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ///display default text "URL of image" or display the url of favouriteThing if there is a string in the object property
                    TextField("", text: self.$model.thingImageURL)
                        
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ///display default text "Add a note" or display the notes of favouriteThingif there is a string in the object property
                    TextField("", text: self.$model.thingNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())


                }
            } .padding(.horizontal)
             .fixedSize(horizontal: false, vertical: true)

        }
        .padding(.bottom, 150.0)
 
    }
}
