//
//  MapView.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 5/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import SwiftUI
import MapKit

///UIViewRepresentable a wrapper for view used to intergrate this view into the swiftui view hierarchy
struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel : Place
    /**
     creates map view for context on screen
     - Parameter context: A context structure containing information about the current state of the system
     - Returns: mapView
     */
    func makeUIView(context: Context) -> MKMapView {
        ///create view from given frame
        ///use property .zero because the view will change the size of frame anyway
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = viewModel
        return mapView
    }
    ///func draws map and updates the map (essentially keeps redrawing map)
    func updateUIView(_ mapView: MKMapView, context: Context) {
        ///if the map is updating don't change the maps region 
        guard !viewModel.isUpdating else {return}
        let region = MKCoordinateRegion(center: viewModel.coordinates, latitudinalMeters: 5_000, longitudinalMeters: 5_000)
        mapView.setRegion(region, animated: false)
    }

}
