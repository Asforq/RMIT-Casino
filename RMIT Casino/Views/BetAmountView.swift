import SwiftUI

struct BetAmountView: View {
    var amount:Int
    var isActive:Bool
    var size: Int
    
    
    var body: some View {
        ZStack {
            Text("\(amount)")
                .foregroundStyle(isActive ? .black : .white)
                .bold()
                .font(.system(size: CGFloat(size)))
        }
        .bold()
        .padding(.vertical,7)
        .padding(.horizontal,20)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [
                        Color("ColorRed"),
                        Color("ColorOrange"),
                        Color("ColorYellow")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
        )
    }
}

struct BetAmountView_Previews: PreviewProvider {
    static var previews: some View {
        BetAmountView(amount:10,isActive: true,size: 30)
    }
}
