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
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        contentView.delegate(delegate: self)
        setupUI()
        //setupNavigationBar()
    }

    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Colors.gray600
        view.addSubview(contentView)
        setupContentViewToBounds(contentView: contentView) // constraints
    }

}

extension HomeViewController: HomeFlowDelegate {
    func logoutButtonAction() {
        flowDelegate?.logoutButtonAction()
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
