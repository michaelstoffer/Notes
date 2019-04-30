//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Michael Stoffer on 4/29/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    
    var note: Note? {
        didSet {
            self.updateViews()
        }
    }
    
    weak var delegate: NoteTableViewCellDelegate?
    
    private func updateViews() {
        guard let note = self.note else { return }
        self.noteLabel.text = note.text
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
}
