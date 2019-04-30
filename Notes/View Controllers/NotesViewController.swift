//
//  NotesViewController.swift
//  Notes
//
//  Created by Michael Stoffer on 4/29/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    let notesController = NoteController()
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.notesTableView.delegate = self
        self.notesTableView.dataSource = self
    }
    
    @IBAction func saveNoteButtonTapped(_ sender: Any) {
        guard let text = self.noteTextView.text else { return }
        
        notesController.createNote(withText: text)
        self.noteTextView.text = nil
        self.notesTableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            guard let cell = sender as? NoteTableViewCell,
                let detailVC = segue.destination as? NoteDetailViewController else { return }
            
            detailVC.note = cell.note
        }
    }
}

extension NotesViewController: UITableViewDelegate {
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notesController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        
        return cell
    }
}

extension NotesViewController: NoteTableViewCellDelegate {
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
}
