//
//  LoginModel.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI
import CoreLocation

final class LoginModel: NSObject, ObservableObject {
    
    @AppStorage("login") var login: Bool = true
    @AppStorage("phoneNumber") var phoneNumber: String = ""
    @AppStorage("password") var password: String = ""
    @AppStorage("checkBox") var checkBox: Bool = false
    
    @Published var passwordView = false
    @Published var showConfirmationDiaolog = false
    
    func requestPush() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func callNumber(phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    
    let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    public func requestAuthorisation(always: Bool = false) {
        if always {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LoginModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
    }
}
