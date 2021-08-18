//
//  View.swift
//  StonesTest
//
//  Created by Максим Лисица on 18.08.2021.
//

import Foundation
import SwiftUI

extension View {
    func clearModalBackground() -> some View {
        self.modifier(ClearBackgroundViewModifier())
    }
}
