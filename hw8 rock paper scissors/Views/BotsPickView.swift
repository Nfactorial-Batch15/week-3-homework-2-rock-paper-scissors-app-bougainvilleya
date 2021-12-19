//
//  BotsPickView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 19.12.2021.
//

import SwiftUI

struct BotsPickView: View{
    @Binding var roundNumber: Int
    @Binding var player1: Player
    @Binding var player2: Player
    
    @State var isLoading = true
    @State var show = false
    @State var title = "Your opponent is thinking"
    
    var body: some View{
        VStack{
            VStack(spacing: 136){
                Text(title)
                    .font(Font.system(size: 54, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                    .navigationTitle("Round #\(roundNumber)")
                    .navigationBarBackButtonHidden(true)
                
                ZStack{
                    Capsule()
                        .foregroundColor(Colors.lightPurple)
                        .frame(height: 128)
                    
                    isLoading ? Text(Image("Loading")) : Text(getPickImage(pick: player2.pick))
                        .font(Font.system(size: 80))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isLoading = false
                        title = "Your opponent's pick"
                        player2.generateGesture()
                        print(player2.pick)
                    }
                }
                
                NavigationLink(destination: ResultView(roundNumber: $roundNumber, player1: $player1, player2: $player2, isSinglePlayer: .constant(true)), isActive: $show){
                    EmptyView()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.show.toggle()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct BotsPickView_Previews: PreviewProvider {
    static var previews: some View {
        BotsPickView(roundNumber: .constant(1), player1: .constant(Player()), player2: .constant(Player()))
    }
}
