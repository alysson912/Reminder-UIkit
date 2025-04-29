//
//  ReminderFlowController.swift = Cordinator
//  Reminder
//
//  Created by ALYSSON MENEZES on 29/04/25.
//MARK: - Classe Responsavel pela Navegacao do app, cria as classes e faz a navegacao

import Foundation
import UIKit

class ReminderFlowController {
    // private let viewControllerFactory
    //MARK: - Properties
    public var navigationController: UINavigationController?
    
    public init() {
        
    }
    //MARK: - Start Flow - O app Inicia nessa tela
    func start() -> UINavigationController?{
        let startViewController = SplashVC(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
    
    
}
//MARK: - Navigation To Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
}
//MARK: - Navigation To Splash

extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetVC(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animatedShow()
        }
    }
    
    
}
