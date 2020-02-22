//
//  DisplayViewController.swift
//  myNotepad
//
//  Created by jitendra mahambare on 20/02/20.
//  Copyright © 2020 Jitendra Mahambare. All rights reserved.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var displayTextView: UITextView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedNote: Notes?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashPressed))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [delete, spacer]
        
        navigationController?.isToolbarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        loadNote()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        saveNote()
    }
    
    //MARK: - Data Manipulaltion methods
    
    func loadNote() {
        
        displayTextView.text = selectedNote?.noteDetail
    }
    
    func saveNote() {

        if let revisedText = displayTextView.text {

            selectedNote?.setValue(revisedText, forKey: "noteDetail")
        }
        do {
            try context.save()
        } catch {
            print("Error saving data \(error)")
        }
    }

    @objc func trashPressed(_ sender: UIBarButtonItem) {
        
        displayTextView.text = ""
        context.delete(selectedNote!)
        navigationController?.popViewController(animated: true)
    }
}
