//
//  PizzaModelElement.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//
//   let pizzaModel = try? newJSONDecoder().decode(PizzaModel.self, from: jsonData)

import Foundation

// MARK: - PizzaModelElement
struct PizzaModelElement: Codable {
    let id, name: String
    let imageURL: String
    let rating: Int
    let priceP, priceM, priceG: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
        case rating, priceP, priceM, priceG
    }
}

typealias PizzaModel = [PizzaModelElement]
