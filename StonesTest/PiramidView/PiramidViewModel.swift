//
//  PiramidViewModel.swift
//  StonesTest
//
//  Created by Максим Лисица on 18.08.2021.
//



import SwiftUI

class PiramidViewModel: ObservableObject {
    @Published var stones: [CustomRectangle] = [CustomRectangle(coordinate: CGRect.zero),
                                                CustomRectangle(coordinate: CGRect.zero),
                                                CustomRectangle(coordinate: CGRect.zero)]
    var didAppendStones: Bool = false
}
