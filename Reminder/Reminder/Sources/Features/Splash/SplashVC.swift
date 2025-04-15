//
//  SplashVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/04/25.
//

import UIKit

class SplashVC: UIViewController {

    private var splashView: SplashView?
    
    override func loadView() {
        splashView = SplashView()
        view = splashView
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.primaryRedBase// colorindo a controller ué?
        
    }
    

}
