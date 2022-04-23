//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by Wansoo Ryu on 2022/04/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let cities: [String] = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers: [String] = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func changeButtonTapped(_ sender: Any) {
        let city = cities.randomElement()!
        let weather = weathers.randomElement()!
        let temp = Int.random(in: 10..<30)
        
        cityLabel.text = city
        weatherImageView.image = UIImage(systemName: weather)?.withRenderingMode(.alwaysOriginal)
        temperatureLabel.text = "\(temp)°"
    }
    
}
