//
//  ViewController.swift
//  LEDBoard
//
//  Created by Wansoo Ryu on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.contentLabel.textColor = .yellow
    }


}

