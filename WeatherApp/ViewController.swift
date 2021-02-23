//
//  ViewController.swift
//  WeatherApp
//
//  Created by Zheng wu on 2/22/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lookUpButton: UIButton!
    @IBOutlet weak var cityNameTextField: UITextField!
    private var apikey: String = "65d00499677e59496ca2f318eb68c049"
    var WeatherList: [CityWeather] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameTextField.delegate = self
        lookUpButton.backgroundColor = .clear
        lookUpButton.layer.cornerRadius = 5
        lookUpButton.layer.borderWidth = 1
        lookUpButton.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        let cityString:String = cityNameTextField.text!
        if(cityString.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Please provide a valid city name.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            validateTextAndFetchURL(cityString: cityString)
        }
    }
    
    
    func validateTextAndFetchURL(cityString: String) {
        //print("button tapped")
        WeatherList.removeAll()
       let city = cityString.replacingOccurrences(of: " ", with: "%20")
        let url: String = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apikey)"
        //print(url)
        if !url.isEmpty {
            AF.request(url).responseJSON{ [self] response in
            //print(response)
                let jsonObj = JSON(response.value!)
            //print(type(of: jsonObj))
            let jsonList = jsonObj["list"]
            for item in jsonList {

                WeatherList.append(CityWeather(
                    summary: item.1["weather"][0]["main"].description,
                                    temperature: KelvinToFahrenheit(k: item.1["main"]["temp"].description),
                                    feelsLike: KelvinToFahrenheit(k: item.1["main"]["feels_like"].description),
                    could: item.1["weather"][0]["description"].description))
            }
                performSegue(withIdentifier: "toList", sender: nil)
        }
        }

    }
    
    func KelvinToFahrenheit (k: String) -> String {
        let temprature =  Float(k)! * 9/5 - 459.67
        return NSString(format: "%.2f", temprature) as String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DestVC = segue.destination as? ListViewTableViewController {

            DestVC.weatherList = self.WeatherList
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        cityNameTextField.resignFirstResponder()
        return true
    }
    

    
    //Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}


