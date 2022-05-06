//
//  BuyCoordinator.swift
//  CoordinatorBasic
//
//  Created by Wansoo Ryu on 2022/05/06.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
