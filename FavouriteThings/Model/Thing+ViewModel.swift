//
//  Thing+ViewModel.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 27/4/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//
import CoreData
import SwiftUI
import Foundation
import MapKit
import CoreLocation

extension Thing {
    ///placeholder variable for notes  label text
    static var notesPlaceHolder: String = "Notes:"
    ///placeholder variable for image URL  label text
    static var imageURLPlaceHolder: String = "Image URL:"
    ///placeholder variable for textfield heading values
     static var newElementTextPlaceHolder: String = "<value>"
     ///placeholder variable for the title text/textfield property
     static var titleValuePlaceHolder: String = "<Title>"
     ///placeholder variable for sub title text/textfield property
     static var subtTitleValuePlaceHolder: String = "<Subtitle>"
     ///placeholder varaible for Image URL textfield default value
     static var imageURLTextFieldPlaceHolder: String = "URL of Image"
     ///placeholder variable for heading 1  textfield
     static var heading1PlaceHolder: String = "Heading1:"
     ///placeholder variable for heading 2  textfield
     static var heading2PlaceHolder: String = "Heading2:"
     ///placeholder variable for heading 3  textfield
     static var heading3PlaceHolder: String = "Heading3:"
     ///placeholder variable for notes textfield default value
     static var notesTextFieldPlaceHolder: String = "Add a note"
     ///placeholder variable for image URL textfield
     static var defaultImagePlaceHolder: String = "Image URL"
    
    ///image to test the remoteURL for images
    ///https://i.redd.it/qi0r0pdbsgs31.jpg
     ///setter and getter for imageURL  of object thing
    var thingImageURL : String {
        ///set the attribute imageURL for entity Things to a new value
        set{imageURL = newValue}
        ///retrieve the value stored in attribute imageURL or return an empty string if value is nil
        get {imageURL ?? ""}
        }
    ///setter and getter for title  of object thing
    var title : String {
        set {thingTitle = newValue}
        get {thingTitle ?? ""}
        }
    ///setter and getter for imageURL  of object thing
    var subTitle : String {
        set{thingSubTitle = newValue}
        get {thingSubTitle ?? ""}
        }
    ///setter and getter for heading1   of object thing
    var heading1 : String {
        set{thingHeading1 = newValue}
        get {thingHeading1 ?? ""}
        }
    ///setter and getter for heading 2  of object thing
    var heading2 : String {
        set{thingHeading2 = newValue}
        get {thingHeading2 ?? ""}
        }
    ///setter and getter for heading 3  of object thing
    var heading3 : String {
        set{thingHeading3 = newValue}
        get {thingHeading3 ?? ""}
        }
    ///setter and getter for heading 1 value  of object thing
    var heading1Value : String {
        set{thingHeading1Value = newValue}
        get {thingHeading1Value ?? ""}
        }
    ///setter and getter for heading 2 value  of object thing
    var heading2Value : String {
        set{thingHeading2Value = newValue}
        get {thingHeading2Value ?? ""}
        }
    ///setter and getter for heading 3 value  of object thing
    var heading3Value : String {
        set{thingHeading3Value = newValue}
        get {thingHeading3Value ?? ""}
        }
    ///setter and getter for image  of object thing
    var thingImage : String {
        set{image = newValue}
        get {image ?? ""}
        }
    ///setter and getter for notes of object thing
    var thingNote : String {
        set{note = newValue}
        get {note ?? ""}
        }
    var thingLocationName: String{
        set {locationName = newValue}
        get {locationName ?? ""}
    }
    
    var thingLatitude: String {
        ///default coordinates for which the below vars use
        set {latitude = Double(newValue) ?? -27.962}
        get {"\(latitude)"}
    }
    
    var thingLongitude: String {
        ///default coordinates for which the below vars use
        set {longitude = Double(newValue) ??  153.382}
        get {"\(longitude)"}
    }
    ///retrieve coordinates from model and place them into varaibles latitude and longitude
    func getterMapCoordinates() -> CLLocationCoordinate2D{
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    ///set the long and lat values to the vars for the Thing object
    func setterMapCoordinates(newCoordinates: CLLocationCoordinate2D){
        thingLongitude = "\(newCoordinates.longitude)"
        thingLatitude = "\(newCoordinates.latitude)"
    }
    ///update coordinates once the name has been fully entered into the textfield
    func updateCoordinateFromName(){
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///returns long and lat coordinates based on name used
            geocoder.geocodeAddressString(thingLocationName) { (maybePlaceMarks, maybeError) in
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
            /// CLGeocoder allows for reverse and forwarding geocoding with both names and coordinates
            let geocoder = CLGeocoder()
            ///var to store location name from coordinates
            let location = CLLocation(latitude: latitude, longitude: longitude)
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
                self.thingLocationName = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "<Yeah your not on earth>"
            }
        }
    /**
       function is used to update the  uiImage variable and assign a image to the prarameter. function also makes use of a dictionary to store image urls
        
            ##important Notes##
     1. check for dictionary in scenedelegate
     2. dictionary is used to download/store image urls
     3. UIImageView downloads image data
     4. converts that data to a UIImage
     5. loads it back into the image view
     6. load imageURL into dictionary
        
       */
    func updateImage() -> Image {
        ///checking if dictionary exists and going through keys within the dictionary
        if SceneDelegate.imageDownloads.keys.contains(thingImageURL) {
            guard let uiImage = SceneDelegate.imageDownloads[thingImageURL] else {
                ///returns the image from the dictionary if not, returns a default image
                return Image(image ?? "potato")
            }
            ///return value UIImage
            //print("image recieved from the SceneDelegate dictionary")
            return Image(uiImage: uiImage)
        } else {
             ///guard unrwaps the variable so it the program doesn't throw a fatal error
            guard let imageURL = imageURL,
                let url = URL(string: imageURL),
                let imageData = try? Data(contentsOf: url),
                let uiImage = UIImage(data: imageData) else {
                    /**
                    If no image is retrieved from the url return default name for the var.
                    */
                    return Image(image ?? "potato")
            }
            ///places imagURL as key in the dictionary
            SceneDelegate.imageDownloads[imageURL] = uiImage
            //print("Image URL downloaded from internet")
            ///return value UIImage
            return Image(uiImage: uiImage)
        }
    }


}

///updates the lat and long coordinates from the coordinates taken at the centre of the map
extension  Thing: MKMapViewDelegate{
    ///updates coordinates once map has stopped moving
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimatžd animated: Bool) {
        ///retrieves values from center of map
        let centre = mapView.centerCoordinate
        setterMapCoordinates(newCoordinates: centre)
    }
}
