//
//  Reminder.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 19/07/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Reminder: Identifiable, Codable {
    @DocumentID
    var id: String?
    var title: String
    var isCompleted: Bool = false
}

extension Reminder {
  static let collectionName = "reminders"
}

extension Reminder {
    static let samples: [Reminder] = [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "PROFIT!")
    ]
}
