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
            HStack{
                Text("Location:")
                TextField("Enter location", text: $place.name, onCommit: {
                    ///call function in Place class to update coordinates once named and been fully entered 
                    self.place.updateCoordinateFromName()
                })
            }
            HStack{
                Text("Lat:")
                TextField("Enter location", text: $place.latitude)
            }
            HStack{
                Text("Long:")
                TextField("Enter location", text: $place.longitude)
            }
        }

    }
}
