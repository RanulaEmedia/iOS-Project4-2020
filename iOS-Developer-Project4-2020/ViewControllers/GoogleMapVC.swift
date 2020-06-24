//
//  GoogleMapVC.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/23/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import GoogleMaps
import EMResourcer

class GoogleMapVC: BaseVC , GMSMapViewDelegate , GoogleMapsDirectionsDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var customMapView: GMSMapView!
    
    
    var place: Place?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.setupMap()
        self.setLabels()
    }
    
    
    // Mark: Setup MAp
    func setupMap() {
        
       let camera = GMSCameraPosition.camera(withLatitude: self.place?.latitude ?? 0.0, longitude: self.place?.longitude ?? 0.0, zoom: 8.0)
        
        customMapView.camera = camera
        customMapView.mapType = .normal
        customMapView.isMyLocationEnabled = true
        customMapView.delegate = self
        self.addMarker(place: self.place!)
    }
    
    
    func setLabels(){
        lblTitle.text = self.place?.name
        lblAddress.text = self.place?.address
    }
    
    // MARK: Add marker
    func addMarker(place: Place) {
        self.createMarkerOnGoogleMapView(title: place.name, snippet: place.address, lat: place.latitude ?? 0.0, long: place.longitude ?? 0.0, userInfo: "", mapView: customMapView)
        // Notes: You can send any data using user info and user where ever you need
    }
    
}

extension GoogleMapVC {

func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
    
    let infoWindow = Bundle.main.loadNibNamed("CustomInfoWindow", owner: self.view, options: nil)!.first! as! CustomInfoWindow
    infoWindow.titleLabel.text = marker.title ?? "-"
    infoWindow.subtitleLabel.text = marker.snippet ?? "-"
    infoWindow.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    infoWindow.contentView.layer.cornerRadius = 10.0
    infoWindow.contentView.applyGradient(isTopBottom: false, colorArray: [.green, .yellow, .blue, .white, .red])
    return infoWindow
}

func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    // Code here
    print("PLACE COORDINATES: \(coordinate)")
}

func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
    // Code here
    print("PLACE COORDINATES: \(marker.position)")
}

}
