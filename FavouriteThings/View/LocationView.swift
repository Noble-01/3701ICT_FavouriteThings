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
        
        VStack{
            MapView(viewModel: model)

            ScrollView{
                VStack{
                Text("Location:").font(.title)
                    TextField("Enter location", text: model.$thing.thingLocationName)
                }
                HStack{
                    Text("Latitude:")
                    TextField("Enter location", text: $model.textFieldLatitude, onCommit: {
                        self.model.updateNameFromCoordinate()
                    })
                }
                HStack{
                    Text("Longitude:")
                    TextField("Enter location", text: $model.textFieldLongitude, onCommit: {
                        self.model.updateNameFromCoordinate()
                    })
                }
                Button("Find coordinates for location name"){
                    ///call function in Place class  to update the name from the coordinates places in the textfields
                    self.model.updateCoordinateFromName()
                }
            }

            Spacer()
            ///function calls extension from struct keyboard
        }.KeyboardResponsive()
    }
}
