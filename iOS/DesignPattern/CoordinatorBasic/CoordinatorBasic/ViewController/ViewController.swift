//
//  ViewController.swift
//  CoordinatorBasic
//
//  Created by Wansoo Ryu on 2022/05/06.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    // MainCoordinator 추가
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    @IBAction func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

