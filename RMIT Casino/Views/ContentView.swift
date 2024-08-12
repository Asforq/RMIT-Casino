import SwiftUI

struct ContentView: View {
    @State private var spinImages: [String] = randomizeImages()
    @State private var user = User(money:100,highScore: 0, betAmount: 10)
    @State private var bet10 = true
    @State private var bet20 = false
    @State private var isInfoPopupVisible = false
    
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
                        user.money = 100
                        user.highScore = 0
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
                        withAnimation {
                            isInfoPopupVisible.toggle()
                        }
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
                    InfoView(number: user.money, firstText: "Your", secondText: "Money", isNumberLeft: true, textFontSize: 10, numberFontSize: 25)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)

                    InfoView(number: user.highScore, firstText: "High", secondText: "Score", isNumberLeft: false, textFontSize: 10, numberFontSize: 25)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 20)
                }
                .offset(y: 30)
                
                VStack {
                    let spinSize = 140
                 
                    SpinView(spinWidth: spinSize, imageName: spinImages[0])
                    
                    HStack {
                        SpinView(spinWidth: spinSize, imageName: spinImages[1])
                            .padding(.trailing,50)
                        SpinView(spinWidth: spinSize, imageName: spinImages[2])
                    }
                    .padding(.top,-80)
                    
                    Button(action: {
                        // Action to spin
                        self.spinImages = randomizeImages()
                        checkWinCon(spinImages: spinImages, user: &user)
                    }) {
                        Image("spin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: CGFloat(spinSize), maxHeight: .infinity)
                            .padding(.top, -140)
                    }
                }
                .padding(.top,50)
                
                HStack(spacing:220) {
                    Button(action: {
                        if self.bet20 == false {
                            self.bet10 = true
                            self.bet20 = false
                            user.betAmount = 20
                        } else {
                            user.betAmount = 20
                        }
                    }) {
                        BetAmountView(amount: 20, isActive: self.bet20, size: 25)
                    }
                    Button(action: {
                        if self.bet10 == false {
                            self.bet10 = true
                            self.bet20 = false
                            user.betAmount = 10
                        } else {
                            user.betAmount = 10
                        }
                    }){
                        BetAmountView(amount: 10, isActive: self.bet10, size: 25)
                    }
                    
                }
                .padding(.top,-50)
                
                
            }
            if isInfoPopupVisible {
                InfoPopupView(isShowing: $isInfoPopupVisible)
                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
