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
    
    var textFieldLatitude: String
    var textFieldLongitude: String
    
    init(thing: Thing) {
        self.thing = thing
        textFieldLatitude = thing.thingLatitude
        textFieldLongitude = thing.thingLongitude
    }
    ///retrieve coordinates from model and place them into varaibles latitude and longitude
    func getterMapCoordinates() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: thing.latitude, longitude: thing.longitude)
    }
    
        ///set the long and lat values to the vars for the Thing object
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
        setterMapCoordinates(latitude: textFieldLatitude, longitude: textFieldLongitude)
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///var to store location name from coordinates
        let location = CLLocation(latitude: thing.latitude, longitude: thing.longitude)
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
                self.thing.thingLocationName = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "<Yeah your not on earth>"
            }
        }

}

///updates the lat and long coordinates from the coordinates taken at the centre of the map
extension  ThingMapViewDelegate: MKMapViewDelegate{

    ///updates coordinates once map has stopped moving
   public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        ///retrieves values from center of map
        let centre = mapView.centerCoordinate
        setterMapCoordinates(newCoordinates: centre)
    }
}
