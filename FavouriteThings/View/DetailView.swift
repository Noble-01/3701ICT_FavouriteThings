//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 13/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//


import SwiftUI

struct DetailView: View {
    ///calls the context from the Mode
    @Environment(\.managedObjectContext) var context
    /**
        the follwoing code is used to display the information about the favouriteThing objects when they are selcted from the MasterView
     */
    ///@ObservedObject is a property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes. links the class FavouriteThing so that objects can use its parameters
    @ObservedObject var model: Thing
    @State var value : CGFloat = 0
    var body: some View {

        ScrollView{
            ///formats all text and images in a vertical stack
                   VStack(alignment: .center) {
                       ///display the title for the object stored in CoreData
                       TextField(Thing.titleValuePlaceHolder, text: self.$model.title)
                           .font(.title)
                           
                           ///display the sub title of thing stored in CoreData
                       TextField(Thing.subtTitleValuePlaceHolder, text: self.$model.subTitle)
                               .font(.subheadline)
                               .lineLimit(nil)
                       
                       ///retrieve image from updateImage func
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
                               ///display text "Heading1:" or value stored in coredata
                               TextField(Thing.heading1PlaceHolder, text: self.$model.heading1)
                               .multilineTextAlignment(.trailing)
                               .frame(maxHeight: .infinity)
                               
                               ///display text "Heading2:" or value stored in coredata
                               TextField(Thing.heading2PlaceHolder, text: self.$model.heading2)
                               .multilineTextAlignment(.trailing)
                               .frame(maxHeight: .infinity)
                               
                               ///display text "Heading3:" or value stored in coredata
                               TextField(Thing.heading3PlaceHolder, text: self.$model.heading3)
                               .multilineTextAlignment(.trailing)
                               .frame(maxHeight: .infinity)

                               ///display text "Image URL"
                               Text(Thing.imageURLPlaceHolder)
                               .fontWeight(.bold)
                               .multilineTextAlignment(.center)
                               .frame(maxHeight: .infinity)
                               
                               ///display text "Notes:"
                               Text(Thing.notesPlaceHolder)
                               .fontWeight(.bold)
                               .multilineTextAlignment(.center)
                               .frame(maxHeight: .infinity)

                           }
                           
                           VStack(alignment: .leading){
                               /// display the heading 1 value of thing if there is a string in the coredata
                               TextField(Thing.newElementTextPlaceHolder,text: self.$model.heading1Value)
                               .multilineTextAlignment(.leading)
                               .textFieldStyle(RoundedBorderTextFieldStyle())

                               ///display the heading 2 value of thing if there is a string in the coredata
                               TextField(Thing.newElementTextPlaceHolder, text: self.$model.heading2Value)
                               .multilineTextAlignment(.leading)
                               .textFieldStyle(RoundedBorderTextFieldStyle())

                               ///display the heading 3 value of thing if there is a string in the coredata
                               TextField(Thing.newElementTextPlaceHolder, text: self.$model.heading3Value)
                               .multilineTextAlignment(.leading)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               
                               /// display the url of thing image stored in coredata
                               TextField(Thing.defaultImagePlaceHolder, text: self.$model.thingImageURL)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               
                               /// display the notes of thing stored in coredata
                               TextField(Thing.notesTextFieldPlaceHolder, text: self.$model.thingNote)
                               .textFieldStyle(RoundedBorderTextFieldStyle())


                           }
                       } .padding(.horizontal)
                        .fixedSize(horizontal: false, vertical: true)

            }
        }.KeyboardResponsive()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
