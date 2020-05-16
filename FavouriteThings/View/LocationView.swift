//
//  MapView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 5/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import MapKit
import SwiftUI

struct LocationView: View{
    ///place is an object of class Place that gets updated with coordinates and names
    @ObservedObject var model: ThingMapViewDelegate
    var body: some View{
        
        ///display content of page in a column
        VStack{
            ///display map based on model
            MapView(viewModel: model)
            ScrollView{
                ///display the following elements in a vertical column
                VStack{
                    ///display location name heading called Location
                    Text(Thing.LocationTextPlaceHolder)
                    ///display textfield for the location name for the thing or placeholder text
                    TextField(Thing.locationNameTextFieldPlaceHolder, text: model.$thing.thingLocationName)
                }
                ///display the following elements in a horizontal column
                HStack{
                    ///display text Latitude
                    Text(Thing.latitudeTextPlaceHolder)
                    ///display textfield for the location name for the thing or placeholder text
                    TextField(Thing.latitudeTextFieldPlaceHolder, text: $model.textFieldLatitude, onCommit: {
                             ///update name based on coordinates in textfields
                            self.model.updateNameFromCoordinate()

                    })
                }
                ///display the following elements in a horizontal column
                HStack{
                    ///display text Longitude
                    Text(Thing.longitudeTextPlaceHolder)
                    ///display textfield for the location name for the thing or placeholder text
                    TextField(Thing.longitudeTextFieldPlaceHolder, text: $model.textFieldLongitude, onCommit: {
                            ///update name based on coordinates in textfields
                            self.model.updateNameFromCoordinate()

                    })
                }
                ///display a button which updates the thing's coordinates based on its location name
                Button(Thing.coordinatesOfLocationButton){
                    ///call function in ThingMapViewDelegate class  to update the name from the coordinates places in the textfields
                    self.model.updateCoordinateFromName()
                }
            }
            ///padding for the bottom of the view
            Spacer()
            ///calls struct Keyboard that ViewModifiers the context
        }.modifier(Keyboard())
            ///make nav bar in line rather then a block element, making the top padding smaller
        .navigationBarTitle("", displayMode: .inline)    }
}
