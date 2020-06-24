//
//  ViewController.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/22/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import EMResourcer

class ShowPlaceVC: UIViewController  {
    
    var places: [Place] = []
    
    @IBOutlet weak var tableView: UITableView!
        {
        didSet {
        tableView.dataSource = self
        tableView.delegate = self
        } }
     
    
   // var places: Place?
    //var placeData = PlacesData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manageDataList()
    }
    
    
    func manageDataList() {
        addListData(completion: {
            self.tableView.reloadData()
        })
    }
    
    @IBAction func didTappedOnAllPlaces(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: "AllPlaces") as! AllPlacesVC
        destVc.places = self.places
        self.navigationController?.pushViewController(destVc, animated: true)
    }
    
    
    func addListData(completion: () -> ()) {
        
        let place1 = Place(_id: nil, name: "Keells Super, Union Place", address: "Union Place, 199 Union Pl, Colombo 00200", latitude: 6.8972087, longitude: 79.8555767)
        let place2 = Place(_id: nil, name: "Arpico Super Centre, Maharagama", address: "A4 - Maharagama, Maharagama 10280", latitude: 6.8655794, longitude: 79.8775226)
        let place3 = Place(_id: nil, name: "Commercial Bank - Kaduwela Branch", address: "No 508/5, Avissawella Road,, Kaduwela", latitude: 6.9374199, longitude: 79.9444619)
        let place4 = Place(_id: nil, name: "Nugegoda Railway Station", address: "Station Ln, Nugegoda 10250", latitude: 6.8705181, longitude: 79.8910023)
        let place5 = Place(_id: nil, name: "Fashion Bug Head Office", address: "405 Pepiliyana Rd, Colombo", latitude: 6.8630855, longitude: 79.8751405)
        let place6 = Place(_id: nil, name: "Passport office", address: "Subuthi Dr, Sri Jayawardenepura Kotte", latitude: 6.8856518, longitude: 79.8788409)
        let place7 = Place(_id: nil, name: "Shanthi Plastic (Pvt) Ltd", address: "379 Galle Rd, Mount Lavinia 10370", latitude: 6.8548248, longitude: 79.8538318)
        let place8 = Place(_id: nil, name: "University of Moratuwa", address: "Bandaranayake Mawatha, Moratuwa 10400", latitude: 6.8324879, longitude: 79.8635441)
        let place9 = Place(_id: nil, name: "Kelaniya Raja Maha Viharaya", address: "Peliyagoda", latitude: 6.9145982, longitude: 79.8537785)
        let place10 = Place(_id: nil, name: "Ananda College", address: "111/9E Temple Rd, Colombo 01500", latitude: 6.8979841, longitude: 79.8511114)
        
        self.places = [place1, place2, place3, place4, place5, place6, place7, place8, place9, place10]
        completion()
    }

    
}

// place list
extension ShowPlaceVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Places"
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: ShowPlaceTBCell = tableView.dequeueReusableCell(withIdentifier: "places", for: indexPath) as? ShowPlaceTBCell {
            
            let item = self.places[indexPath.row]
            cell.configureCell(with: item)
            
            cell.appleMap = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let destVc = storyboard.instantiateViewController(identifier: "AppleMap") as! AppleMapVC
                destVc.place = item
                self.navigationController?.pushViewController(destVc, animated: true)
            }
            
            cell.googleMap = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let destVc = storyboard.instantiateViewController(identifier: "GoogleMap") as! GoogleMapVC
                destVc.place = item
                self.navigationController?.pushViewController(destVc, animated: true)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

