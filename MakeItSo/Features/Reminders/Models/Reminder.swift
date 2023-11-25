//
//  Reminder.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 19/07/23.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

extension Reminder {
    static let samples: [Reminder] = [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "PROFIT!")
    ]
}