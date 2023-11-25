//
//  ReminderToggleStyle.swift
//  MakeItSo
//
//  Created by Azis Ramdhan on 25/11/23.
//

import SwiftUI

struct ReminderToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
      HStack {
          Image(systemName: configuration.isOn
                ? "largecircle.fill.circle"
                : "circle")
          .imageScale(.large)
          .foregroundColor(configuration.isOn ? .accentColor : .gray)
          .onTapGesture {
              configuration.isOn.toggle()
          }
          configuration.label
      }
  }
}

struct ToggleContainer: View {
    @State var isOn = false
    var body: some View {
        Toggle(isOn: $isOn) { Text("Hello") }
            .toggleStyle(.reminder)
    }
}

extension ToggleStyle where Self == ReminderToggleStyle {
  static var reminder: ReminderToggleStyle {
    ReminderToggleStyle()
  }
}

#Preview {
    ToggleContainer()
}
