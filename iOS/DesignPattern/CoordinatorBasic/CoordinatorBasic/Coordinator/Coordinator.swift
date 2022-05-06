//
//  Coordinator.swift
//  CoordinatorBasic
//
//  Created by Wansoo Ryu on 2022/05/06.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
