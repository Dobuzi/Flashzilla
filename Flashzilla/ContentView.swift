//
//  ContentView.swift
//  Flashzilla
//
//  Created by 김종원 on 2020/11/10.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var whatever = ""
    var body: some View {
        TextField("whatever", text: $whatever)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("On the background")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                print("Back to the foreground")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                print("User took a screenshot")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                print("keyboard is shown")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
