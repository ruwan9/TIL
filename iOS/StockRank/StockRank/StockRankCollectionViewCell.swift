//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by Wansoo Ryu on 2022/05/23.
//

import UIKit

// Custom Cell
class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = "\(stock.name)"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        // 과제 방법 1 - 함수 만들기
//        diffLabel.text = "\(configureDiffColor(diff: stock.diff))%"

        // 과제 방법 2 - if/else
//        let color: UIColor
//        if stock.diff < 0 {
//            color = .systemBlue
//        } else {
//            color = .systemRed
//        }
//        diffLabel.textColor = color
//        diffLabel.text = "\(stock.diff)%"
        
        // 과제 방법 3 - 삼항연산자
        diffLabel.textColor = stock.diff < 0 ? UIColor.systemBlue : UIColor.systemRed
        diffLabel.text = "\(stock.diff)%"
    }
    
    // 1000 단위 컴마 추가
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
    // 과제 방법 1 - 음수 diff 색깔 변환
    func configureDiffColor(diff: Double) -> Double {
        if diff < 0 {
            diffLabel.textColor = UIColor.blue
        } else {
            diffLabel.textColor = UIColor.red
        }
        return diff
    }
}
