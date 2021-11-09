//
//  MapViewModel.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 1.11.2021.
//

import MapKit
import CoreLocation
import SwiftUI

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MapInfoView
    @Published var mapInfo = false
    
    // Map Search View
    @Published var searchView = false
    
    // Region
    @Published var mapView = MKMapView()
    
    // Based on Location
    @Published var region: MKCoordinateRegion!
    
    // MapType
    @Published var mapType: MKMapType = .standard
    
    // SearchText
    
    @Published var searchTxt = ""
    
    // Search Places
    
    @Published var places: [Place] = []
    
    @Published var user: [Users] = []
    
    // Updating MapType
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        }else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
        
    // Focus Location
    
    func focusLocation() {
        guard let _ = region else  {return}
        mapView.setRegion(region, animated: true)
        mapView.regionThatFits(region)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    // Seacrh Places
    
    func searchQuery() {
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTxt
        
        MKLocalSearch(request: request).start { (response, _) in
            guard let result = response else {return}
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(place: item.placemark)
            })
        }
    }
    
    // Pick Search Result
    
    func selectPlace(place: Place) {
        
        searchTxt = ""
        
        guard let coordinate = place.place.location?.coordinate else {return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.place.name ?? "İsimsiz"
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pointAnnotation)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        
    }
    
    
    // Alert
    @Published var permissionDenied = false
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Checking Permissions
        
        switch manager.authorizationStatus {
        case .denied:
            // Alert
            permissionDenied.toggle()
        case .notDetermined:
            // Requesting
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            manager.requestLocation()
        case .authorizedAlways:
            manager.allowsBackgroundLocationUpdates = true
            manager.pausesLocationUpdatesAutomatically = false
        default:
            ()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         // Error
        
        print(error.localizedDescription)
    }
    
    // Getting user region
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)

        // Updating map.
        self.mapView.setRegion(self.region, animated: true)
        self.mapView.regionThatFits(region)
 
        // Smooth animation
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
        
    }
}
