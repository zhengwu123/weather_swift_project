//
//  DetailsViewViewController.swift
//  WeatherApp
//
//  Created by Zheng wu on 2/22/21.
//

import UIKit

class DetailsViewViewController: UIViewController {
    var currentWeather: CityWeather?

    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var cloudLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up label values
        
        feelLikeLabel.text = currentWeather?.feelsLike
        TempLabel.text = currentWeather?.temperature
        sumLabel.text = currentWeather?.summary
        cloudLabel.text = currentWeather?.could
    }
    


}
