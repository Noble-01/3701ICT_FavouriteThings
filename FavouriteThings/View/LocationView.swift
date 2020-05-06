//
//  MapView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 5/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI

struct LocationView: View{
    ///place is an object of class Place that gets updated with coordinates and names
    @ObservedObject var place = Place()

    var body: some View{
        
        VStack{
            MapView(viewModel: place)

            ScrollView{
                VStack{
                Text("Location:").font(.title)
                    TextField("Enter location", text: $place.name)
                }
                HStack{
                    Text("Latitude:")
                    TextField("Enter location", text: $place.latitude, onCommit: {
                        self.place.updateNameFromCoordinate()
                    })
                }
                HStack{
                    Text("Longitude:")
                    TextField("Enter location", text: $place.longitude, onCommit: {
                        self.place.updateNameFromCoordinate()
                    })
                }
                Button("Find coordinates for location name"){
                    ///call function in Place class  to update the name from the coordinates places in the textfields
                    self.place.updateCoordinateFromName()
                }
            }

            Spacer()
            ///function calls extension from struct keyboard
        }.KeyboardResponsive()
    }
}
