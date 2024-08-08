import SwiftUI

struct InfoView: View {
    var number: Int
    var firstText: String
    var secondText: String
    var isNumberLeft = false
    var textFontSize: Int
    var numberFontSize: Int
    
    var body: some View {
        HStack {
            
            if !isNumberLeft {
                Text("\(number)")
                    .font(.system(size: CGFloat(numberFontSize)))
                    .foregroundStyle(Color.white)
                
                VStack(alignment:.leading) {
                    Text("\(firstText)")
                    Text("\(secondText)")
                }
                .textCase(.uppercase)
                .font(.system(size: CGFloat(textFontSize)))
                .foregroundStyle(Color.white)
            } else {
                VStack(alignment:.trailing) {
                    Text("\(firstText)")
                    Text("\(secondText)")
                }
                .textCase(.uppercase)
                .font(.system(size: CGFloat(textFontSize)))
                .foregroundStyle(Color.white)
                
                Text("\(number)")
                    .font(.system(size: CGFloat(numberFontSize)))
                    .foregroundStyle(Color.white)
            }
        }
        .bold()
        .padding(.vertical,7)
        .padding(.horizontal,15)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color("ColorLightBlack"))
        )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(number: 300,firstText: "High",secondText:"Score",isNumberLeft:false,textFontSize: 20,numberFontSize: 40)
    }
}
