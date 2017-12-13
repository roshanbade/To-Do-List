//
//  ViewController.swift
//  To Do List
//
//  Created by Criss Angel on 12/12/17.
//  Copyright © 2017 Criss Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cellItems = [String]()
    let userDef = UserDefaults.standard
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cellItems.count: \(cellItems.count)")
        return cellItems.count
    }
    
    @IBOutlet var table: UITableView!
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        cellItems.removeAll()
        userDef.set([], forKey: "cellContents")
        print("cellItems: \(cellItems)")
        table.reloadData()
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellItems[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            cellItems.remove(at: indexPath.row)
            table.reloadData()
            userDef.set(cellItems, forKey: "cellContents")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cellContents = UserDefaults.standard.object(forKey: "cellContents") as? [String]{
            cellItems = cellContents
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

