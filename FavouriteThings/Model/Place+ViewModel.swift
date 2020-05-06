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
    ///default coordinates for which the below vars use
    @Published var coordinates = CLLocationCoordinate2D(latitude: -27.962, longitude: 153.382)
    
    var name = "" {
        ///update name when doing geocoding with the lat and long values
        didSet {
            ///allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///returns long and lat coordinates based on name used
            geocoder.geocodeAddressString(name) { (maybePlaceMarks, maybeError) in
                ///location is optional in case we don't get anything returned
                guard let placemark = maybePlaceMarks?.first,
                    ///location is an attribute of CLLocation class
                    ///let location set the coordinate attributes of CLLocation
                let location = placemark.location else{
                    let description: String
                    if let error = maybeError{
                        description = "\(error)"
                    } else{
                        description = "<unknown error>"
                    }
                    print("got error: \(description)")
                    return
                }
                ///update the coordinates which updates the view
                self.coordinates = location.coordinate
            }
        }
    }
    ///created varaible latitude  for map and stores in model
    var latitude: String {
        ///getter function for retrieving coordinates
        get { "\(coordinates.latitude)"}
        ///setter function to set the inital variable value
        set{
            guard let coord = CLLocationDegrees(newValue)  else {return}
            coordinates.latitude = coord
        }
    }
    ///created varaible longitude for map and stores in model
    var longitude: String {
        get {"\(coordinates.longitude)"}
        set {
            guard let coord = CLLocationDegrees(newValue)  else {return}
            coordinates.longitude = coord
        }
    }
}
