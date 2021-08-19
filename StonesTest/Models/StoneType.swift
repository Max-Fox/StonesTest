//
//  StoneType.swift
//  StonesTest
//
//  Created by Максим Лисица on 19.08.2021.
//

import UIKit

enum StoneType {
    case small
    case average
    case big
    
    var size: CGFloat {
        switch self {
        case .small:
            return 30
        case .average:
            return 30
        case .big:
            return 50
        }
    }
    
    var imageName: String {
        switch self {
        case .small:
            return "small"
        case .average:
            return "average"
        case .big:
            return "big"
        }
    }
}
