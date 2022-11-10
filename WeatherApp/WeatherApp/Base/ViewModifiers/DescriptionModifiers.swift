import SwiftUI

struct DescriptionModifiers: ViewModifier {
    var size = 15
    var color = Color.white
    func body(content: Content) -> some View {
        content
            .font(
                .system(
                    size: CGFloat(size),
                    weight: .medium,
                    design: .rounded)
            )
            .foregroundColor(color)
    }
}
