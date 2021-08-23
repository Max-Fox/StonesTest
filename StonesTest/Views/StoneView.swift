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
        Image(stone.type.imageName)
            .resizable()
            .frame(width: stone.type.width, height: stone.type.height)
            .offset(x: stone.type == .small ? -7 : 0, y: -offset)
    }
}

struct StoneView_Previews: PreviewProvider {
    static var previews: some View {
        StoneView(stone: PiramidStone(type: .small), index: 1, offset: 100)
    }
}
