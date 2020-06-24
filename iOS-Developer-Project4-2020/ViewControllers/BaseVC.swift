//
//  BaseVC.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/24/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createMarkerOnGoogleMapView(title: String?, snippet: String?, lat: Double, long: Double, userInfo: Any?, mapView: GMSMapView) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, long)
        marker.title = title
        marker.snippet = snippet
        
        if let _userInfo = userInfo {
            if let icon = _userInfo as? UIImage {
                marker.icon = icon
            }
        }
        
        marker.map = mapView
    }
    
    func createMarkerOnAppleMapView(title: String?, subTitle: String?, lat: Double, long: Double, userInfo: Any?, mapView: MKMapView) {
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subTitle
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapView.addAnnotation(annotation)
    }
    
    func getMarkerIcon(type: Int) -> UIImage? {
        switch type {
        case 1:
            return UIImage()
        case 2:
            return UIImage()
        default:
            return UIImage()
        }
    }
    

}

extension UIView {

func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
    if let sublayers = layer.sublayers {
        let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
    }
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colorArray.map({ $0.cgColor })
    if isTopBottom {
        gradientLayer.locations = [0.0, 1.0]
    } else {
        //leftRight
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    backgroundColor = .clear
    gradientLayer.frame = bounds
    layer.insertSublayer(gradientLayer, at: 0)
}
}
