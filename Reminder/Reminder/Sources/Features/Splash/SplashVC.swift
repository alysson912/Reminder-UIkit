//
//  SplashVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/04/25.
//

import UIKit

class SplashVC: UIViewController {

    private var splashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ciclo de decisao se vai para login ou menu
       setup()
    }
    
    private func setup() {
        view.addSubview(splashView)
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = Colors.primaryRedBase// colorindo a controller ué?
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        splashView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

    private func setupGesture() {
        view.addSubview(splashView)
        navigationController?.isNavigationBarHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetVC()
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animatedShow()
        }
    }
}
