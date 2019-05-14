//
//  NoteController.swift
//  Notes
//
//  Created by Michael Stoffer on 4/29/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

class NoteController {
    
    init() {
        // Create test data
        createNote(withText: "Walk the dog!")
        createNote(withText: "Eat Lunch!")
        createNote(withText: "Swift is awesome!!")
    }
    
    private (set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
    
    func deleteNote(withNote note: Note) {
        guard let index = notes.firstIndex(of: note) else { return }
        self.notes.remove(at: index)
    }
}
