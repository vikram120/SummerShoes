//
//  ShoesVC.swift
//  SummerShoes
//
//  Created by Vikram Kunwar on 03/10/23.
//

import UIKit

class ShoesVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var listBtn: UIButton!
    
    @IBOutlet weak var changeImg: UIImageView!
    
    
    @IBOutlet weak var cartLabel: UILabel!
    
    var cartItemCount: Int = 0
    

    
    
    @IBOutlet weak var docUpload: UIButton!
    
    @IBOutlet weak var addtoCart: UIButton!
    
    @IBOutlet weak var shoes: UILabel!
    
    @IBOutlet weak var shoesProduct: UILabel!
    
    @IBOutlet weak var desp: UITextView!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    private var isAnimating = true
        private var scrollTimer: Timer?
    
    var selectedItems: [[String: Any]] = []

    var cartItems: Set<String> = Set()

    
    @IBOutlet weak var shoesCVC: UICollectionView!
    
    var img = ["NikeInfinity","NikeShoe","NikeNew","Nikee","NikeAir","NikeShoe","NikeNew"]
    
    var shoesName = ["Kyrie Infinity","Nike Zoom Vome","Nike Air Max 97 SE","Nike Air Max Pulse","Tatum 1 Home","Air Jordan 1 Retro","Nike Air Max 90 G"]
    
    var shoesPro = ["Basketball Shoes","Men's shoes","Road Running Shoes","Men's Workout Shoes","Skate Shoes","Men's Hard Court Tennis Shoes","Road Racing Shoes","Golf Shoe"]
    
    var despcriptionn = ["The kyrie Infinity provide a tight custom fit enhanced reponsiveness in the forefoot and and traction up the sides,allowing players.","Carve a new lane for yourself in the Zoom Vomero 5—your go-to for complexity, depth and now, easy styling. The richly layered design includes textiles, synthetic suede and plastic accents that come together to make one of the coolest sneakers of the season","Sleek. Stylish. Simple. The Air Max 97's water-inspired design flows whether you're out for a run or out on the town. To finish it off, the full-length Nike Air cushioning lets you ride in total comfort.","Mixing one part urban to one part tough, the Air Max Pulse brings an underground touch to the iconic Air Max line. Its textile-wrapped midsole and vacuum-sealed accents boost its street cred, while colours inspired by the grime music scene keep it rough around the edges.","Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first to the fourth (and whatever OT comes up) as efficiently as possible, we stripped it down to the essentials—and made those essentials really, really good.","The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colours and textures give modern expression to an all-time favourite.","The original Nike Air Max 90 was renowned for its clean lines and timeless style. The Nike Air Max 90 G stays true to the icon with a few updates made for golf, like integrated traction and a thin overlay that helps keep out water."]
    
    var pricess = ["$130","$220","$300","$170","$250","$100","$380"]
    
    var selectedCellIndex: IndexPath? = IndexPath(item: 0, section: 0) // Set the first cell as selected by default

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profilePic.frame.size.width = profilePic.frame.height
        profilePic.layer.cornerRadius = profilePic.bounds.width / 2
        profilePic.clipsToBounds = true
        
        
        listBtn.frame.size.width = listBtn.frame.height
        listBtn.layer.cornerRadius = listBtn.bounds.width / 2
        listBtn.clipsToBounds = true
        
        
        docUpload.frame.size.width = docUpload.frame.height
        docUpload.layer.cornerRadius = docUpload.bounds.width / 2
        docUpload.clipsToBounds = true
       
        // Set the corner radius to make the button a full circle
        addtoCart.frame.size.width = addtoCart.frame.height
        addtoCart.layer.cornerRadius = addtoCart.bounds.width / 2
        addtoCart.clipsToBounds = true
        
        cartLabel.frame.size.width = cartLabel.frame.height
        cartLabel.layer.cornerRadius = cartLabel.bounds.width / 2
        cartLabel.clipsToBounds = true
       
        changeImg.layer.shadowColor = UIColor.black.cgColor
        changeImg.layer.shadowOpacity = 0.4
        changeImg.layer.shadowOffset = CGSize(width: 0, height: 30) // Adjust the offset as needed
        changeImg.layer.shadowRadius = 10 // Adjust the radius as needed
        changeImg.layer.masksToBounds = false
        
        
        docUpload.layer.shadowColor = UIColor(hex: "354150").cgColor  //59BB8C
        docUpload.layer.shadowOpacity = 0.4
        docUpload.layer.shadowOffset = CGSize(width: 0, height: 20) // Adjust the offset as needed
        docUpload.layer.shadowRadius = 10 // Adjust the radius as needed
        docUpload.layer.masksToBounds = false
        
        addtoCart.layer.shadowColor = UIColor(hex: "59BB8C").cgColor  //59BB8C
        addtoCart.layer.shadowOpacity = 0.4
        addtoCart.layer.shadowOffset = CGSize(width: 0, height: 20) // Adjust the offset as needed
        addtoCart.layer.shadowRadius = 10 // Adjust the radius as needed
        addtoCart.layer.masksToBounds = false
        
        
        if isAnimating {
            // Set initial transform for offscreen animation
            changeImg.transform = CGAffineTransform(translationX: 0, y: -changeImg.frame.height)

            // Animate coffeeCupImg into view with spring effect and limit to 1 bounce
            UIView.animate(withDuration: 5.0, delay: 0, usingSpringWithDamping: 3.0, initialSpringVelocity: 3.0, options: []) {
                self.changeImg.transform = .identity
            } completion: { _ in
           
                // Set a timer to stop the animation after 2 seconds
                self.scrollTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
//                      self.stopAnimation()
                }
            }

            
        }

        
    }
    
    
    
   
    
    @IBAction func ViewCartCLicked(_ sender: UIButton){
        let alertController = UIAlertController(
               title: "View Cart",
               message: "You have \(cartItemCount) item(s) in your cart.",
               preferredStyle: .alert
           )

           // Add a "View Cart" action to navigate to the AddToCart view controller
           let viewCartAction = UIAlertAction(title: "View Cart", style: .default) { (_) in
               // Create the AddToCart view controller
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let addToCartVC = storyboard.instantiateViewController(withIdentifier: "AddToCart") as? AddToCart {
                   // Pass the selectedItems to the AddToCart view controller
                   addToCartVC.selectedItems = self.selectedItems

                   // Present the AddToCart view controller modally
                   addToCartVC.modalPresentationStyle = .fullScreen
                   self.present(addToCartVC, animated: true, completion: nil)
               }
           }

           // Add a "Cancel" action
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

           // Add the actions to the alert controller
           alertController.addAction(viewCartAction)
           alertController.addAction(cancelAction)
             // Present the alert controller as a popup
             present(alertController, animated: true, completion: nil)
        

    }
    
    @IBAction func BackBtnCLick(_ sender:UIButton){
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addtocarBtnClicked(_ sender: UIButton){
        
        

        
        let alertController = UIAlertController(title: "Add to Cart", message: "Do you want to add this to the cart?", preferredStyle: .alert)
            
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            // Create a dictionary to represent the selected item
            let selectedItem: [String: Any] = [
            "image": self.changeImg.image as Any,
            "label": self.shoes.text as Any,
            "price": self.price.text as Any
        ]

            self.selectedItems.append(selectedItem)

                // Increment the cart item count
                self.cartItemCount += 1
                
                // Update the cartLabel with the new count
                self.cartLabel.text = "\(self.cartItemCount)"
                
                // Optionally, you can show a confirmation message
                self.showConfirmationMessage()
         
        }


            
            let noAction = UIAlertAction(title: "No", style: .cancel) { (_) in
                // Handle "No" action here (optional)
            }
            
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            
            present(alertController, animated: true, completion: nil)
        
    }
    
    func updateCartLabel() {
            cartLabel.text = "\(cartItemCount)"
        }
    
    func showConfirmationMessage() {
        let alertController = UIAlertController(
            title: "Item Added to Cart",
            message: "The item has been added to your cart.",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
    
    
    

}

extension ShoesVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shoesCVC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShoesCollection
        
        // Configure the background color based on the selected cell
                if selectedCellIndex == indexPath {
                    cell.bcView.backgroundColor = UIColor(hex: "DFC36C") // Use the correct color
                } else {
                    cell.bcView.backgroundColor = UIColor(hex: "EDDEDD") // Use the correct color
                }
                
        cell.shoesImg.image = UIImage(named: img[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Check if the selected item index is different from the previously selected index
        if selectedCellIndex != indexPath {
            // Update the selected cell index without reloading data
            selectedCellIndex = indexPath
            
            // Change the image with animation
            UIView.transition(with: changeImg, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.changeImg.image = UIImage(named: self.img[indexPath.row])
            }, completion: nil)
            
            UIView.transition(with: shoes, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.shoes.text = self.shoesName[indexPath.row]
            }, completion: nil)
            
            UIView.transition(with: shoesProduct, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.shoesProduct.text = self.shoesPro[indexPath.row]
            }, completion: nil)
            
            UIView.transition(with: desp, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.desp.text = self.despcriptionn[indexPath.row]
            }, completion: nil)
            
            UIView.transition(with: price, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.price.text = self.pricess[indexPath.row]
            }, completion: nil)
        }
        
        // Reload data only if the selected item index is different
        shoesCVC.reloadData()
    }
    
 
}


