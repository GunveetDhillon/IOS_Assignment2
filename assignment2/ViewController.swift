//
//  ViewController.swift
//  assignment2
//
//  Created by Gunveet Singh Dhillon on 2023-07-09.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var ticketTypeLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var quantity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerView.delegate = self
                pickerView.dataSource = self
    }

    func updateTotalPrice() {
            let ticketTypePrice = getPriceForTicketType()
            let totalPrice = ticketTypePrice * quantity
            totalLabel.text = "$\(totalPrice)"
        }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let numberString = sender.titleLabel?.text, let number = Int(numberString) else {
            return
        }
        
        quantity = quantity * 10 + number
        quantityLabel.text = "\(quantity)"
        updateTotalPrice()
    }
    
    @IBAction func buyBtn(_ sender: Any) {
        updateTotalPrice()
    }
      
      let ticketTypes = ["Balcony Level Ticket", "Lower Level Ticket", "Courtside"]
      let ticketPrices = [1170, 10434, 27777]
      
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return ticketTypes.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return ticketTypes[row]
      }
      
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           ticketTypeLabel.text = ticketTypes[row]
           quantity = 0 // Reset the quantity when ticket type changes
           quantityLabel.text = "0"
           updateTotalPrice()
       }
    
    func getPriceForTicketType() -> Int {
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            return ticketPrices[selectedRow]
        }
    
}

