//
//  FrameworkCollectionViewCell.swift
//  AppleFramework
//
//  Created by Wansoo Ryu on 2022/05/26.
//

import UIKit

class FrameworkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // font size 조정
    override func awakeFromNib() {
        super .awakeFromNib()
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
