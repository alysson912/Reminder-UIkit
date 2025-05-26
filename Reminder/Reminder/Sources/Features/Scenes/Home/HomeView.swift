//
//  HomeView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 02/05/25.
//

import UIKit

protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func logoutButtonAction()
}

protocol HomeViewDelegate: AnyObject {
    func didTapProfileImage()
    
}

class HomeView: UIView {
    
    //MARK: ACTION IN CORDINATOR
    private weak var delegate: HomeFlowDelegate?
    
    public func delegate(delegate: HomeFlowDelegate?) {
        self.delegate = delegate
    }
    
    //MARK: IMAGEPICKER DELEGATE
    private weak var homeDelegate: HomeViewDelegate?
    
    public func homeDelegate(homeDelegate: HomeViewDelegate?) {
        self.homeDelegate = homeDelegate
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
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LC.welcomeLabel.text
        label.textColor = Colors.gray200
        label.font = Typography.input
        return label
    }()
    
    
    lazy var nameTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "nome:"
        text.returnKeyType = .done
        text.textColor = Colors.gray100
        text.font = Typography.heading
        return text
    }()
    
    let myPrescriptionButton: BottomHomeView = {
        let button = BottomHomeView(
            icon: UIImage(systemName: "newspaper"),
            titleLabel: "Minhas Receitas",
            descriptionLabel: "Acompanhe os medicamentos e gerencies os lembretes")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .purple
        return button
    }()
    
    let newPrescritonButton: BottomHomeView = {
        let button = BottomHomeView(
            icon: UIImage(systemName: "pill"),
            titleLabel: "Nova Receita",
            descriptionLabel: "Cadastre novos lembretes de receitas")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Colors.primaryRedBase
        return button
    }()
    
     lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metrics.high
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
    private func tappedLogOutButton() {
        self.delegate?.logoutButtonAction()
    }
    
    private func setupUI() {
        addSubview(profileBackGroundView)
        profileBackGroundView.addSubview(profileImageView)
        profileBackGroundView.addSubview(logOutButton)
        profileBackGroundView.addSubview(welcomeLabel)
        profileBackGroundView.addSubview(nameTextField)
        
        addSubview(contentBackGroundView)
        contentBackGroundView.addSubview(feedBackButton)
        contentBackGroundView.addSubview(myPrescriptionButton)
        contentBackGroundView.addSubview(newPrescritonButton)
        //
        setupImageGesture()
    }
    //MARK: MAPEANDO O CLICK NA USERIMAGE
    func setupImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(profileImageTapped))
        
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func profileImageTapped() {
    // imagem foi clicada
        homeDelegate?.didTapProfileImage()
    }
    
    func setupNameTextField(delegate: UITextFieldDelegate) {
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidEndEditing), for: .editingDidEnd)
        nameTextField.delegate = delegate
   }
    @objc
   private func nameTextFieldDidEndEditing() {
       let userName = nameTextField.text ?? ""
       UserDefaultsManager.saveUserName(userName: userName)
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
            
           
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            profileImageView.leadingAnchor.constraint(equalTo: profileBackGroundView.leadingAnchor, constant: Metrics.medium),
            profileImageView.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImageView.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            logOutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            logOutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.small),
            logOutButton.heightAnchor.constraint(equalToConstant: Metrics.homeButtonHeight),
            logOutButton.widthAnchor.constraint(equalToConstant: Metrics.homeButtonWidth),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            
            contentBackGroundView.topAnchor.constraint(equalTo: profileBackGroundView.bottomAnchor),
            contentBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedBackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            feedBackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            feedBackButton.bottomAnchor.constraint(equalTo: contentBackGroundView.bottomAnchor, constant: -Metrics.medium),
            feedBackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
            
            myPrescriptionButton.topAnchor.constraint(equalTo: contentBackGroundView.topAnchor, constant: Metrics.huge),
            myPrescriptionButton.leadingAnchor.constraint(equalTo: contentBackGroundView.leadingAnchor, constant: Metrics.medium),
            myPrescriptionButton.trailingAnchor.constraint(equalTo: contentBackGroundView.trailingAnchor, constant: -Metrics.medium),
            myPrescriptionButton.heightAnchor.constraint(equalToConstant: 112),
            
            newPrescritonButton.topAnchor.constraint(equalTo: myPrescriptionButton.bottomAnchor, constant: Metrics.medium),
            newPrescritonButton.leadingAnchor.constraint(equalTo: myPrescriptionButton.leadingAnchor),
            newPrescritonButton.trailingAnchor.constraint(equalTo: myPrescriptionButton.trailingAnchor),
            newPrescritonButton.heightAnchor.constraint(equalTo: myPrescriptionButton.heightAnchor),
        ])
    }
    
}
