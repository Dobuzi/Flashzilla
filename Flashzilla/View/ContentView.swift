//
//  ContentView.swift
//  Flashzilla
//
//  Created by 김종원 on 2020/11/10.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale: CGFloat = 1
    
    var body: some View {
        HStack {
            Text("Success")
        }
        .padding()
        .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .scaleEffect(scale)
        .onTapGesture(count: 1, perform: {
            withOptionalAnimation {
                self.scale *= 1.5
            }
        })
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
