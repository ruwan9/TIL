//
//  ViewController.swift
//  OddEvenGame
//
//  Created by Wansoo Ryu on 2022/04/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var computerBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!
    
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
    }
    
    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임 시작!")
    }
    


}

