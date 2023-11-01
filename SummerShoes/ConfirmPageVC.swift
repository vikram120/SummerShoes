//
//  ConfirmPageVC.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 06/10/23.
//

import UIKit
import WebKit

class ConfirmPageVC: UIViewController {
    
    @IBOutlet weak var confettiWeb: WKWebView!
    
    @IBOutlet weak var clickBtn: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfetti()


    }
    
    
    @IBAction func continueShoppingBtnCLicked(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let shoesVC = storyboard.instantiateViewController(withIdentifier: "ShoesVC") as? ShoesVC {
           
            shoesVC.modalPresentationStyle = .fullScreen
            self.present(shoesVC, animated: true, completion: nil)
        }
        
    }
    
    func loadConfetti(){
        if let gifURL = Bundle.main.url(forResource: "confetti", withExtension: "gif"){ // Replace with your GIF filename
            let request = URLRequest(url: gifURL)
            confettiWeb.backgroundColor = .clear
            confettiWeb.isOpaque = false  // Set isOpaque to false

            confettiWeb.load(request)
            
            self.view.bringSubviewToFront(clickBtn)

        }
        
    }
    

    
}
