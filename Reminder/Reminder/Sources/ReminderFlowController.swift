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
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self ) // MyreceiptsVC()
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

//MARK: - Home

extension ReminderFlowController: HomeFlowDelegate {
    func navigateToRecipes() {
        let receipesViewController = viewControllerFactory.makeNewReceiptController()
        self.navigationController?.pushViewController(receipesViewController, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func navigateToMyRecipes() {
        let myReceiptsViewController = viewControllerFactory.makeMyReceipstController(flowDelegate: self)
        self.navigationController?.pushViewController(myReceiptsViewController, animated: true)
    }
    
    func logoutButtonAction() {
        navigationController?.popViewController(animated: true)
        UserDefaultsManager.removeUser()
        }
    
   
    
}

//MARK: - MyReceipts

extension ReminderFlowController: NewReceiptViewFlowDelegate {
    func goToNewReceips() {
        
    }
    
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func addButtonAction() {
        
    }

}

extension ReminderFlowController: MyReceiptsFlowDelegate {
    func goToReceipts() {
        
    }
    
    func actionTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionTappedAddButton() {
        
    }
    
    
}
