import Foundation
import SwiftUI

enum Factor {
    case wind
    case temp
    var image: Image {
        switch self {
        case .wind:
            return Image(systemName: "wind")
        case .temp:
            return Symbols.map
        }
    }
    var des: String {
        switch self {
        case .wind:
            return "no wieje"
        case .temp:
            return "chlopd"
        }
    }
}
