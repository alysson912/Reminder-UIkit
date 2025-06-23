//
//  UIViewController+Extension.swift
//  appNFT
//
//  Created by ALYSSON DODO on 12/04/23.
//

import Foundation
import UIKit

// feature clicar em qualquer lugar na tela, o teclado baixar
extension UIViewController {
    
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setupContentViewToBounds(contentView: UIView){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UIView { // tudo que herda de UIView, temos sombras do card e constraints = 0
    
    //MARK: Zerando Constraints
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            topAnchor.constraint(equalTo: superView.topAnchor, constant: 10),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -10),
        ])
    }
    
    func paddingCellsItems(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            topAnchor.constraint(equalTo: superView.topAnchor, constant: 10),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -10),
        ])
    }
}
