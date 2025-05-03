//
//  SplashView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/04/25.
//

import UIKit

class SplashView: UIView {
        
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.primaryRedBase
        return view
    }()
    
    lazy var logoImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "reminderLogo")
        image.tintColor = .white
        return image
    }()
    
    
    
    private func addViews() {
        addSubview(backGroundView)
        backGroundView.addSubview(logoImageView)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Metrics.medium),
            
//            logoImageView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
            logoImageView.widthAnchor.constraint(equalToConstant: 85),
            logoImageView.heightAnchor.constraint(equalToConstant: 85),
        ])
    }
}
