//
//  Card.swift
//  Flashzilla
//
//  Created by 김종원 on 2020/11/11.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who is my daughter?", answer: "Kim Do-A")
    }
}
