//
//  Extensions.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 7/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import MapKit
import CoreLocation
import Foundation
///updates the lat and long coordinates from the coordinates taken at the centre of the map
extension  ThingMapViewDelegate: MKMapViewDelegate{

    ///updates coordinates once map has stopped moving
   public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        ///retrieves values from center of map
        let centre = mapView.centerCoordinate
        setterMapCoordinates(newCoordinates: centre)
    }
}

