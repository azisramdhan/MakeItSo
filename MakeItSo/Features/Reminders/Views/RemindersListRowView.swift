//
//  RemindersListRowView.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 25/11/23.
//

import SwiftUI


struct RemindersListRowView: View {
    @Binding
    var reminder: Reminder
    
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) { /* no label, on purpose */}
                .toggleStyle(.reminder)
            Text(reminder.title)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct Container: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
        List {
            RemindersListRowView(reminder: $reminder)
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationView {
        Container()
            .navigationTitle("Reminders")
    }
}
