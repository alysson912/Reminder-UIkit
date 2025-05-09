//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 15/04/25.
//

import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func tappedLoginButton()
}

class LoginBottomSheetView: UIView {
    
    private weak var delegate: LoginBottomSheetViewDelegate?
    
    public func delegate(delegate: LoginBottomSheetViewDelegate?){
        self.delegate = delegate
    }
    
    private let handleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LC.titleLoginLabel.text
        label.textColor = .black
        label.font = Typography.subHeading
        return label
    }()
    
    
   private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LC.emailLabel.text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .clear // Colors.primaryRedBase
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder = LC.emailTextFieldPlaceholder.text
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.darkGray.cgColor
        
        tf.text = "almenezes912@gmail.com"
        return tf
    }()
        
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LC.passwordLabel.text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .clear //Colors.primaryRedBase
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder =  LC.PasswordTextFieldPlaceholder.text
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.isSecureTextEntry = true
        tf.text = "Cross912@"
        return tf
    }()
    
    
     lazy var loginButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = false
        btn.backgroundColor = Colors.primaryRedBase
        btn.titleLabel?.font = Typography.subHeading
        btn.setTitle(LC.loginButtonTitle.text, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  Metrics.loginButtonCornerRadius
        btn.contentMode = .scaleAspectFill
        btn.tintColor = .white
         btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    @objc private func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
    }
    
    func setupDelegateTextFields(delegate: UITextFieldDelegate) {
       emailTextField.delegate = delegate
       passwordTextField.delegate = delegate
   }
    
    
    public func getEmail() -> String{
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return passwordTextField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = Metrics.small
//        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            handleArea.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.small),
//            handleArea.centerXAnchor.constraint(equalTo: centerXAnchor),
//            handleArea.widthAnchor.constraint(equalToConstant: 40),
//            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),
            
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight)
            
            
        ])
    }
}
