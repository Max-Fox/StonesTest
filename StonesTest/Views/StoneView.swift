//
//  StoneView.swift
//  StonesTest
//
//  Created by Максим Лисица on 18.08.2021.
//

import SwiftUI

struct StoneView: View {
    let stone: PiramidStone
    let index: Int
    let offset: CGFloat
    
    var body: some View {
        Rectangle()
            .border(Color.black, width: 1)
            .frame(width: 150, height: stone.type.size)
            .offset(y: -offset)
            .foregroundColor(stone.color)
    }
}

struct StoneView_Previews: PreviewProvider {
    static var previews: some View {
        StoneView(stone: PiramidStone(type: .small), index: 1, offset: 100)
    }
}
