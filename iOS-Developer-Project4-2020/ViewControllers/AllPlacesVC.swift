//
//  AllPlacesVC.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/24/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import GoogleMaps
import EMResourcer

var mapView = GMSMapView()

class AllPlacesVC: UIViewController {
    
    var places : [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()

         self.showCurrentLocationOnMap()
        
    }

    func showCurrentLocationOnMap(){
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let camera = GMSCameraPosition.camera(withLatitude: places[0].latitude ?? 0.0, longitude: places[0].longitude ?? 0.0, zoom: 12.0) //Set default lat and long
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        for data in places{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: data.latitude ?? 0.0, longitude: data.longitude ?? 0.0)
            marker.title = data.name
            marker.snippet = data.address
            marker.map = mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        // self.locationManager.stopUpdatingLocation()
    }
}
