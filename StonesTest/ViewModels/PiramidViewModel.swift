//
//  PiramidViewModel.swift
//  StonesTest
//
//  Created by Максим Лисица on 18.08.2021.
//



import SwiftUI

struct PiramidStone: Identifiable, Equatable {
    let id = UUID()
    var type: StoneType = .small
    let color: Color = .random
}

class PiramidViewModel: ObservableObject {
    @Published var stones: [PiramidStone] = [PiramidStone(type: .big),
                                             PiramidStone(type: .small),
                                             PiramidStone(type: .small)
    ]
    var didAppendStones: Bool = false
    
    
    func getOffset(by stone: PiramidStone) -> CGFloat {
        guard let index = stones.firstIndex(of: stone) else {
            return 0
        }
        
        var offset: CGFloat = 0
        for item in 0 ..< index {
            offset += stones[item].type.size
        }
        
        return offset
    }
    
    func getHeightContainer() -> CGFloat {
        var height: CGFloat = 0
        
        for stone in stones {
            height += stone.type.size
        }
        
        return height
    }
}
