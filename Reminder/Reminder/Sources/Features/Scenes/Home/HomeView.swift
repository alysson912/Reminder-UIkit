//
//  HomeView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 02/05/25.
//

import UIKit

protocol HomeFlowDelegate: AnyObject {
    
}

class HomeView: UIView {
    
    
    private lazy var contentBackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var profileBackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LC.welcomeLabel.text
        label.textColor = Colors.gray200
        label.font = Typography.input
        return label
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NameLabel!"
        label.textColor = Colors.gray100
        label.font = Typography.heading
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")//UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metrics.huge
        return imageView
    }()

    
    lazy var feedBackButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.gray100
        btn.setTitle(LC.feedBackButton.text, for: .normal)
        btn.setTitleColor(Colors.gray800, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = Metrics.medium
        // btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    private func setupUI() {
        addSubview(profileBackGroundView)
        profileBackGroundView.addSubview(profileImageView)
        profileBackGroundView.addSubview(welcomeLabel)
        profileBackGroundView.addSubview(nameLabel)
        
        addSubview(contentBackGroundView)
        contentBackGroundView.addSubview(feedBackButton)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackGroundView.topAnchor.constraint(equalTo: topAnchor),
            profileBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackGroundView.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            profileImageView.topAnchor.constraint(equalTo: profileBackGroundView.topAnchor, constant: Metrics.huge),
            profileImageView.leadingAnchor.constraint(equalTo: profileBackGroundView.leadingAnchor, constant: Metrics.medium),
            profileImageView.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImageView.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            
            contentBackGroundView.topAnchor.constraint(equalTo: profileBackGroundView.bottomAnchor),
            contentBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedBackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            feedBackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            feedBackButton.bottomAnchor.constraint(equalTo: contentBackGroundView.bottomAnchor, constant: -Metrics.medium),
            feedBackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
        ])
    }
    
}
