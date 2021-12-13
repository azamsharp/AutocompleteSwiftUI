//
//  LocationManager.swift
//  AutocompleteSearch
//
//  Created by Mohammad Azam on 12/13/21.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    @Published var location: CLLocation?
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    private override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.location = location
            self?.region =  MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        }
        
    }
    
}
