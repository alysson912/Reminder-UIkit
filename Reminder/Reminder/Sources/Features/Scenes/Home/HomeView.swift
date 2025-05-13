//
//  HomeView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 02/05/25.
//

import UIKit

protocol HomeFlowDelegate: AnyObject {
    func backButtonAction()
    func logoutButtonAction()
}

class HomeView: UIView {
    
    private weak var delegate: HomeFlowDelegate?
    
    public func delegate(delegate: HomeFlowDelegate?) {
        self.delegate = delegate
    }
    
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
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        // btn.setTitle("Calcular", for: .normal)
        
        btn.setTitleColor(.blue, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.backgroundColor = .clear//UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        btn.setImage(UIImage(named: "backButtonIcon"), for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
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

    
    lazy var logOutButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.setBackgroundImage(UIImage(named: "logoutIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
         btn.addTarget(self, action: #selector(tappedLogOutButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var feedBackButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.gray100
        btn.setTitle(LC.feedBackButton.text, for: .normal)
        btn.setTitleColor(Colors.gray800, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = Metrics.medium
        btn.addTarget(self, action: #selector(tappedLogOutButton), for: .touchUpInside)
        return btn
    }()
    
    @objc
    private func tappedBackButton() {
        self.delegate?.backButtonAction()
    }
    
    @objc
    private func tappedLogOutButton() {
        self.delegate?.logoutButtonAction()
    }
    
    private func setupUI() {
        addSubview(profileBackGroundView)
        profileBackGroundView.addSubview(profileImageView)
        profileBackGroundView.addSubview(backButton)
        profileBackGroundView.addSubview(logOutButton)
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
            profileBackGroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackGroundView.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: Metrics.homeButtonWidth),
            backButton.heightAnchor.constraint(equalToConstant: Metrics.homeButtonHeight),
            
            profileImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.small),
            profileImageView.leadingAnchor.constraint(equalTo: profileBackGroundView.leadingAnchor, constant: Metrics.medium),
            profileImageView.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImageView.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            logOutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            logOutButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Metrics.homeButtonHeight),
            logOutButton.widthAnchor.constraint(equalToConstant: Metrics.homeButtonWidth),
            
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
