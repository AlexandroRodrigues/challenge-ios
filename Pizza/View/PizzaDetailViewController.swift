//
//  PizzaDetailViewController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit

class PizzaDetailViewController: UIViewController {

    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaTitle: UILabel!
    @IBOutlet weak var pizzaRating: STRatingControl!
    
    @IBOutlet weak var pizzaPButton: UIButton!
    @IBOutlet weak var pizzaMButton: UIButton!
    @IBOutlet weak var pizzaGButton: UIButton!
    @IBOutlet weak var pizzaValue: UILabel!
    
    var pizzaElement: PizzaModelElement?
    let grayButtonColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        pizzaPButton.backgroundColor = .green
    }
    
    func setupUI() {
        pizzaImage.sd_setImage(with: URL(string: pizzaElement?.imageURL ?? ""), completed: nil)
        pizzaTitle.text = "Pizza de \(pizzaElement?.name ?? "")"
        pizzaRating.rating = pizzaElement?.rating ?? 0
        pizzaValue.text = "R$ \(pizzaElement?.priceP ?? 0)"
        
    }
    
    @IBAction func pizzaPBtn(_ sender: UIButton) {
        pizzaValue.text = "R$ \(pizzaElement?.priceP ?? 0)"
        
        pizzaPButton.backgroundColor = .green
        pizzaMButton.backgroundColor = grayButtonColor
        pizzaGButton.backgroundColor = grayButtonColor
    }
    
    @IBAction func pizzaMBtn(_ sender: UIButton) {
        pizzaValue.text = "R$ \(pizzaElement?.priceM ?? 0)"
        
        pizzaPButton.backgroundColor = grayButtonColor
        pizzaMButton.backgroundColor = .green
        pizzaGButton.backgroundColor = grayButtonColor
    }
    
    @IBAction func pizzaGBtn(_ sender: UIButton) {
        pizzaValue.text = "R$ \(pizzaElement?.priceG ?? 0)"
        
        pizzaPButton.backgroundColor = grayButtonColor
        pizzaMButton.backgroundColor = grayButtonColor
        pizzaGButton.backgroundColor = .green
    }
    
    @IBAction func btnBuy() {
        if let vc = storyboard?.instantiateViewController(identifier: "SuccessViewController") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
