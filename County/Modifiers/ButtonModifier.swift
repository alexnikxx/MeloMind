import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(12)
            .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.black)
                    )
    }
}
