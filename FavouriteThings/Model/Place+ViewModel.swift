//
//  Place+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 5/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import Foundation
import CoreLocation

class Place: Identifiable, ObservableObject{
    @Published var coordinates = CLLocationCoordinate2D(latitude: -27.962, longitude: 153.382)
    
    var name = ""
    var latitude: String {
        get { "\(coordinates.latitude)"}
        set{
            guard let coord = CLLocationDegrees(newValue)  else {return}
            coordinates.latitude = coord
        }
    }
    var longitude: String {
        get {"\(coordinates.longitude)"}
        set {
            guard let coord = CLLocationDegrees(newValue)  else {return}
            coordinates.longitude = coord
        }
    }
}
