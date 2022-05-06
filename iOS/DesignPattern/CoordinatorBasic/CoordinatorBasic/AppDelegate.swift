//
//  AppDelegate.swift
//  CoordinatorBasic
//
//  Created by Wansoo Ryu on 2022/05/06.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MainCoordinator로 첫 화면 시작
        let navController = UINavigationController()
        
        // 인스턴스 생성
        coordinator = MainCoordinator(navigationController: navController)
        // 첫 화면 열기
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}

