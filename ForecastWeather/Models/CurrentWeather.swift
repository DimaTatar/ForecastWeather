//
//  CurrentWeather.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 14.02.2022.
//

import Foundation

struct CurrentWeather: Decodable {
    
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

struct Info: Decodable {
    
    let url: String
    
}

struct Fact: Decodable {
    
    let temp: Int
    let feelsLike:Int
    let icon: String
    let condition: String
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case temp
        case icon
        case condition
    }
    
}

struct Forecast: Decodable {
    
    let date: String
    let week: Int
    let parts: Parts
    let hours: [Hours]
    
}

struct Hours: Decodable {
    
    let hour: String?
    let temp: Int?
}

struct Parts: Decodable {
     
    let day: Day
}

struct Day: Decodable {
    
    let tempMin: Int?
    let tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}


