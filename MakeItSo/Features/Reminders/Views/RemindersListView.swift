//
//  RemindersListView.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 19/07/23.
//

import SwiftUI

struct RemindersListView: View {
    @StateObject
    private var viewModel = RemindersListViewModel()
    
    @State
    private var isAddReminderDialogPresented = false
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
    
    var body: some View {
        List($viewModel.reminders) { $reminder in
            RemindersListRowView(reminder: $reminder)
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: presentAddReminderView) {
                    HStack {
                        // FIXME: Bug from apple text not displayed
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            AddReminderView { reminder in
                viewModel.addReminder(reminder)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RemindersListView()
            .navigationTitle("Reminders")
    }
}
