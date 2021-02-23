//
//  CityWeather.swift
//  WeatherApp
//
//  Created by Zheng wu on 2/22/21.
//

import UIKit

class CityWeather: NSObject {
    var summary: String!
    var could: String!
    var temperature: String!
    var feelsLike: String!
    
    
    init(summary: String, temperature: String, feelsLike: String, could: String ) {
                self.summary = summary
                self.could = could
                self.temperature = temperature
                self.feelsLike = feelsLike
            }
}

