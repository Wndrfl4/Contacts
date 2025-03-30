//
//  PersonViewController.swift
//  Contacts
//
//  Created by Aslan  on 09.12.2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    var personToEdit: Person?
    var onPersonUpdated: ((Person) -> Void)?
    
    @IBOutlet weak var nameLabl: UITextField!
    
    @IBOutlet weak var surenameLabl: UITextField!
    
    @IBOutlet weak var numberLabl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabl.text = personToEdit?.name
        surenameLabl.text = personToEdit?.surename
        numberLabl.text = personToEdit?.number
    }
    
    @IBAction func Change(_ sender: Any) {
        guard
                   let updatedName = nameLabl.text, !updatedName.isEmpty,
                   let updatedSurename = surenameLabl.text, !updatedSurename.isEmpty,
                   let updatedNumber = numberLabl.text, !updatedNumber.isEmpty
               else {
                   // Показываем ошибку, если есть пустые поля
                   let alert = UIAlertController(title: "Ошибка", message: "Все поля должны быть заполнены", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Ок", style: .default))
                   present(alert, animated: true)
                   return
               }

               // Обновляем объект
               if let person = personToEdit {
                   personToEdit?.name = updatedName
                   personToEdit?.surename = updatedSurename
                   personToEdit?.number = updatedNumber
                   
                   onPersonUpdated?(person)
                   
               }
               
               // Возвращаемся на предыдущий экран
               navigationController?.popViewController(animated: true)
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
