//
//  PizzaTableViewCell.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit
import SDWebImage

class PizzaTableViewCell: UITableViewCell {

    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaType: UILabel!
    @IBOutlet weak var pizzaValue: UILabel!
    @IBOutlet weak var ratingView: STRatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }


    func setupCell(pizzaElement: PizzaModelElement) {
        pizzaImage.sd_setImage(with: URL(string: pizzaElement.imageURL), completed: nil)
        pizzaType.text = "Pizza de "+pizzaElement.name
        pizzaValue.text = "R$ \(pizzaElement.priceP)"
        ratingView.rating = pizzaElement.rating
        self.contentView.layer.cornerRadius = 10
    }
}
