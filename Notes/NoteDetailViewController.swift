//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Michael Stoffer on 4/30/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    
    var note: Note? {
        didSet {
            self.updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateView()
    }
    
    private func updateView() {
        guard let note = self.note, isViewLoaded else { return }
        
        noteTextView.text = note.text
    }
}
