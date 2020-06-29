//
//  Order.swift
//  PhoneShop
//
//  Created by Alex on 22/06/2020.
//  Copyright © 2020 arudakov. All rights reserved.
//

import UIKit

class Order: UIViewController {
    var price = 0.00
    var canAdd = false
    var components: [String] = []
    var counter = 0
    var totalPrice = 0.00
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "$" + String(totalPrice)
        componentLabel.text = "\(components)"
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if components.isEmpty {
            componentLabel.text = "Nothing here yet!"
        }
        else {
            componentLabel.text = "\(components)"
        }
        if canAdd {
            if counter > 1{
                price = price * 0.9
            }
            totalPrice += price
            priceLabel.text = "$" + String(round(totalPrice))
            canAdd = false
        }
    }
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }


    @IBOutlet var componentLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "orderToNewDevice", sender: self)
        components.removeAll()
        print(counter)
        
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
