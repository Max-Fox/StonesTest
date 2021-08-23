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
    case medium
    case big
    
    var width: CGFloat {
        switch self {
        case .small:
            return 110
        case .average:
            return 75
        case .medium:
            return 60
        case .big:
            return 55
        }
    }
    
    var height: CGFloat {
        switch self {
        case .small:
            return 50
        case .average:
            return 35
        case .medium:
            return 35
        case .big:
            return 55
        }
    }
    
    var imageName: String {
        switch self {
        case .small:
            return "stone1"
        case .average:
            return "stone2"
        case .medium:
            return "stone3"
        case .big:
            return "stone4"
        }
    }
    
    var offset: CGFloat {
        switch self {
        case .small:
            return 20
        case .average:
            return 5
        case .medium:
            return 5
        case .big:
            return 2
        }
    }
}
