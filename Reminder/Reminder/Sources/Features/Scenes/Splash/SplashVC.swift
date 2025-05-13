//
//  SplashVC.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/04/25.
// //MARK: SplashVC NAO CRIA MAIS A CLASSE, ELA CHAMA O FLOWDELEGATE QUE VAI NAVEGAR PRA LA

import UIKit

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}

class SplashVC: UIViewController {

    private var contentView: SplashView
    private weak var flowDelegate: SplashFlowDelegate?
 
    // quando a classe iniciar FlowDelegate estará instanciado
    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        startBreathingAnimation() // animacao para atrasar a navegacao em 0.8
        setup()
    }
    
    private func decideNavigationFlow() {
        //Decisao de fluxo de usuario salvo
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            flowDelegate?.navigateToHome()
        } else {
            showLoginBottomSheet()
        }
    }
    
    
    
    private func setup() {
        view.addSubview(contentView)
        navigationController?.isNavigationBarHidden = true
       // view.backgroundColor = Colors.primaryRedBase// colorindo a controller ué?
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewToBounds(contentView: contentView)
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        animateLogoUp()
        self.flowDelegate?.openLoginBottomSheet()
        }
    }

//MARK: Animations
extension SplashVC {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 1.5,
                       delay: 0.0,
                       animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { _ in
            self.decideNavigationFlow()
        }
    }
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -130)
        })
    }
}
