import SwiftUI

struct TitleModifiers: ViewModifier {
    var size = 40
    func body(content: Content) -> some View {
        content.font(
            .system(
                size: CGFloat(size),
                weight: .bold,
                design: .rounded
            )
        )
            .foregroundColor(.white)
    }
}
