//
//  NetworkManager.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 15.02.2022.
//

import Foundation

struct NetworkManager {
    
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (MainModel) -> Void) {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)&limit=4&hours=true"
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
//            print(String(data:data, encoding: .utf8)!)
            if let mainModel = self.parseJson(with: data) {
            
                completionHandler(mainModel)
            }

        }
        task.resume()
    }
    
    func parseJson(with data: Data) -> MainModel? {
        let decoder = JSONDecoder()
        do {
            let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
            guard let mainModel = MainModel(currentWeather: currentWeather) else {
                return nil
            }
            return mainModel
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
