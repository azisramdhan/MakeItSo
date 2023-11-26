//
//  RemindersRepository.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 26/11/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public class RemindersRepository: ObservableObject {
    @Published
    var reminders = [Reminder]()
    
    func addReminder(_ reminder: Reminder) throws {
        try Firestore
          .firestore()
          .collection("reminders")
          .addDocument(from: reminder)
    }
}
