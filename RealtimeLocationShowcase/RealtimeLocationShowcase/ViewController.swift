//
//  ViewController.swift
//  RealtimeLocationShowcase
//
//  Created by Harry Le on 1/4/20.
//  Copyright © 2020 Harry Le. All rights reserved.
//

import UIKit
import RealtimLocationControl
import GoogleMaps

class ViewController: UIViewController {
    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapview: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        mapview.isMyLocationEnabled = true
        mapview.settings.myLocationButton = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

// MARK: - CLLocationManagerDelegate
//1
extension ViewController: CLLocationManagerDelegate {
  // 2
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    // 3
    guard status == .authorizedWhenInUse else {
      return
    }
    // 4
    locationManager.startUpdatingLocation()
      
    //5
    mapview.isMyLocationEnabled = true
    mapview.settings.myLocationButton = true
  }
  
  // 6
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
      
    // 7
    mapview.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
      
    // 8
    locationManager.stopUpdatingLocation()
  }
}

