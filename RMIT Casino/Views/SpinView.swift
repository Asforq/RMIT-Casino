import SwiftUI

struct SpinView: View {
    var spinWidth: Int
    var imageName: String
    
    var body: some View {
        ZStack {
            Image("reel")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: CGFloat(spinWidth), maxHeight: .infinity)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: CGFloat((spinWidth*8)/13), maxHeight: .infinity)
        }
    }
}

struct SpinView_Previews: PreviewProvider {
    static var previews: some View {
        SpinView(spinWidth: 230, imageName: "apple")
    }
}
