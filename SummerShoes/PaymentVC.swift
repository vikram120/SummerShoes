//
//  PaymentVC.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 06/10/23.
//

import UIKit

class PaymentVC: UIViewController {
    
    @IBOutlet weak var backB: UIButton!
    
    @IBOutlet weak var profileI: UIImageView!
    
    @IBOutlet weak var homeAddressView: UIView!
    
    @IBOutlet weak var OfficeAddressView: UIView!
    
    @IBOutlet weak var masterCardView: UIView!
    
    @IBOutlet weak var paymentView: UIView!

    var isHomeAddressViewYellow = false
    var isOfficeAddressViewYellow = false
    
    var isMasterCardViewYellow = false
    var isPaymentViewYellow = false
    
    @IBOutlet weak var ShoesPrices: UILabel!
    
    @IBOutlet weak var TotalShoesPrice: UILabel!
    
    
    var selectedItems: [[String: Any]] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTotalPrice()
        
        backB.frame.size.width = backB.frame.height
        backB.layer.cornerRadius = backB.bounds.width / 2
        backB.clipsToBounds = true
        
        profileI.frame.size.width = profileI.frame.height
        profileI.layer.cornerRadius = profileI.bounds.width / 2
        profileI.clipsToBounds = true
        
        let total = calculateTotalPrice()
            TotalShoesPrice.text = String(format: "$%.2f", total)
            ShoesPrices.text = String(format: "$%.2f", total)

        
        
        // Add tap gesture recognizer to homeAddressView
            let homeAddressTap = UITapGestureRecognizer(target: self, action: #selector(homeAddressTapped))
            homeAddressView.addGestureRecognizer(homeAddressTap)
            
            // Add tap gesture recognizer to officeAddressView
            let officeAddressTap = UITapGestureRecognizer(target: self, action: #selector(officeAddressTapped))
        OfficeAddressView.addGestureRecognizer(officeAddressTap)
        
        let masterCardTapped = UITapGestureRecognizer(target: self, action: #selector(masterCardTapped))
    masterCardView.addGestureRecognizer(masterCardTapped)
    
        let paymentTapped = UITapGestureRecognizer(target: self, action: #selector(paymentTapped))
    paymentView.addGestureRecognizer(paymentTapped)
    
        

    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice = 0.0
        for item in selectedItems {
            if let priceString = item["price"] as? String, let price = Double(priceString.replacingOccurrences(of: "$", with: "")) {
                totalPrice += price
            } else {
                print("Invalid price found: \(item["price"] ?? "nil")")
            }
        }
        return totalPrice
    }
    
    func updateTotalPrice() {
        let total = calculateTotalPrice()
        TotalShoesPrice.text = String(format: "$%.2f", total)
        ShoesPrices.text = String(format: "$%.2f", total)

    }
    
    @objc func homeAddressTapped() {
        // Toggle the background color of homeAddressView
        if isHomeAddressViewYellow {
                homeAddressView.backgroundColor = UIColor(hex: "#B2CEE1")
            OfficeAddressView.backgroundColor = UIColor(hex: "#DFC36C")
            } else {
                homeAddressView.backgroundColor = UIColor(hex: "#DFC36C")
                OfficeAddressView.backgroundColor = UIColor(hex: "#B2CEE1")
            }
            isHomeAddressViewYellow.toggle()
            isOfficeAddressViewYellow.toggle()
    }

    @objc func officeAddressTapped() {
        // Toggle the background color of officeAddressView
        if isOfficeAddressViewYellow {
            OfficeAddressView.backgroundColor = UIColor(hex: "#B2CEE1")
                homeAddressView.backgroundColor = UIColor(hex: "#DFC36C")
            } else {
                OfficeAddressView.backgroundColor = UIColor(hex: "#DFC36C")
                homeAddressView.backgroundColor = UIColor(hex: "#B2CEE1")
            }
            isOfficeAddressViewYellow.toggle()
            isHomeAddressViewYellow.toggle()
    }
    
    
    @objc func masterCardTapped() {
        // Toggle the background color of officeAddressView
        if isMasterCardViewYellow {
            masterCardView.backgroundColor = UIColor(hex: "#B2CEE1")
                paymentView.backgroundColor = UIColor(hex: "#DFC36C")
            } else {
                masterCardView.backgroundColor = UIColor(hex: "#DFC36C")
                paymentView.backgroundColor = UIColor(hex: "#B2CEE1")
            }
            isMasterCardViewYellow.toggle()
            isPaymentViewYellow.toggle()
    }
    
    
    @objc func paymentTapped() {
        // Toggle the background color of officeAddressView
        if isPaymentViewYellow {
            paymentView.backgroundColor = UIColor(hex: "#B2CEE1")
                masterCardView.backgroundColor = UIColor(hex: "#DFC36C")
            } else {
                paymentView.backgroundColor = UIColor(hex: "#DFC36C")
                masterCardView.backgroundColor = UIColor(hex: "#B2CEE1")
            }
            isPaymentViewYellow.toggle()
            isMasterCardViewYellow.toggle()
    }
    
    func placeOrder() {
        
    }
    
    
    @IBAction func placeorderClicked(_ sender: UIButton){
        
        let alertController = UIAlertController(
               title: "Place Order",
               message: "Do you want to place the order?",
               preferredStyle: .alert
           )
           
           // Create "Yes" action
           let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
               // Handle the user's decision to place the order
               
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let confirmpageVC = storyboard.instantiateViewController(withIdentifier: "ConfirmPageVC") as? ConfirmPageVC {
                  
                   confirmpageVC.modalPresentationStyle = .fullScreen
                   self.present(confirmpageVC, animated: true, completion: nil)
               }
               self.placeOrder()
           }
           
           // Create "No" action
           let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
           
           // Add actions to the alert controller
           alertController.addAction(yesAction)
           alertController.addAction(noAction)
           
           // Present the alert controller
           present(alertController, animated: true, completion: nil)
       }
    
    @IBAction func backBB(_ sender: UIButton){
        dismiss(animated: true)
        
    }

        
    }



    
    
    
    
    
    
    
    
    
    
    
    

    




