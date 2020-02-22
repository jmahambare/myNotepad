//
//  ViewController.swift
//  myNotepad
//
//  Created by jitendra mahambare on 20/02/20.
//  Copyright © 2020 Jitendra Mahambare. All rights reserved.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        saveNote()
    }
    
    //Data manipulation methods
    
    func saveNote() {
        
        let newNote = Notes(context: context.self)
        
        if let noteText = textView.text {
            
            newNote.noteDetail = noteText
            
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
        }
        
    }

}

