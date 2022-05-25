//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by Wansoo Ryu on 2022/05/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // thumbnail 모서리 둥글게
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDataString(dateString: chat.date)
    }
    
    // 날짜 형식 변환 2022-05-25 -> 5/25
    func formattedDataString(dateString: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 -> date
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
