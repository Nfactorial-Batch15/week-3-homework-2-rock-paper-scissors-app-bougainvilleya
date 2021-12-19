//
//  StartPageView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 19.12.2021.
//

import SwiftUI

struct StartPageView: View{
    @State var roundNumber = 0
    @State var player1 = Player()
    @State var player2 = Player()
    @State var isSinglePlayer = true
    
    var body: some View{
        NavigationView{
            ZStack{
                Image("BackgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Text("Welcome to the game!")
                        .font(Font.system(size: 54, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
    
                    NavigationLink(destination: FirstPlayersPickView(roundNumber: $roundNumber, player1: $player1, player2: $player2, isSinglePlayer: $isSinglePlayer)){
                        CustomButton(title: "Single player", isHidden: false)
                    }

                    NavigationLink(destination: FirstPlayersPickView(roundNumber: $roundNumber, player1: $player1, player2: $player2, isSinglePlayer: $isSinglePlayer)){
                        CustomButton(title: "Multi player", isHidden: false)
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                        isSinglePlayer = false
                        print("isSinglePlayer = ", isSinglePlayer)
                    }))
                }
                .padding(.horizontal, 16)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .accentColor(Colors.violet)
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
