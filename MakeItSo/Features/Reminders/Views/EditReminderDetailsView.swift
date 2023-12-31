//
//  EditReminderDetailsView.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 20/07/23.
//

import SwiftUI

struct EditReminderDetailsView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    enum Mode {
        case add
        case edit
    }
    
    var mode: Mode = .add
    
    @State
    var reminder = Reminder(title: "")
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    @Environment(\.dismiss)
    private var dismiss
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
                    .focused($focusedField, equals: .title)
                    .onSubmit {
                      commit()
                    }
            }
            .navigationTitle(mode == .add ? "New Reminder" : "Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text(mode == .add ? "Add" : "Done")
                    }
                    .disabled(reminder.title.isEmpty)
                }
            }
            .onAppear(perform: {
                focusedField = .title
            })
        }
    }
}

struct EditReminderDetailsContainer: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
        EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
            print("You edited a reminder: \(reminder.title)")
        }
    }
}

#Preview {
    EditReminderDetailsView { reminder in
        print("You added a reminder: \(reminder.title)")
    }
}

#Preview(body: {
    EditReminderDetailsContainer()
})
