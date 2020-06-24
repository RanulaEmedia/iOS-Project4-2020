//
//  ShowPlaceTBCell.swift
//  iOS-Developer-Project4-2020
//
//  Created by Ranula Ranatunga on 6/23/20.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import EMResourcer

class ShowPlaceTBCell: UITableViewCell {

    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var placeAddressLbl: UILabel!
    @IBOutlet weak var btnGoogleMP: UIButton!
    @IBOutlet weak var btnAppleMp: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    @IBAction func appleMap(_ sender: Any) {
        
        appleMap?()
        
    }
    
    @IBAction func googleMap(_ sender: Any) {
        
        googleMap?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    // function configurecell
    func configureCell (with model: Place){
        
        placeNameLbl.text = model.name ?? ""
        placeAddressLbl.text = model.address ?? ""
    }

    var appleMap: (() -> Void)? = nil
    var googleMap: (() -> Void)? = nil
}
