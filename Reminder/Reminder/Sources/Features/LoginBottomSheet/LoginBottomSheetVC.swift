//
//  LoginBottomSheetVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 15/04/25.
//

import UIKit

class LoginBottomSheetVC: UIViewController {
    
    private var screen = LoginBottomSheetView()
    var handlerAreaHeight: CGFloat = 50.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGesture()
    }
    private func setupUI() {
        view.addSubview(screen)
        screen.translatesAutoresizingMaskIntoConstraints = false // garantindo que siga nossas constraints 
        setupSheetConstraints()
    }
    
  

    private func setupSheetConstraints() {
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        let heightConstraint = screen.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
     func animatedShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        screen.transform = CGAffineTransform(translationX: 0, y: screen.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.screen.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}
