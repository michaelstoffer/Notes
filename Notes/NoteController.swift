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
}
