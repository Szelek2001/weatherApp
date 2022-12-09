import SwiftUI

struct Crosshair: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.5)
                .frame(width: 32, height: 2)
            Rectangle()
                .fill(Color.black)
                .opacity(0.5)
                .frame(width: 2, height: 32)
        }
    }}

struct Crosshair_Previews: PreviewProvider {
    static var previews: some View {
        Crosshair()
    }
}
