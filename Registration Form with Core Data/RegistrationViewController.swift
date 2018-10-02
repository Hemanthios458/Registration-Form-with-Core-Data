//
//  RegistrationViewController.swift
//  Registration Form with Core Data
//
//  Created by Admin on 09/07/1940 Saka.
//  Copyright © 1940 Kapil. All rights reserved.
//

import UIKit

protocol dataParsingDelegate {
    func dataPasingToVC(data : NSDictionary)
}
class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var pincode: UITextField!
    
    var array = [String : String] ()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate : dataParsingDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func clearTextfieldData() {
        first.text = ""
        second.text = ""
        email.text = ""
        password.text = ""
        city.text = ""
        state.text = ""
        pincode.text = ""
    }
    
    func savingTextfieldData() {
        let register = Details (context: context)
        register.firstName = first.text!
        register.lastName = second.text!
        register.email = email.text!
        register.password = password.text!
        register.city = city.text!
        register.state = state.text!
        register.pincode = pincode.text!
        array = ["firstName" : register.firstName,"lastName": register.lastName,"email":register.email,"password":register.password,"city":register.city,"state":register.state,"pincode":register.pincode] as! [String : String]
        
        save()
    }
    func save() {
        do {
            try context.save()
        } catch  {
            print("Error saving context\(error)")
        }
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        savingTextfieldData()
        delegate?.dataPasingToVC(data: array as NSDictionary)
        clearTextfieldData()
    }
    

}
