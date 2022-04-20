//
//  BountyInfo.swift
//  BountyList
//
//  Created by Wansoo Ryu on 2022/03/03.
//

import UIKit

// Model
struct BountyInfo {
    let name: String
    let bounty: Int
    var img: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
