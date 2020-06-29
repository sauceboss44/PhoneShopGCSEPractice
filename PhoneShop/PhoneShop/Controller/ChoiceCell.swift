//
//  ChoiceCell.swift
//  PhoneShop
//
//  Created by Alex on 28/06/2020.
//  Copyright © 2020 arudakov. All rights reserved.
//

import UIKit

class ChoiceCell: UITableViewCell {
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    

        // Configure the view for the selected state
    }

}
extension ChoiceCell {
    @objc func updateCell(index: Int,indexPath: Int) {
        if index == 0 {
            codeLabel.text = ""
            descriptionLabel.text = itemDescription[indexPath]
            priceLabel.text = ""
        }
        else {
            for i in 1...5 {
                if i == index{
                    for f in loopCycles[i][0]...loopCycles[i][1]{
                        codeLabel.text = code[indexPath+loopCycles[i][0]]
                        descriptionLabel.text = itemDescription[indexPath+loopCycles[i][0]]
                        priceLabel.text = "$"+String(price[indexPath+loopCycles[i][0]])
                    }
                }
            }
        }
//        //codeLabel.text = code[0]
//        priceLabel.text = price[index]
//        descriptionLabel.text = itemDescription[index]
        
    }

}
