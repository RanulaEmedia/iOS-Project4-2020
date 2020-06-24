//
//  AppleMapVC.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/23/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import MapKit
import EMResourcer


class AppleMapVC: BaseVC , MKMapViewDelegate , AppleMapsDirectionsDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var place:Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.place)
        self.setupMap()
        self.setLabels()
    }
    

    @IBOutlet weak var customMapView: MKMapView!
    

    func setLabels(){
        lblTitle.text = self.place.name
        lblAddress.text = self.place.address
    }
    
    //function setup map
    func setupMap() {
           
           //MARK: 1. Get user current location
           //
            //let userLocation = LocationManager.shared.userocation
           
           //MARK: 1. Set center for map
           let center = CLLocationCoordinate2D(latitude: place.latitude ?? 0.0, longitude: place.longitude ?? 0.0)
           let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8))
           
           customMapView.showsUserLocation = true
           customMapView.mapType = .standard
           customMapView.delegate = self
           customMapView.setRegion(region, animated: true)
           
           //MARK: 3. Init place and add annotation to map
           
           self.addAnnotation(place: self.place!)
        }

    // MARK: Add annotation
    func addAnnotation(place: Place) {
        self.createMarkerOnAppleMapView(title: place.name, subTitle: place.address, lat: place.latitude ?? 0.0, long: place.longitude ?? 0.0, userInfo: "", mapView: customMapView)
        
        // Notes: You can send any data using user info and user where ever you need
    }
    
     // MARK: Tap on directions
    @IBAction func didTapOnDirections(_ sender: UIButton) {
        
        // Call via EMResourcer
        self.showDirectionsOnAppleMapView(place: self.place)
    }
}

extension AppleMapVC {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation) {
            print("nillllll")
            return nil
        }
               
        let annotationIdentifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
                   
        } else {
            annotationView!.annotation = annotation
       }
        let pinImage = #imageLiteral(resourceName: "pinImage")
        annotationView!.image = pinImage
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        // Code here
        print("PLACE COORDINATES: \(view.annotation?.coordinate)")
    }
    
}
