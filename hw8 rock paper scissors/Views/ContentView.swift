//
//  ContentView.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 16.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StartPageView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getPickImage(pick: Gestures) -> String {
    var pickImage = ""
    switch pick {
    case .rock:
        pickImage = "🗿"
    case .paper:
        pickImage = "🧻"
    case .scissors:
        pickImage = "✂️"
    }
    return pickImage
}

struct CustomButton: View{
    var title: String
    var isHidden: Bool
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(height: isHidden ? 0 : 50)
                .foregroundColor(Colors.violet)
            
            Text(title)
                .foregroundColor(.white)
                .font(Font.system(size: 16, weight: .medium))
        }
    }
}

struct CustomEmojiButton: View{
    var emoji: String
    var isHidden: Bool
    var body: some View{
        ZStack{
            Capsule()
                .foregroundColor(Colors.lightPurple)
            Text(emoji)
                .font(Font.system(size: 80))
        }
        .frame(height: isHidden ? 0 : 128)
    }
}

