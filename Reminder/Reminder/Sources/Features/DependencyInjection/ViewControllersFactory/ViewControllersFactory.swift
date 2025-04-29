//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 29/04/25.
//

import Foundation

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashVC {
        let contentView = SplashView()
        let viewController = SplashVC(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    ;
    func makeLoginViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetVC {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetVC(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    
}
