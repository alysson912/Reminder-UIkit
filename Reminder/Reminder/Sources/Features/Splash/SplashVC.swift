//
//  SplashVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/04/25.
// //MARK: SplashVC NAO CRIA MAIS A CLASSE, ELA CHAMA O FLOWDELEGATE QUE VAI NAVEGAR PRA LA 

import UIKit

class SplashVC: UIViewController {

    private var splashView = SplashView()
    private weak var flowDelegate: SplashFlowDelegate?
 
    // quando a classe iniciar FlowDelegate estará instanciado
    init(flowDelegate: SplashFlowDelegate) {
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ciclo de decisao se vai para login ou menu
       setup()
    }
    
    private func setup() {
        view.addSubview(splashView)
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = Colors.primaryRedBase// colorindo a controller ué?
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        splashView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

    private func setupGesture() {
        view.addSubview(splashView)
        navigationController?.isNavigationBarHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        self.flowDelegate?.openLoginBottomSheet()
        }
    }

