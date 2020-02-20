//
//  InitialTableViewController.swift
//  myNotepad
//
//  Created by jitendra mahambare on 20/02/20.
//  Copyright © 2020 Jitendra Mahambare. All rights reserved.
//

import UIKit
import CoreData

class InitialTableViewController: UITableViewController {

    var notes = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Add TableView Data Sources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(notes.count)
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTitleCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].noteDetail
        return cell
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToNewNoteController", sender: self)
    }
}
