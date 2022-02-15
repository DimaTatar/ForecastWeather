//
//  CurrentWeather.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 14.02.2022.
//

import Foundation

struct CurrentWeather: Decodable {
        let cod: String
        let message, cnt: Int
        let list: [List]
        let city: City
}

struct City : Decodable {
    let name: String
}

struct List: Decodable {
    let dt: Int
    let main: MainWeather
    let weather: [Weather]
}

struct MainWeather: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
}

struct Weather: Decodable {
    let main: MainEnum
    let weatherDescription: Description
    
    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case небольшаяОблачность = "небольшая облачность"
    case небольшойДождь = "небольшой дождь"
    case небольшойСнег = "небольшой снег"
    case пасмурно = "пасмурно"
    case переменнаяОблачность = "переменная облачность"
    case ясно = "ясно"
}

