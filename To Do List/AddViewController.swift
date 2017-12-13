//
//  AddViewController.swift
//  To Do List
//
//  Created by Criss Angel on 12/13/17.
//  Copyright © 2017 Criss Angel. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var newItem: UITextField!
    var cellContent = [String]()
    var userDef = UserDefaults.standard
    @IBAction func addNewItem(_ sender: UIButton) {
        
        if let cellContents = userDef.object(forKey: "cellContents") as? [String]{
            cellContent = cellContents
            cellContent.append(newItem.text!)
            userDef.set(cellContent, forKey: "cellContents")
            print(cellContent)
            newItem.text = ""
        } else {
            cellContent.append(newItem.text!)
            userDef.set(cellContent, forKey: "cellContents")
            newItem.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
