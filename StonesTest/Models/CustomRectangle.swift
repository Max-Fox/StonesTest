//
//  CustomRectangle.swift
//  StonesTest
//
//  Created by Максим Лисица on 02.02.2021.
//

import SwiftUI

struct CustomRectangle: Identifiable, Equatable {
    let id = UUID()
    var coordinate: CGRect
    let color: Color = .random
}
