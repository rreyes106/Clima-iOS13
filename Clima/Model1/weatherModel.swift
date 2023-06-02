//
//  weatherModel.swift
//  Clima
//
//  Created by Wrichy Reyes on 9/17/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct weatherModel {
    let conditionId: Int
    let cityName : String
    let temperature : Double
    
    var temperatureString: String{
        
        return String(format: "%1.f", temperature)
    }
    var conditionName: String{
     
               if( conditionId <= 232){
                   return "cloud.bolt"
               }
               else if( conditionId <= 321){
                   return "cloud.drizzle"
               }
               else if( conditionId <= 531){
                   return "cloud.rain"
               }
               else if( conditionId <= 622){
                   return "cloud.snow"
               }
               else if(conditionId <= 781){
                   return "cloud.fog"
               }
               else if(conditionId == 800){
                   return "sun.max"
               }
               else if(conditionId >=  800 && conditionId <= 804){
                   return "cloud.bolt"
               }
               else {
                   return "cloud"
               }
    }
    
    
}
