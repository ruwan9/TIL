//
//  ResultCollectionViewCell.swift
//  InstaSearchView
//
//  Created by Wansoo Ryu on 2022/05/29.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // 재사용 전에 준비
    override func prepareForReuse() {
        super .prepareForReuse()
        
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
