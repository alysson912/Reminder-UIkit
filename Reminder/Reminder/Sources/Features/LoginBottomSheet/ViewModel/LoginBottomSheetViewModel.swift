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
        
    

    func doAuth(userNameLogin: String, password: String) {
        print(userNameLogin, password)
        
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                
                print("Failed to login: \(error.localizedDescription)")
                return
            } else {
                self?.successResult?(userNameLogin)
            }
            
            
        }
    }
    

   
    
    
    
}
