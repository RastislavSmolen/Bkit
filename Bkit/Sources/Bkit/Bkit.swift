import SwiftUI

public struct BkitButton: View {
    let text: String
    let style: ButtonStyle
    let color: Color
    let size: Size

    let action: () -> Void
    
   public init(text: String, style: ButtonStyle, color: Color, size: Size, action: @escaping () -> Void) {
        self.text = text
        self.style = style
        self.color = color
        self.size = size
        self.action = action
    }
    
    public var body: some View {
        switch style {
        case .rounded:
            Button(text, action: action)
            .foregroundColor(.white)
            .frame(width: size.width,height: size.height)
            .background(color)
            .clipShape(.buttonBorder)
        case .rectangle:
            Button(text, action: action)
            .foregroundColor(.white)
            .frame(width: size.width,height: size.height)
            .background(color)
            .clipShape(.buttonBorder)
        }
       
    }
}

struct BkitButton_Previews: PreviewProvider {
    
    static var previews: some View {
        BkitButton(text: "Test",style: .rectangle ,color: .cyan, size: Size(width: 150, height: 100), action: {
            print("Testing action")
        })
    }
}

public struct Size {
    let width: CGFloat
    let height: CGFloat
    
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
}

public enum ButtonStyle {
    case rounded
    case rectangle
}

