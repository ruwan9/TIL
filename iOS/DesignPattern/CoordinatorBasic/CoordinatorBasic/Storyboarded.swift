//
//  Storyboarded.swift
//  CoordinatorBasic
//
//  Created by Wansoo Ryu on 2022/05/06.
//

import Foundation
import UIKit

// 스토리보드에 접근, 뷰 컨트롤러의 이름을 identifier로 가진 뷰 컨트롤러를 인스턴스화

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // ex) "CoordinatorPractice(프로젝트 이름).ViewController"
       let fullName = NSStringFromClass(self)

       // .을 기준으로 split해 "ViewController"만 추출
       let className = fullName.components(separatedBy: ".")[1]

       // Bundle.main에서 Main.storyboard 가져오기
       let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

       // storyboard에 className을 identifier로 가지고 있는 ViewController 인스턴스화
       return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
