//
//  LoginBottomSheetVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 15/04/25.
//

import UIKit


class LoginBottomSheetVC: UIViewController {
    
    private var viewModel = LoginBottomSheetViewModel()
    private var contentView: LoginBottomSheetView
    
    var handlerAreaHeight: CGFloat = 50.0
    
    private weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    // toda vez que criarmos a LoginBottomSheetVC teremos que passar o delegate
    init(contentView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        contentView.delegate(delegate: self)
        contentView.setupDelegateTextFields(delegate: self)
        validaTextFields()
        setupUI()
        setupGesture()
        bindingViewModel()
    }
    private func setupUI() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false // garantindo que siga nossas constraints
        setupSheetConstraints()
    }
    
    private func setupSheetConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func bindingViewModel() {
        viewModel.successResult = { [weak self] in
            // chamar a proxima tela de menu com sucesso
            self?.flowDelegate?.navigateToHome()
            
            // com erro, mostrar o erro para o usuario
            print("Chegou na ViewController")
        }
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    func animatedShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
    
    private func validaTextFields(){
        
        let email: String = contentView.getEmail()
        let password: String = contentView.getPassword()
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnabled(true)
        } else {
            configButtonEnabled(false)
        }
    }
    
    private func configButtonEnabled(_ enable: Bool){
        if enable{
            contentView.loginButton.setTitleColor(.white, for: .normal)
            contentView.loginButton.isEnabled = true
        } else {
            contentView.loginButton.setTitleColor(.lightGray, for: .normal)
            contentView.loginButton.isEnabled = false
        }
    }
    
}

extension LoginBottomSheetVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        validaTextFields()
        return true
    }
}

extension LoginBottomSheetVC: LoginBottomSheetViewProtocol {
    func tappedLoginButton() {
        viewModel.doAuth(email: contentView.getEmail(), password: contentView.getPassword())
    }
    
    
}
