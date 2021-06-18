//
//  Request.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import Alamofire
import Foundation

class Request: NSObject {

    let baseURL = "https://p3teufi0k9.execute-api.us-east-1.amazonaws.com"
    let urlLogin =  "/v1/signin"
    let urlPizzaList = "/v1/pizza"
    
    func requestLogin(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        let param = ["email": email, "password": password]
        
        AF.request(baseURL+urlLogin , method: .post, parameters: param, encoder: JSONParameterEncoder.default).responseJSON { response in
         
            if response.response?.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
    func requestPizzaList(completion: @escaping (PizzaModel?,Bool) -> Void) {
        AF.request(baseURL+urlPizzaList, method: .get, parameters: nil).responseJSON { response in
            print(response)
            if response.response?.statusCode == 200 {
                let pizzaModel = try? JSONDecoder().decode(PizzaModel.self, from: response.data ?? Data())
                completion(pizzaModel,true)
            } else {
                completion(nil,false)
            }
        }
    }
}
