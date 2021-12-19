//
//  FirstPlayersPickView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 19.12.2021.
//
import SwiftUI

struct FirstPlayersPickView: View {
    @Binding var roundNumber: Int
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var isSinglePlayer: Bool
    
    @State var title = "Take your pick"
    @State var isHiddenPaper = false
    @State var isHiddenRock = false
    @State var isHiddenScissors = false
    @State var isHiddenBackToPickButton = true
    @State var isHiddenContinueButton = true
    
    var body: some View{
        VStack(spacing: 0){
            VStack(spacing: 12){
                Text(title)
                    .font(Font.system(size: 54, weight: .bold))
                    .navigationTitle("Round #\(roundNumber)")
                    .padding(.top, 32)
                    .navigationBarBackButtonHidden(true)
                
                Text((isSinglePlayer ? "" : "Player 1 • ") + "Score \(player1.score):\(player2.score)")
                    .foregroundColor(Colors.violet)
            }
            .onAppear {
                roundNumber += 1
                print("FirstPlayersPickView: isSinglePlayer -> ", isSinglePlayer)
            }
            
            Spacer()
            
            VStack(spacing: 24){
                Button {
                    withAnimation(.default, {
                        isHiddenRock = true
                        isHiddenScissors = true
                        isHiddenBackToPickButton = false
                        isHiddenContinueButton = false
                        title = "Your pick"
                    })
                    player1.pick = player1.convertToGesture(choice: "paper")
                } label: {
                    CustomEmojiButton(emoji: getPickImage(pick: .paper), isHidden: isHiddenPaper)
                }
                
                Button {
                    withAnimation(.default, {
                        isHiddenPaper = true
                        isHiddenScissors = true
                        title = "Your pick"
                        isHiddenBackToPickButton = false
                        isHiddenContinueButton = false
                    })
                    player1.pick = player1.convertToGesture(choice: "rock")
                } label: {
                    CustomEmojiButton(emoji: getPickImage(pick: .rock), isHidden: isHiddenRock)
                }
                
                Button {
                    withAnimation(.default, {
                        isHiddenRock = true
                        isHiddenPaper = true
                        isHiddenBackToPickButton = false
                        isHiddenContinueButton = false
                        title = "Your pick"
                    })
                    player1.pick = player1.convertToGesture(choice: "scissors")
                    
                } label: {
                    CustomEmojiButton(emoji: getPickImage(pick: .scissors), isHidden: isHiddenScissors)
                }
            }
            
            Spacer()
            
            Button {
                withAnimation(.linear, {
                    isHiddenPaper = false
                    isHiddenScissors = false
                    isHiddenRock = false
                    
                    title = "Take your pick"
                    isHiddenBackToPickButton = true
                    isHiddenContinueButton = true
                })
            } label: {
                CustomButton(title: "I changed my mind", isHidden: isHiddenBackToPickButton)
            }
            .padding(.bottom, 10)
            
            if(isSinglePlayer){
                NavigationLink(destination: BotsPickView(roundNumber: $roundNumber, player1: $player1, player2: $player2)){
                    CustomButton(title: "Continue", isHidden: isHiddenContinueButton)
                }
            }
            else{
                NavigationLink(destination: PhonePassView(roundNumber: $roundNumber, player1: $player1, player2: $player2)){
                    CustomButton(title: "Continue", isHidden: isHiddenContinueButton)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct FirstPlayersPickView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPlayersPickView(roundNumber: .constant(1), player1: .constant(Player()), player2: .constant(Player()), isSinglePlayer: .constant(true))
    }
}
