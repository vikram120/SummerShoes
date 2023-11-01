//
//  ViewController.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 03/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet  weak var nikeShoes: UIImageView!
    
    
    @IBOutlet weak var getStartBtn: UIButton!
    
   
    
    

    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientToMainView()

        // Do any additional setup after loading the view.
        
    }
    
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        
        
            yellowView.frame.size.width = yellowView.frame.height
            
            // Set the corner radius to make the view a full circle
            yellowView.layer.cornerRadius = yellowView.bounds.width / 2
            yellowView.clipsToBounds = true
        
            greenView.frame.size.width = greenView.frame.height
            
            // Set the corner radius to make the view a full circle
            greenView.layer.cornerRadius = greenView.bounds.width / 2
            greenView.clipsToBounds = true
        
                nikeShoes.layer.shadowColor = UIColor.black.cgColor
                nikeShoes.layer.shadowOpacity = 0.4
                nikeShoes.layer.shadowOffset = CGSize(width: 0, height: 30) // Adjust the offset as needed
                nikeShoes.layer.shadowRadius = 10 // Adjust the radius as needed
                nikeShoes.layer.masksToBounds = false
        
        getStartBtn.layer.shadowColor = UIColor.black.cgColor
        getStartBtn.layer.shadowOpacity = 0.5
        getStartBtn.layer.shadowOffset = CGSize(width: 0, height: 20) // Adjust the offset as needed
        getStartBtn.layer.shadowRadius = 10 // Adjust the radius as needed
        getStartBtn.layer.masksToBounds = false
        
        
        }
    
    func addGradientToMainView() {
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Define the colors for your gradient
        let topColor = UIColor(named: "67D89F")?.cgColor
        let bottomColor = UIColor.black.cgColor
        
        gradientLayer.colors = [topColor, bottomColor]
        
        // Set the gradient's start and end points
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 2.1, y: 3.2)
        
        // Set the frame of the gradient layer to match the main view's frame
        gradientLayer.frame = view.bounds
        
        // Add the gradient layer as a sublayer to the main view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func getStartedBtnClicked(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Make sure to use the correct storyboard name
            
            // Instantiate the destination view controller
            if let shoesVC = storyboard.instantiateViewController(withIdentifier: "ShoesVC") as? ShoesVC {
                // Set the modal presentation style to full screen
                shoesVC.modalPresentationStyle = .fullScreen
                
                // Present the destination view controller
                self.present(shoesVC, animated: true, completion: nil)
            }
        
        
    }



}

