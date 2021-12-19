//
//  ResultView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 19.12.2021.
//

import SwiftUI

struct ResultView: View{
    @Binding var roundNumber: Int
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var isSinglePlayer: Bool
    
    @State var title = ""
    @State var colorsSet = [Color.yellow, Color.red]
    
    var body: some View {
        VStack(spacing: 12) {
            LinearGradient(gradient: Gradient(colors: colorsSet),
                           startPoint: .leading,
                           endPoint: .trailing)
                .mask(
                    Text(title)
                        .font(Font.system(size: 54, weight: .bold))
                        .onAppear {
                            title = Player.play(player1: player1, player2: player2)
                        }
                )
                .frame(height: 62)
                .padding(.top, 32)
                .navigationTitle("Round #\(roundNumber)")
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    switch title{
                    case "Win!":
                        colorsSet = [.yellow, . green]
                    case "Lose":
                        colorsSet = [.pink, .red]
                    case "Tie!":
                        colorsSet = [Color.yellow, Color.red]
                    default:
                        print("Error in ResultView -> switch")
                    }
                    print("ResultView: isSinglePlayer -> ", isSinglePlayer)
                }
            
            Text("Score \(player1.score):\(player2.score)")
                .foregroundColor(Colors.violet)
                .padding(.bottom, 122)
            
            ZStack{
                ZStack{
                    Capsule()
                        .foregroundColor(Colors.lightPurple)
                        .frame(width: 190, height: 128)
                    
                    Text(getPickImage(pick: player1.pick))
                        .font(Font.system(size: 80))
                }
                .padding(.trailing, 152)
                
                ZStack{
                    Capsule()
                        .stroke(.white, lineWidth: 10)
                        .background(Capsule().fill(Colors.lightPurple))
                        .frame(width: 190, height: 128)
                    
                    Text(getPickImage(pick: player2.pick))
                        .font(Font.system(size: 80))
                }
                .padding(.top, 80)
                .padding(.leading, 160)
            }
            
            Spacer()
            
            NavigationLink(destination: FirstPlayersPickView(roundNumber: $roundNumber, player1: $player1, player2: $player2, isSinglePlayer: $isSinglePlayer)){
                ZStack{
                    CustomButton(title: "Another round", isHidden: false)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(roundNumber: .constant(1), player1: .constant(Player()), player2: .constant(Player()), isSinglePlayer: .constant(true))
    }
}
