//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    
    let cities = ["Cairo", "London", "Berlin", "Amsterdam", "Barcelona"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.citiesViewCellIdentifier,
                                                      for: indexPath) as! CitiesCollectionViewCell
        
        cell.cityNameLabel.text = cities[indexPath.row]
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}
