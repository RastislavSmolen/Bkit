import SwiftUI

public struct BkitCustomButton: View {
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
        setupButton(text: text, style: style, color: color, action: action)
    }
    
    func setupButton(text: String,
                     style: ButtonStyle,
                     color: Color,
                     action: @escaping () -> Void) -> some View {
        
        switch style
        {
        case .rectangle:
            return AnyView(Button(text, action: action)
                .foregroundColor(.white)
                .frame(width: size.width,height: size.height)
                .background(color)
                .clipShape(.rect)
                .frame(width: .infinity,alignment: .center))
        case .rounded:
            return AnyView(Button(text, action: action)
                .foregroundColor(.white)
                .frame(width: size.width,height: size.height)
                .background(color)
                .clipShape(.circle)
                .frame(width: .infinity,alignment: .center))
        case .buttonRounded:
            return AnyView(Button(text, action: action)
                .foregroundColor(.white)
                .frame(width: size.width,height: size.height)
                .background(color)
                .clipShape(.buttonBorder)
                .frame(width: .infinity,alignment: .center))
        }
        
     
    }
}

struct BkitButton_Previews: PreviewProvider {
    
    static var previews: some View {
        BkitCustomButton(text: "Test",style: .buttonRounded ,color: .cyan, size: Size(width: 150, height: 100),action: {
            print("Testing action")
        })
    }
}
