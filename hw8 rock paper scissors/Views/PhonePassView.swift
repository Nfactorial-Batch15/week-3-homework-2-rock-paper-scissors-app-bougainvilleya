//
//  PhonePassView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 19.12.2021.
//

import SwiftUI

struct PhonePassView: View {
    @Binding var roundNumber: Int
    @Binding var player1: Player
    @Binding var player2: Player
    
    var body: some View {
        VStack{
            VStack(spacing: 136){
                Text("Pass the phone to your opponent")
                    .font(Font.system(size: 54, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                    .navigationTitle("Round #\(roundNumber)")
                    .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                NavigationLink(destination: SecondPlayersPickView(roundNumber: $roundNumber, player1: $player1, player2: $player2)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 50)
                            .foregroundColor(Colors.violet)
                        
                        Text("Ready to continue")
                            .foregroundColor(.white)
                            .font(Font.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        
    }
}

struct PhonePassView_Previews: PreviewProvider {
    static var previews: some View {
        PhonePassView(roundNumber: .constant(1), player1: .constant(Player()), player2: .constant(Player()))
    }
}
