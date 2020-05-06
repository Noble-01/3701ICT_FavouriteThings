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
    
    var name = ""
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
    ///update coordinates once the name has been fully entered into the textfield
    func updateCoordinateFromName(){
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
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
    ///update name once the coordinates has been fully entered into the textfield
    func updateNameFromCoordinate(){
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///var to store location name from coordinates
            let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            ///returns location based on long and lat coordinates used
            geocoder.reverseGeocodeLocation(location) { (maybePlaceMarks, maybeError) in
                ///location is optional in case we don't get anything returned
                guard let placemark = maybePlaceMarks?.first else{
                    let description: String
                    if let error = maybeError{
                        description = "\(error)"
                    } else{
                        description = "<unknown error>"
                    }
                    print("got error: \(description)")
                    return
                }
                ///update name from placemark which is placed based on the coordinates or return the administrative area of the placemark etc
                ///just returns something for user to see
                self.name = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "<Yeah your not on earth>"
            }
        }
}
