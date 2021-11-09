//
//  Users.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 5.11.2021.
//

import CoreLocation
import SwiftUI
import Foundation

struct Users: Codable, Identifiable {
    var id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
//    var coordinates: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case id, name, username, email, address, phone, website, company
        case coordinates = "Coordinates"
    }
    
    struct Address: Codable {
        var street, suite, city, zipcode: String
    }
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.lat,
            longitude: coordinates.lng)
    }

    struct Coordinates: Codable {
        var lat, lng: Double
    }
    
    struct Company: Codable {
        var name, catchPhrase, bs: String
    }
}



enum CodingKeys: String, CodingKey {
    case id, name, username, email, address, phone, website, company
    case coordinates = "Coordinates"
}
