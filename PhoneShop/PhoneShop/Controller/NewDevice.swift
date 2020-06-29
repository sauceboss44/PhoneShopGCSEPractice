//
//  NewDevice.swift
//  PhoneShop
//
//  Created by Alex on 28/06/2020.
//  Copyright © 2020 arudakov. All rights reserved.
//

import UIKit
class NewDevice: UITableViewController {
    var choiceCounter = 0
    var deviceCounter = 0
    var yes = false
    var devicePrice = 0.00
    var orderPrice = 0
    var deviceComponents: [String] = []
    var canContinue = false
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextChoice))
        navigationItem.title = ("Choose Your " + categories[choiceCounter])
        
    }
    
    var selectedOption = 0
    @objc func nextChoice(){
        if canContinue {
            let selectedIndex = loopCycles[choiceCounter][0] + selectedOption
            switch choiceCounter{
            case 5:
                deviceCounter += 1
                yes = true
                deviceComponents.append(code[selectedIndex])
                devicePrice += price[selectedIndex]
                performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
//                navigationController?.popViewController(animated: true)
//                dismiss(animated: true, completion: nil)
                
                print(deviceCounter)
            case 0:
                yes = false
                deviceComponents.removeAll()
                deviceComponents.append(code[selectedIndex])
                devicePrice += price[selectedIndex]
                if selectedOption == 1{
                    choiceCounter = 2
                }
                else {
                    choiceCounter += 1
                }
                self.tableView.reloadData()
                navigationItem.title = ("Choose Your " + categories[choiceCounter])
                canContinue = false
            //phone
            case 1:
                //go to SIM
                deviceComponents.append(code[selectedIndex])
                devicePrice += price[selectedIndex]
                choiceCounter = 3
                self.tableView.reloadData()
                navigationItem.title = ("Choose Your " + categories[choiceCounter])
                canContinue = false
            //tablet
            case 2:
                //skip SIM
                deviceComponents.append(code[selectedIndex])
                devicePrice += price[selectedIndex]
                choiceCounter = 4
                self.tableView.reloadData()
                navigationItem.title = ("Choose Your " + categories[choiceCounter])
                canContinue = false
            default:
                deviceComponents.append(code[selectedIndex])
                devicePrice += price[selectedIndex]
                choiceCounter += 1
                self.tableView.reloadData()
                navigationItem.title = ("Choose Your " + categories[choiceCounter])
                canContinue = false
            }
            
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellAmount[choiceCounter]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as! ChoiceCell
        cell.updateCell(index: choiceCounter, indexPath: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            selectedOption = indexPath.row
            canContinue = true
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! Order
        vc.price = devicePrice
        vc.components += deviceComponents
        vc.counter += deviceCounter
        vc.canAdd = yes
    }
}
