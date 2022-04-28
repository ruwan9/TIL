//
//  ViewController.swift
//  Weather
//
//  Created by Wansoo Ryu on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UIButton!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=cc4e0e49a3c8ca49d208746f8f5ac500") else {return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)

        }.resume()
    }
    
}

