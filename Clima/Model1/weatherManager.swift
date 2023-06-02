//
//  weatherManager.swift
//  Clima
//
//  Created by Wrichy Reyes on 8/4/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
protocol WheaterManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: weatherModel)
    func didFailWithError(error: Error)
}
struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&units=imperial&appid=f77b30b01937b199a5a38c3b8c781446"
    
    var delegate: WheaterManagerDelegate?
    
    func fetchWeather(cityName: String){
        print(cityName)
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest (urlString: String){
        //create a url
        if let url = URL(string: urlString){
            //create a session
            let session = URLSession(configuration: .default)
            
            // let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    //print(error!)
                    return
                }
                
                if let safeData = data {
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                    if let weather = self.parseJson(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)                    }
                }
            }
            task.resume()
            
        }
        
    }
    func parseJson(_ weatherData1: Data)->weatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(weatherData.self, from: weatherData1)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = weatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
            
            return weather
        }catch{
            //print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}



