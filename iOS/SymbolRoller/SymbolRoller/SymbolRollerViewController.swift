//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by Wansoo Ryu on 2022/04/23.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reload()
    }
    
    // DRY - Image, Label 변경용 함수
    func reload() {
        let symbol = symbols.randomElement()!

        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }

}
