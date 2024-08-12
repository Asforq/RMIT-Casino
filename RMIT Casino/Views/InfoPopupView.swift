import SwiftUI

struct InfoPopupView: View {
    @Binding var isShowing: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image("rmit-welcome-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()

                    Text("HOW TO PLAY")
                        .font(.headline)
                        .foregroundColor(.gray)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Just spin the reels to play.")
                        Text("Matching all icons to win.")
                        Text("The winning amount will be 10x of your betting amount.")
                        Text("You can reset the money and highscore by clicking on the button Reset.")
                    }
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Text("APPLICATION INFORMATION")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("App Name: RMIT Casino")
                        Text("Course: COSC2659")
                        Text("Year Published: 2022")
                        Text("Location: Saigon South Campus")
                    }
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct InfoPopupView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPopupView(isShowing: .constant(true))
            .background(Color.white) // Background to see the content better
    }
}
