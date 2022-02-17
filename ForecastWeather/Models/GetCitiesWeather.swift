//
//  GetCitiesWeather.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 16.02.2022.
//

import Foundation

import CoreLocation

let networkManager = NetworkManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, MainModel) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { coordinate, error in
            guard let coordinate = coordinate, error == nil else {return}
            
            networkManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (mainModel) in
                completionHandler(index, mainModel)
            }
        }
    }
}


func getCoordinateFrom(city: String, complition: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
    
    CLGeocoder().geocodeAddressString(city) { placemark, error in
        complition(placemark?.first?.location?.coordinate, error)
    }
    
}
