//
//  ContentViewModel.swift
//  Lion Marks
//
//  Created by Craig Canepa on 10/19/21.
//

import MapKit
import SwiftUI

class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @State private var alerty = alertstuff()
        
    
    var locationManager: CLLocationManager?
    
    func checklocserv(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("TELL USER TO TURN IT ON")
            alerty.locationManagers()
        }
    }
    
    
    
    private func checkappauth(){
        guard let locationManager = locationManager else { return }

        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            
            print("Location is restrected")
            alerty.locationManagerno()
        case .denied:
            print("Location is restrected please go to settings and fix this.")
            alerty.locationManagerno()
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }

    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkappauth()
    }
    
    
}
