//
//  ThingMapViewDelegate.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 12/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import SwiftUI
import Foundation
import MapKit
import CoreLocation

class ThingMapViewDelegate: NSObject, Identifiable, ObservableObject{
    
    @ObservedObject  var thing: Thing
    ///latitude variable for textfields in locationView
    var textFieldLatitude: String
    ///longitude variable for textfields in locationView
    var textFieldLongitude: String
    
    ///initilizer for the thing object and longitude/longitude variables
    init(thing: Thing) {
        self.thing = thing
        textFieldLatitude = thing.thingLatitude
        textFieldLongitude = thing.thingLongitude
    }
    ///retrieve coordinates from model and place them into varaibles latitude and longitude
    /**
        gets the coordinates from the Thing in a CLLocationCoordinate2D
        
     - Returns: Longitude and Latitude in a CLLocationCoordinate2D
     */
    func getterMapCoordinates() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: thing.latitude, longitude: thing.longitude)
    }
    
    ///set the long and lat values to the vars for the Thing object from a CLLocationCoordinate2D
    func setterMapCoordinates(newCoordinates: CLLocationCoordinate2D){
        thing.thingLongitude = "\(newCoordinates.longitude)"
        thing.thingLatitude = "\(newCoordinates.latitude)"
    }
    ///set the long and lat values to the vars for the Thing object
    func setterMapCoordinates(latitude: String, longitude: String){
        thing.thingLongitude =  longitude
        thing.thingLatitude = latitude
    }
    ///update coordinates once the name has been fully entered into the textfield
    func updateCoordinateFromName(){
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///returns long and lat coordinates based on name used
        geocoder.geocodeAddressString(thing.thingLocationName) { (maybePlaceMarks, maybeError) in
                ///location is optional in case we don't get anything returned
                guard let placemark = maybePlaceMarks?.first,
                    ///location is an attribute of CLLocation class
                    ///let location set the coordinate attributes of CLLocation
                let location = placemark.location else{
                    ///return errors to usre if unable to get location
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
                self.setterMapCoordinates(newCoordinates: location.coordinate)
            }
        }
    ///update name once the coordinates has been fully entered into the textfield
    func updateNameFromCoordinate(){
        ///only execute code if textfield for location name is empty
        guard thing.thingLocationName == "" else {return}
        setterMapCoordinates(latitude: textFieldLatitude, longitude: textFieldLongitude)
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///var to store location name from coordinates
        let location = CLLocation(latitude: thing.latitude, longitude: thing.longitude)
            ///returns location based on long and lat coordinates used
            geocoder.reverseGeocodeLocation(location) { (maybePlaceMarks, maybeError) in
                ///location is optional in case we don't get anything returned
                guard let placemark = maybePlaceMarks?.first else{
                    ///return errors back to user if unbale to get placemark
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
                self.thing.thingLocationName = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "<Yeah your not on earth>"
            }
        }

}


