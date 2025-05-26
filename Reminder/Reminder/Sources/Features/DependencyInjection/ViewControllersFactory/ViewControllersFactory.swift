//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 29/04/25.
//MARK: FACTORY TEM A RESPONSABILIDADE DE CRIAR NOSSAS CLASSES/ TELAS

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashVC
    func makeLoginViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
    func makeNewReceiptController(/*flowDelegate: NewReceiptViewDelegate*/) -> NewReceiptViewController
}


final class ViewControllersFactory: ViewControllersFactoryProtocol {
   
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashVC {
        let contentView = SplashView()
        let viewController = SplashVC(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewController = HomeViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeNewReceiptController(/*flowDelegate: NewReceiptViewDelegate*/) -> NewReceiptViewController {
       // let contentView = NewReceiptView()
      //  let viewController = NewReceiptViewController(contentView: contentView, flowDelegate: flowDelegate)
        let viewController = NewReceiptViewController()
        return viewController
    }
}
