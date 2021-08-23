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
    @Published var stones: [PiramidStone] = [PiramidStone(type: .small),
                                             PiramidStone(type: .average),
                                             PiramidStone(type: .medium)
    ]
    var didAppendStones: Bool = false
    
    
    func getOffset(by stone: PiramidStone) -> CGFloat {
        guard let index = stones.firstIndex(of: stone) else {
            return 0
        }
        
        var offset: CGFloat = 0
        for item in 0 ..< index {
            offset += stones[item].type.height - stones[item].type.offset
        }
        
        return offset
    }
    
    func getHeightContainer() -> CGFloat {
        var height: CGFloat = 0
        
        for stone in stones {
            height += stone.type.height
        }
        
        return height
    }
}
