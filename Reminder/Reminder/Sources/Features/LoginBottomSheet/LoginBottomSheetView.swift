//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 15/04/25.
//

import UIKit

class LoginBottomSheetView: UIView {
    
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
        label.text = "Entre para acessar suas receitas!"
        label.textColor = .black
       // label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        //tf.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.8)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail: user@outlook.com", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.darkGray.cgColor
        
     //   tf.text = "asdasfd234123@gmail.com"
        return tf
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
    //    tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "password:", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.isSecureTextEntry = true
//        tf.text = "9Ex12@s"
        return tf
    }()
    
    
    lazy var loginButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.primaryRedBase
        btn.setTitle("Entrar", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  Metrics.tiny
        btn.contentMode = .scaleAspectFill
        btn.tintColor = .white
        // btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = Metrics.small
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
