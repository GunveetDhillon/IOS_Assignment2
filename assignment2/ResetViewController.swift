//
//  ResetViewController.swift
//  assignment2
//
//  Created by Gunveet Singh Dhillon on 2023-07-09.
//

import UIKit

class ResetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    let ticketTypes = ["Balcony Level Ticket", "Lower Level Ticket", "Courtside"]
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return ticketTypes.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return ticketTypes[row]
    }
}
