//
//  MapView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 1.11.2021.
//

import SwiftUI
import MapKit
import Foundation

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModel
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapData.mapView
        view.showsUserLocation = true
        view.showsBuildings = true
        view.showsTraffic = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let view = mapData.mapView
        view.showsUserLocation = true
        view.setUserTrackingMode(.follow, animated: true)
        view.userTrackingMode = .follow
        view.showsTraffic = true
    }
    
    class Coordinator: NSObject,MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.isKind(of: MKUserLocation.self) {return nil}
            else {
                let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
                pinAnnotation.tintColor = .red
                pinAnnotation.animatesDrop = true
                pinAnnotation.canShowCallout = true
                return pinAnnotation
            }
        }
    }
}
