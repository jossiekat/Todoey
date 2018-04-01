//
//  ViewController.swift
//  Todoey
//
//  Created by joseph keshet on 24/03/2018.
//  Copyright © 2018 Joseph Keshet. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["a","b","c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    //MARK table view ds
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( "row selected" + String(indexPath.row))
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text as! String)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func alertText(_ alertTextField:UITextField){
        
        
    }
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        var textField:UITextField?
        let alert = UIAlertController(title: "Alert", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print ("Success")
            print(textField!.text!)
            self.itemArray.append(textField!.text!)
            self.tableView.reloadData()

            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "write to do"
            print(alertTextField.text!)
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}

