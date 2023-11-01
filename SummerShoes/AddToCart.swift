//
//  AddToCart.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 04/10/23.
//

import UIKit

class AddToCart: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var addtocart: UITableView!
    
    @IBOutlet weak var DiscountCode: UITextField!
    
    @IBOutlet weak var totalPircee: UILabel!
    
    
    var discountAmount: Double = 0.0

    
    
    var itemsToDelete: [Int] = []

    var cartItemCount: Int = 0

    
    
    
    
    
    var selectedItems: [[String: Any]] = []


    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTotalPrice()
        let total = calculateTotalPrice()
            totalPircee.text = String(format: "$%.2f", total) // Format th

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    
        
        backButton.frame.size.width = backButton.frame.height
        backButton.layer.cornerRadius = backButton.bounds.width / 2
        backButton.clipsToBounds = true
        
        profileImg.frame.size.width = profileImg.frame.height
        profileImg.layer.cornerRadius = profileImg.bounds.width / 2
        profileImg.clipsToBounds = true
        
        DiscountCode.layer.cornerRadius = DiscountCode.bounds.height / 2.7
            DiscountCode.clipsToBounds = true
        
        
    }
    
    @IBAction func doneBtnClicked(_ sender: UIButton){
        let enteredDiscountCode = DiscountCode.text ?? ""
            let expectedDiscountCode = "XE2F57"
            
            if enteredDiscountCode == expectedDiscountCode {
                // Apply a 20% discount
                discountAmount = 0.20 // 20% discount
                updateTotalPrice()
                
                // Optionally, you can show a message to indicate that the discount was applied
                showAlert(message: "Discount applied successfully!")
            } else {
                // Handle invalid discount code here (e.g., show an error message)
                showAlert(message: "Invalid discount code. Please try again.")
            }
        
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(
            title: "Discount",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
   
    
    @IBAction func backClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
        
        
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
        let totalPriceBeforeDiscount = calculateTotalPrice()
           let discountedAmount = totalPriceBeforeDiscount * discountAmount
           let totalPriceAfterDiscount = totalPriceBeforeDiscount - discountedAmount
           
           totalPircee.text = String(format: "$%.2f", totalPriceAfterDiscount)
    }
    
    @IBAction func clearAllBtn(_ sender: UIButton){
        
        selectedItems.removeAll()

            // Update the table view to reflect the changes
            addtocart.reloadData()
            
            // Optionally, you can apply a deletion animation
            UIView.animate(withDuration: 0.3, animations: {
                self.addtocart.alpha = 0.0 // Fading out the table view
            }) { (_) in
                // After the animation, reset the alpha and reload the table view
                self.addtocart.alpha = 1.0
                self.addtocart.reloadData()
            }
            
            // Update the total price after clearing all items
            updateTotalPrice()
        
        
    }
    
    
    @IBAction func checkOutBtnCLick(_ sender: UIButton){
        
        for index in 0..<selectedItems.count {
                if let priceString = selectedItems[index]["price"] as? String,
                   var price = Double(priceString.replacingOccurrences(of: "$", with: "")) {
                    // Apply a 20% discount
                    price -= (price * 0.2)
                    // Update the price in the selectedItems array
                    selectedItems[index]["price"] = String(format: "$%.2f", price)
                }
            }

            // Proceed to PaymentVC with the updated selectedItems array
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC {
                paymentVC.selectedItems = selectedItems
                paymentVC.modalPresentationStyle = .fullScreen
                self.present(paymentVC, animated: true, completion: nil)
            }
        
    }
    
    
        
    
    
    

    
    
   
    

    

}

extension AddToCart: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CartTVC
        
        // Retrieve the selected item's image and label from the selectedItems array
        let selectedItem = selectedItems[indexPath.row]
        
        if let image = selectedItem["image"] as? UIImage, let label = selectedItem["label"] as? String,let priceString = selectedItem["price"] as? String {
            cell.shoesImagess.image = image
            cell.shoesNamee.text = label
            cell.shoesPriceee.text = priceString  // Display the price as a string

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from your data source (e.g., selectedItems)
            selectedItems.remove(at: indexPath.row)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateTotalPrice()
            
            
            
        }
    }
}


