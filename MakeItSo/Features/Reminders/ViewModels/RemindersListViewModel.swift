//
//  RemindersListViewModel.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 23/09/23.
//

import Foundation

class RemindersListViewModel: ObservableObject {
    @Published
    var reminders = Reminder.samples
    
    @Published
    var errorMessage: String?
    
    private var remindersRepository: RemindersRepository =  RemindersRepository()
    
    func addReminder(_ reminder: Reminder) {
        do {
          try remindersRepository.addReminder(reminder)
          errorMessage = nil
        }
        catch {
          print(error)
          errorMessage = error.localizedDescription
        }
    }
    
    func toggleCompleted(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id} ) {
            reminders[index].isCompleted.toggle()
        }
    }
}
