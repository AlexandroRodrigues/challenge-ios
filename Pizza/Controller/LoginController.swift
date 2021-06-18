//
//  LoginController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit

class LoginController: NSObject {

    let request = Request()
    
    let navPizzaViewController = "navPizzaViewController"
    
    let errorTitle = "Error"
    let errorMessage = "Tente novamente"
    let btnErrorOK = "OK"
    
    func loginRequest(email: String, password: String, completion: @escaping (Bool) -> Void) {
        request.requestLogin(email: email, password: password) { success in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
