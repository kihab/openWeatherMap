//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol {
    
    func populateCollectionView(withCitiesList cities:[LocalCityModel])
    
}
class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    
    var citiesList:[LocalCityModel]?
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HomePresenter(viewController: self)
        presenter?.getCitiesList()
    }
    
    func populateCollectionView(withCitiesList cities: [LocalCityModel]) {
        citiesList = cities
        citiesCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let cityViewController = segue.destination as? CityViewController,
            let selectedCell = sender as? UICollectionViewCell,
            let selectedRowIndex = citiesCollectionView.indexPath(for: selectedCell)?.row,
            let cities = citiesList,
            segue.identifier == Constants.CITY_DETAILS_SEGUE else { return }
        
        cityViewController.localCity = cities[selectedRowIndex]        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        guard let cities = citiesList else {
            return 0
        }
        return cities.count
    }

    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cities = citiesList, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CITIES_VIEW_CELL_IDENTIFIER, for: indexPath) as? CitiesCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.cityNameLabel.text = cities[indexPath.row].name
        return cell
    }
}
