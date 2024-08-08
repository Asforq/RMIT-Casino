import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.12, blue: 0.18),  // top red color
                    Color(red: 0.98, green: 0.43, blue: 0.71)   // bottom pink color
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        // Action for refresh
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    .offset(x:20,y:-15)
                    
                    Image("rmit-welcome-logo")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .offset(y:50)
                    
                    Button(action: {
                        // Action for info
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    .offset(x:-20,y:-15)
                }
                .offset(y:-20)
                
                HStack {
                    InfoView(number: 100,firstText: "Your",secondText:"Money",isNumberLeft:true,textFontSize: 10,numberFontSize: 25)
                        .padding(.trailing,80)
                    InfoView(number: 740,firstText: "High",secondText:"Score",isNumberLeft:false,textFontSize: 10,numberFontSize: 25)
                }
                .offset(y:30)
                
                VStack {
                    let spinSize = 140
                 
                    SpinView(spinWidth: spinSize, imageName: "apple")
                    
                    HStack {
                        SpinView(spinWidth: spinSize, imageName: "bar")
                            .padding(.trailing,50)
                        SpinView(spinWidth: spinSize, imageName: "bell")
                    }
                    .padding(.top,-80)
                    
                    Image("spin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth:CGFloat(spinSize),maxHeight: .infinity)
                        .padding(.top,-140)
                }
                .padding(.top,50)
                
                HStack(spacing:220) {
                    BetAmountView(amount: 20, isActive: true, size: 25)
                    BetAmountView(amount: 10, isActive: false, size: 25)
                }
                .padding(.top,-50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
