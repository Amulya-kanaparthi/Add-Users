//
//  ViewController.swift
//  Add Users
//
//  Created by user235836 on 3/24/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var passOutYearField: UITextField!
    @IBOutlet weak var dateOFBirthField: UITextField!
    @IBOutlet weak var dateAndTimeField: UITextField!

    @IBOutlet var starButtons: [UIButton]!
    @IBOutlet var circleButtons: [UIButton]!
    
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
        
    }
    
    
    @IBAction func GenderPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            maleButton.setImage(UIImage(named: "checkedbox"), for: .normal)
        case 2:
            femaleButton.setImage(UIImage(named: "checkedbox"), for: .normal)
        default:
            print("something")
        }
    }

    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = .now
        datePicker.datePickerMode = .dateAndTime
        dateAndTimeField.inputView = datePicker
        dateAndTimeField.inputAccessoryView = createToolbar()

    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateAndTimeField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    @IBAction func starButtonPressed(_ sender: UIButton) {
        
        for star in starButtons{
            if star.tag <= sender.tag{
                star.setImage(UIImage(named: "filled star"), for: .normal)
            }else{
                star.setImage(UIImage(named: "star"), for: .normal)
            }
        }
        
    }
    
    @IBAction func circleButtonPressed(_ sender: UIButton) {
        
        for circle in circleButtons{
            if circle.tag <= sender.tag{
                circle.setImage(UIImage(named: "ellipse"), for: .normal)
            }else{
                circle.setImage(UIImage(named: "circle"), for: .normal)
            }
        }
    }
}
