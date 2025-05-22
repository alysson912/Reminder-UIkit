//
//  HomeViewViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 02/05/25.
//

import UIKit



class HomeViewController: UIViewController {
    
    private var contentView: HomeView
    private weak var flowDelegate: HomeFlowDelegate?
    private let viewModel: HomeViewModel
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        self.viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        contentView.delegate(delegate: self)
        contentView.homeDelegate(homeDelegate: self)
        contentView.setupNameTextField(delegate: self)
        setupUI()
        checkForExistingData()
    }

    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Colors.gray600
        view.addSubview(contentView)
        setupContentViewToBounds(contentView: contentView) // constraints
    }
    
    //MARK: Buscando dados sauvos no UserDefaults
   private func checkForExistingData() {
        if let user = UserDefaultsManager.loadUser() {
            contentView.nameTextField.text = UserDefaultsManager.loadUserName()
        }
       
       if let savedImage = UserDefaultsManager.loadUserImage() {
           contentView.profileImageView.image = savedImage
       }
    }
    
    
    
}

extension HomeViewController: HomeFlowDelegate {

    func logoutButtonAction() {
        UserDefaultsManager.removeUser()
        flowDelegate?.logoutButtonAction()
    }
    
}

//MARK: HOMEIMAGE DELEGATE
extension HomeViewController: HomeViewImageUserDelegate {
    func didTapProfileImage() {
        selectProfileImage()
    }
    
    
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self // conectando os delegates
        imagePicker.sourceType = .photoLibrary // acessando a biblioteca de fotos
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    // criando controller para picker
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImageView.image = editedImage
            UserDefaultsManager.saveProfileImage(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImageView.image = originalImage
            UserDefaultsManager.saveProfileImage(image: originalImage)
    }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let userName = contentView.nameTextField.text ?? ""
        UserDefaultsManager.saveUserName(userName: userName)
        
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Adicionando Itens via navigationBar
//    private func setupNavigationBar() {
//        navigationController?.navigationBar.isHidden = false
//        navigationItem.hidesBackButton = true
//        let logOutButton = UIBarButtonItem(image: UIImage(named: "logoutIcon"),
//                                           style: .plain,
//                                           target: self,
//                                           action: #selector(logoutAction))
//        logOutButton.tintColor = Colors.primaryRedBase
//        navigationItem.rightBarButtonItem = logOutButton
//    }
//    @objc
//    private func logoutAction() {
//        printContent("logoutAction")
//    }
