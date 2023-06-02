//
//  weatherData.swift
//  Clima
//
//  Created by Wrichy Reyes on 9/15/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct weatherData: Decodable{
    
    let name: String
    let main: Main
    let weather:  [Weather]
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
