//
//  Place.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 1.11.2021.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark
    
}
