//
//  NetworkManager.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 15.02.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&lang=ru&appid=de45cca612474e4ef6b6e7e744404d7b"
        
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        
    }
    
    private init() {}
    
}
