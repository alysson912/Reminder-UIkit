//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 24/04/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var successResult: ((String) -> Void)? // closures
    var errorResult: ((String) -> Void)?
    

    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?("Error ao realizar login, verifique as credenciais e tente novamente.")
                return
            } else {
                self?.successResult?(userNameLogin)
            }
        }
        
    }
    

   
    
    
    
}
