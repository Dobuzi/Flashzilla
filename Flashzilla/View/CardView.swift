//
//  CardView.swift
//  Flashzilla
//
//  Created by 김종원 on 2020/11/11.
//

import SwiftUI

struct CardView: View {
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    let card: Card
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .opacity(2 - Double(abs(offset.width / 50)))
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset.width = gesture.translation.width / 5
                    self.offset.height = gesture.translation.height
                }
            
                .onEnded { _ in
                    if abs(self.offset.width) > 60 {
                        self.removal?()
                    } else {
                        withAnimation {
                            self.offset = .zero
                        }
                    }
                }
        )
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
