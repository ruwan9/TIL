//
//  ViewController.swift
//  OddEvenGame
//
//  Created by Wansoo Ryu on 2022/04/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var computerBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!
    @IBOutlet var resultLbl: UILabel!
    @IBOutlet var imageContainer: UIView!
    @IBOutlet var fistImage: UIImageView!
    
    var player: AVAudioPlayer?
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
        
        self.imageContainer.isHidden = true
        
        self.play(fileName: "intro")
    }
    
    func play(fileName: String) {
        let filePath = Bundle.main.url(forResource: fileName, withExtension: "mp3")
    
        guard let path = filePath else {
            return
        }
//        self.player = try? AVAudioPlayer(contentsOf: path)
        do {
            self.player = try AVAudioPlayer(contentsOf: path)
            guard let soundPlayer = self.player else {
                return
            }
            soundPlayer.prepareToPlay()
            soundPlayer.play()
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임 시작!")
        
        self.imageContainer.isHidden = false
        
        self.play(fileName: "gamestart")
        
        // 애니메이션
        UIView.animate(withDuration: 3.0){
            self.fistImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }
        
        
        }
    
    func showAlert() {
        let alert = UIAlertController.init(title: "GAME START", message: "홀 / 짝을 선택하세요", preferredStyle: .alert)
        
        let oddBtn = UIAlertAction.init(title: "홀", style: .default) {_ in
            print("홀 버튼 클릭")
            self.play(fileName: "click")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            self.getWinner(count: value, select: "홀")
        }
        
        let evenBtn = UIAlertAction.init(title: "짝", style: .default) {_ in
            print("짝 버튼 클릭")
            self.play(fileName: "click")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            self.getWinner(count: value, select: "짝")
    }
        
        // alert에 textField 추가
        alert.addTextField {textField in textField.placeholder = "배팅할 구슬의 개수를 입력해주세요."}
        
        // alert에 Btn 추가
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        // present
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
            
        }
    }
    
    func getWinner(count: Int, select: String) {
        let com = self.getRandom()
        let comType = (com % 2 == 0 ? "짝" : "홀")
        
        var result = comType
        
        if comType == select {
            result = result + "(User Win)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "user", count: count)
        } else {
            result = result + "(Computer Win)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "com", count: count)
        }
        
    }
    
    func checkAccountEmpty(balls: Int) -> Bool {
        return balls == 0
    }
    
    func calculateBalls(winner: String, count: Int) {
        if winner == "com" {
            self.userBallsCount = self.userBallsCount - count
            self.comBallsCount = self.comBallsCount + count
            if self.checkAccountEmpty(balls: self.userBallsCount) {
                self.resultLbl.text = "컴퓨터 최종 승리"
            }
        } else {
            self.userBallsCount = self.userBallsCount + count
            self.comBallsCount = self.comBallsCount - count
            if self.checkAccountEmpty(balls: self.comBallsCount) {
                self.resultLbl.text = "사용자 최종 승리"
            }
        }
        
        self.userBallCountLbl.text = "\(self.userBallsCount)"
        self.computerBallCountLbl.text = "\(self.comBallsCount)"
    }
    
    // 1~10 사이 random한 숫자 받아오기
    func getRandom() -> Int {
        return Int(arc4random_uniform(10)+1)
    }


}

