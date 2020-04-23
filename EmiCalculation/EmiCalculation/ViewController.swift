//
//  ViewController.swift
//  EmiCalculation
//
//  Created by PCQ184 on 23/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dateFormat = ["DD/MM/YYYY","DD-MM-YYYY","YY-MM-DD","DD-MMM-YYYY"]
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var rateOfInterestTextField: UITextField!
    
    @IBOutlet weak var noofInstallmentsTextField: UITextField!
    @IBOutlet weak var paymentPeriodTextField: UITextField!
    
    @IBOutlet weak var timePeriodButton: UIButton!
     @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        loanAmountTextField.delegate = self
        //        rateOfInterestTextField.delegate = self
        //        noofInstallmentsTextField.delegate = self
        //        paymentPeriodTextField.delegate = self
        //
    }
    func alert(message:String) {
        let alert = UIAlertController(title: "Error Box", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func didTapOnSubmit(_ sender: Any) {
        let time = Int(noofInstallmentsTextField.text ?? "0")
        let duration = Int(paymentPeriodTextField.text ?? "6")
        if(loanAmountTextField.text?.count == 0 || loanAmountTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true) {
            self.alert(message: "Please Enter The Loan Value")
        }
        else if(rateOfInterestTextField.text?.count == 0 || rateOfInterestTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true) {
            self.alert(message: "Please Enter The Rate of Interest")
        }
        else if(noofInstallmentsTextField.text?.count == 0 || noofInstallmentsTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true) {
            self.alert(message: "Please Enter The  no of Installment")
        }
        else if (duration! < 6 || (time! - duration!) < 1 ) {
            self.alert(message: "Please Enter  value  of payment greater than six and the difference between installment period and payment period should be greater than 1")
        }
        else {
            timePeriodButton.isEnabled = true
        }
    }
    
    @IBAction func didTapOnClear(_ sender: Any) {
        loanAmountTextField.text = ""
        rateOfInterestTextField.text = ""
        noofInstallmentsTextField.text = ""
    }
    
    @IBAction func didTapOnTimePeriod(_ sender: Any) {
        self.xibcontent()
    }
    func xibcontent() {
        if  let dateviewer = Bundle.main.loadNibNamed("Date", owner: self, options: nil)?.first as?
            DateView {
            self.view.addSubview(dateviewer)
            dateviewer.dateFormatTextField.inputView = pickerView
            let dateformatter = DateFormatter()
//            dateformatter.dateFormat = dateviewer.dateFormatTextField.text
            datePicker.datePickerMode = .date
            var components = DateComponents()
            components.month = 0
            let minDate = Calendar.current.date(byAdding: components, to: Date())
            datePicker.minimumDate = minDate
            dateviewer.startDateTextField.inputView = datePicker
            dateviewer.startDateTextField.text = dateformatter.string(from: datePicker.date)
            
        }
        
    }
}






//extension ViewController:UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if (loanAmountTextField.text?.count != 0) {
//            self.rateOfInterestTextField.becomeFirstResponder()
//        }
//        else if (rateOfInterestTextField.text?.count != 0) {
//            self.noofInstallmentsTextField.becomeFirstResponder()
//        }
//        else if (noofInstallmentsTextField.text?.count != 0) {
//            self.paymentPeriodTextField.becomeFirstResponder()
//        }
//        else {
//            view.endEditing(true)
//        }
//        return true
//    }
//
//}
//

