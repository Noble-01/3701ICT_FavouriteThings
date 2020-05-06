//
//  MapView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 5/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI

struct MapView: View{
    @State var name = ""
    @State var latitude = ""
    @State var longitude = ""
    var body: some View{
        VStack{
            HStack{
                Text("Location:")
                TextField("Enter location", text: $name)
            }
            HStack{
                Text("Lat:")
                TextField("Enter location", text: $latitude)
            }
            HStack{
                Text("Long:")
                TextField("Enter location", text: $longitude)
            }
        }

    }
}
