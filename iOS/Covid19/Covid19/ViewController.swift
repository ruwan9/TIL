//
//  ViewController.swift
//  Covid19
//
//  Created by Wansoo Ryu on 2022/04/29.
//

import UIKit

import Alamofire
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCovidOverview(completionHandler: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case let .success(result):
                print("Success \(result)")
            case let .failure(error):
                print("Failure \(error)")
                
            }
        } )
    }

    func fetchCovidOverview(completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "fUbvFmca6IAVTj9KyiQlEeR2PNZWMSk4x"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
        }
        
    }

}

