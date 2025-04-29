//
//  ReminderFlowController.swift = Cordinator
//  Reminder
//
//  Created by ALYSSON MENEZES on 29/04/25.
//MARK: - Classe Responsavel pela Navegacao do app

import Foundation
import UIKit

class ReminderFlowController {
    // private let viewControllerFactory
    //MARK: - Properties
    private var navigationController: UINavigationController?
    //MARK: - Splash
    
    //MARK: - Login
    
    public init() {
        
    }
    //MARK: - Start Flow
    func start() -> UINavigationController?{
        let startViewController = SplashVC()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
