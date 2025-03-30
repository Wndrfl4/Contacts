//
//  TableViewController.swift
//  Contacts
//
//  Created by Aslan  on 16.10.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var person:[Person] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
//        if let personArray = UserDefaults.standard.array(forKey: "personArray") as? [String]{
//            person = personArray
//            tableView.reloadData()
//        }
        do {
          if let data = UserDefaults.standard.data (forKey: "PersonArray") {
        
              let array = try JSONDecoder () .decode([Person].self, from: data)
        
              person = array
              
              tableView.reloadData()
          }
        } catch {
        print ("unable to encode \(error)")
        }
    }
    
    func save(){
        do {
            let encodedata = try JSONEncoder().encode(person)
            UserDefaults.standard.set(encodedata, forKey: "PersonArray")
        }catch{
            print ("unable to encode \(error)")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return person.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")

        // Configure the cell...
        
        cell.detailTextLabel?.text = person[indexPath.row].number
        
        cell.textLabel?.text = person[indexPath.row].name + " " + person[indexPath.row].surename
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as? PersonViewController {
            vc.personToEdit = person[indexPath.row]
            
            vc.onPersonUpdated = { [weak self] updatedPerson in
                       guard let self = self else { return }
                       
                       // Обновляем данные в массиве
                       self.person[indexPath.row] = updatedPerson
                       
                       // Сохраняем изменения
                       self.save()
                       
                       // Перезагружаем таблицу
                       self.tableView.reloadRows(at: [indexPath], with: .none)
                   }
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            person.remove(at:  indexPath.row)
            
            save()
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
