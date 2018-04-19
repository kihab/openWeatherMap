//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit
import MapKit

protocol CityCollectionViewDeletionDelegate: class {
    
    func deleteCity(cell: CitiesCollectionViewCell)
}

protocol HomeViewControllerProtocol {
    
    func populateCollectionView()
    var citiesList:[LocalCityModel]? {set get}
}
class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedLatitude: Double?
    var selectedLongitude: Double?
    var pin = MKPointAnnotation()
    
    var citiesList:[LocalCityModel]?
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        let storage = Storage()
        presenter = HomePresenter(viewController: self, storageHelper: storage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.getCitiesList()
    }
    
    func populateCollectionView() {
        citiesCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let cityViewController = segue.destination as? CityViewController
             else { return }
        
        if segue.identifier == Constants.CITY_DETAILS_SEGUE {
            
            guard let cities = citiesList,
            let selectedCell = sender as? UICollectionViewCell,
            let selectedRowIndex = citiesCollectionView.indexPath(for: selectedCell)?.row else { return }
            
            cityViewController.coordinates = cities[selectedRowIndex].coordinates
            
        } else if segue.identifier == Constants.NEW_CITY_DETAILS_SEGUE {
            
            guard let long = selectedLongitude, let lat = selectedLatitude else { return }
            
            mapView.removeAnnotation(pin)
            cityViewController.coordinates = Coordinates(longitude: long, latitude: lat)
            selectedLatitude = nil
            selectedLongitude = nil
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Constants.NEW_CITY_DETAILS_SEGUE {
                guard let _ = selectedLongitude, let _ = selectedLatitude else {
                    showErrorAlert()
                    return false
            }
        }
        
        return true
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: Constants.EROR_ALERT_TITLE, message: Constants.HOME_ERROR_ALERT_MESSAGE, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Constants.ERROR_ALERT_BUTTON, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        cell.delegate = self
        return cell
    }
    
}

extension HomeViewController: CityCollectionViewDeletionDelegate {
    
    func deleteCity(cell: CitiesCollectionViewCell) {
        
        guard let indexPath = citiesCollectionView.indexPath(for: cell), let cities = citiesList else { return }
        presenter?.removeCity(city: cities[indexPath.row])
    }
}
extension HomeViewController {
    
    @IBAction func userDidLongPress(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state != UIGestureRecognizerState.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        
        pin.coordinate = locationCoordinate
        mapView.addAnnotation(pin)
        
        selectedLatitude =  locationCoordinate.latitude
        selectedLongitude =  locationCoordinate.longitude
    }
}
