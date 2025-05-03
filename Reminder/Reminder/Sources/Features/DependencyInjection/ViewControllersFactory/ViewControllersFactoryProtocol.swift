//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 29/04/25.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashVC
    func makeLoginViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetVC
    //func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
}
