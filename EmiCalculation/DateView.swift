//
//  DateView.swift
//  EmiCalculation
//
//  Created by PCQ184 on 23/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import UIKit

class DateView: UIView {
    @IBOutlet weak var dateFormatTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  dateFormat.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateFormat[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  let dateviewer = Bundle.main.loadNibNamed("Date", owner: self, options: nil)?.first as?
            DateView {
            self.view.addSubview(dateviewer)
            dateviewer.dateFormatTextField.text = dateFormat[row]
        }
        
    }
}
