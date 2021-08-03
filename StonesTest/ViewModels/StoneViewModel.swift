//
//  StoneViewModel.swift
//  StonesTest
//
//  Created by Максим Лисица on 02.02.2021.
//

import SwiftUI

class StoneViewModel: ObservableObject {
    @Published var isChosePlace = false
    @Published var location: CGRect = .zero
    @Published var stones: [CustomRectangle] = []
    
    private let activeCoordinate: [(Int, Int)] = [(0,0), (1,0), (2,1), (1,2), (3,0), (3,2)]
    
    func containCoordinate(coord: (Int, Int)) -> Bool {
        for active in activeCoordinate {
            if active == coord {
                return true
            }
        }
        
        return false
    }
}
