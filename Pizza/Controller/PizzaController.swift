//
//  PizzaController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit

class PizzaController: NSObject {

    let request = Request()
    let pizzaDetailViewController = "PizzaDetailViewController"
    
    private var pizzaList: PizzaModel?
    
    func  requestPizzaList(completion: @escaping (Bool) -> Void) {
        request.requestPizzaList { [weak self] pizzaModelList, success in
            if success {
                if let pizzaModelList = pizzaModelList {
                    self?.pizzaList = pizzaModelList
                    completion(true)
                }
            } else {
                completion(false)
            }
        }
    }
    
    func numberOfRowsInSection() -> Int  {
        return pizzaList?.count ?? 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> PizzaModelElement {
        return pizzaList?[indexPath.row] ?? PizzaModelElement(id: "", name: "", imageURL: "", rating: 0, priceP: 0, priceM: 0, priceG: 0)
    }
}
