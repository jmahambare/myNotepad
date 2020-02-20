//
//  InitialTableViewController.swift
//  myNotepad
//
//  Created by jitendra mahambare on 20/02/20.
//  Copyright © 2020 Jitendra Mahambare. All rights reserved.
//

import UIKit

class InitialTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToNewNoteController", sender: self)
    }
}
