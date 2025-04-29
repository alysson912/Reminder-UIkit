//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 24/04/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var successResult: (() -> Void)? // closures
        
    

    func doAuth(email: String, password: String) {
        print(email, password)
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                
                print("Failed to login: \(error.localizedDescription)")
                return
            } else {
                self?.successResult?()
            }
            
            
        }
    }
    

   
    
    
    
}
