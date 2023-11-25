//
//  AddReminderView.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 20/07/23.
//

import SwiftUI

struct AddReminderView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    @State
    private var reminder = Reminder(title: "")
    
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
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text("Add")
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

#Preview {
    AddReminderView(onCommit: { reminder in
        print("You added a new reminder titled \(reminder.title)")
    })
}
