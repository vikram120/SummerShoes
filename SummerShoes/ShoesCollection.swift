//
//  ShoesCollection.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 03/10/23.
//

import UIKit

class ShoesCollection: UICollectionViewCell {
    
    @IBOutlet weak var shoesImg: UIImageView!
    
    @IBOutlet weak var bcView: UIView!
    
    
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Apply shadow to the shoesImg
            shoesImg.layer.shadowColor = UIColor.black.cgColor
            shoesImg.layer.shadowOpacity = 0.5
            shoesImg.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust the offset as needed
            shoesImg.layer.shadowRadius = 4 // Adjust the radius as needed
            shoesImg.layer.masksToBounds = false
        }
    
    
    
}






