//
//  CitiesCollectionViewCell.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

class CitiesCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate:CityCollectionViewDeletionDelegate?
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        delegate?.deleteCity(cell: self)
    }
    
}
