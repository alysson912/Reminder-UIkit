//
//  ReminderFlowController.swift = Cordinator
//  Reminder
//MARK: - CORDINATOR
//  Created by ALYSSON MENEZES on 29/04/25.
//MARK: - Classe Responsavel pela Navegacao do app, cria as classes e faz a navegacao

import Foundation
import UIKit

final class ReminderFlowController {
    
    //MARK: - Properties
    public var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    //MARK: - Start Flow - O app Inicia nessa tela
    func start() -> UINavigationController?{
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self )
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
    
    
}
//MARK: - Navigation To Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let vc = viewControllerFactory.makeHomeViewController(flowDelegate: self)//UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    
}
//MARK: - Navigation To Splash

extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animatedShow()
        }
    }
    
    
}


extension ReminderFlowController: HomeFlowDelegate {
    func logoutButtonAction() {
            UserDefaultsManager.removeUser()
            navigationController?.popViewController(animated: true)
        }
    
    func navigateToRecipes() {
        let recipesViewController = viewControllerFactory.makeNewReceiptController()
        self.navigationController?.pushViewController(recipesViewController, animated: true)
    }
    
}


