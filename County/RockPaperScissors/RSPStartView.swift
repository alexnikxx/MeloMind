//
//  RSPStartView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 18/04/23.
//

import SwiftUI

struct RSPStartView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Rock, Scissors, Paper")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("I bet you think \"Rock, scissors, paper\" can't be complicated?")
                Text("")
                Text("But I have a little lesson for you! It's not always necessary to win in order to achieve victory.")
                Text("")
                Text("Sometimes the game will tell you that you have to lose, so you need to choose a completely different option. Are you ready?")
            }
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            
            Spacer()
            
            Image("DrinkingMilo")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            VStack {
                Text("Press when you are ready!")
                NavigationLink(destination: RockScissorsPaperView()) {
                    Text("START")
                        .modifier(ButtonModifier())
                }
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))

        }
        .padding()
    }
}

struct RSPStartView_Previews: PreviewProvider {
    static var previews: some View {
        RSPStartView()
    }
}
