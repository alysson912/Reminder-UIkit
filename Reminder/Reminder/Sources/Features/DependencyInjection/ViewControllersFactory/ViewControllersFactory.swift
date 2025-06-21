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
    func makeNewReceiptController() -> NewReceiptViewController
    func makeMyReceipstController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController
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
    
    func makeNewReceiptController() -> NewReceiptViewController {
        let viewController = NewReceiptViewController()
        return viewController
    }
    
    func makeMyReceipstController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController {
        let contentView = MyReceiptsView()
        let viewController = MyReceiptsViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
}
