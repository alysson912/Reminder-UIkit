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
        image.image = UIImage( systemName:  "plus.magnifyingglass" )
        image.tintColor = .white
        return image
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remind!"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private func addViews() {
        addSubview(backGroundView)
        backGroundView.addSubview(titleLabel)
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
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 24),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Metrics.medium),
            
            logoImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -8),
            logoImageView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 65),
            logoImageView.heightAnchor.constraint(equalToConstant: 65),
        ])
    }
}
