//
//  CartTVC.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 04/10/23.
//

import UIKit

class CartTVC: UITableViewCell {
    
    @IBOutlet weak var shoesNamee: UILabel!
    
    @IBOutlet weak var shoesPriceee: UILabel!
    
    @IBOutlet weak var shoesImagess: UIImageView!
    
    @IBOutlet weak var cartLabel: UILabel!
    
    var cartItemCount: Int = 1

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cartLabel.layer.cornerRadius = 8 // Adjust the radius as needed
                cartLabel.layer.masksToBounds = true
        cartLabel.text = "\(cartItemCount)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func plusBtnCLick(_ sender: UIButton){
        cartItemCount += 1
                cartLabel.text = "\(cartItemCount)"
        
        
    }
    
    @IBAction func minusbtnCLicked(_ sender: UIButton){
        
        if cartItemCount > 1 {
                    cartItemCount -= 1
                    cartLabel.text = "\(cartItemCount)"
                }
            
        
        
    }

}
