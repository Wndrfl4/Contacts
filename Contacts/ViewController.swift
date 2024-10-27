//
//  ViewController.swift
//  Contacts
//
//  Created by Aslan  on 16.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var surenameTF: UITextField!
    
    @IBOutlet weak var numberTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    @IBAction func changeButton(_ sender: Any) {
        let name = nameTF.text!
        
        let surename = surenameTF.text!
        
        let number = numberTF.text!
        
        var personToEdit: Person?
        
        if let person = personToEdit {
            nameTF.text = person.name
            surenameTF.text = person.surename
            numberTF.text = person.number
        }
        
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let personName = nameTextField.text!
        
        let personSurname = surnameTextField.text!
        
        let number = numberTextField.text!
        
        let newContact = Person(name: personName, surename: personSurname, number: number)
        
        do {
            if let data = UserDefaults.standard.data(forKey:"PersonArray"){
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array.append(newContact)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
                
            } else {
                
                let encodedata = try JSONEncoder().encode([newContact])
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
            }
        
        } catch {
            print("unable to encode \(error)")
        }
//        if let personArray = UserDefaults.standard.array(forKey: "personArray") as? [String]{
//            var array = personArray
//
//            array.append(personName)
//            array.append(personSurname)
//            array.append(number)
//            UserDefaults.standard.setValue(array, forKey: "personArray")
//        }else{
//            UserDefaults.standard.setValue([personName, personSurname, number], forKey: "personArray")
//        }
        
    }
        
}
