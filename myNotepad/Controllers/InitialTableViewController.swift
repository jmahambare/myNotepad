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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isToolbarHidden = true
        loadNotes()
    }
    
    //MARK: - TableView Data Sources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(notes.count)
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTitleCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].noteDetail
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "DisplayViewController") as! DisplayViewController
        dvc.selectedNote = notes[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
        
    
    //MARK: - Data Manipulation methods
    
    func loadNotes() {
        
        let request: NSFetchRequest<Notes> = Notes.fetchRequest()
        
        do {
            notes = try context.fetch(request)
        } catch {
            print("Error fetching request \(error)")
        }
        
        tableView.reloadData()
    }

    
    //MARK: - Add button pressed
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToNewNoteController", sender: self)
    }
}
