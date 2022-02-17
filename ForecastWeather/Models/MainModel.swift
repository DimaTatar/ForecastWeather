//
//  MainModel.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 15.02.2022.
//

import Foundation

struct MainModel {
    
    var name: String = "Название"
    var temperature: Int = 0
    var temperatureString: String {
        return String(temperature)
    }
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var date: String = ""
    var week: Int = 0
    var temperatureMin: Int = 0
    var temperatureMinString: String {
        return String(temperatureMin)
    }
    var temperatureMax: Int = 0
    var temperatureMaxString: String {
        return String(temperatureMax)
    }
    var feelsLike: Int = 0
//    let tempHour: Int
//    let nameHous: String
    
    var conditionString: String {
        switch condition {
        case "clear":                        return "ясно"
        case "partly-cloudy":                return "малооблачно"
        case "cloudy":                       return "облачно с прояснениями"
        case "overcast":                     return "пасмурно"
        case "drizzle":                      return "морось"
        case "light-rain":                   return "небольшой дождь"
        case "rain":                         return "дождь"
        case "moderate-rain":                return "умеренно сильный дождь"
        case "heavy-rain":                   return "сильный дождь"
        case "continuous-heavy-rain":        return "длительный сильный дождь"
        case "showers":                      return "ливень"
        case "wet-snow":                     return "дождь со снегом"
        case "light-snow":                   return "небольшой снег"
        case "snow":                         return "снег"
        case "snow-showers":                 return "снегопад"
        case "hail":                         return "град"
        case "thunderstorm":                 return "гроза"
        case "thunderstorm-with-rain":       return "дождь с грозой"
        case "thunderstorm-with-hail":       return "гроза с градом."
        default: return "Загрузка..."
        }
        
    }
    
    init?(currentWeather: CurrentWeather) {
        temperature = currentWeather.fact.temp
        url = currentWeather.info.url
        conditionCode = currentWeather.fact.icon
        condition = currentWeather.fact.condition
        date = currentWeather.forecasts.first!.date
        week = currentWeather.forecasts.first!.week
        temperatureMin = (currentWeather.forecasts.first?.parts.day.tempMin)!
        temperatureMax = (currentWeather.forecasts.first?.parts.day.tempMax)!
        feelsLike = currentWeather.fact.feelsLike
       
    }
    
    init() {
        
    }
    
   
    
}




