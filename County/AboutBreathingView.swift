//
//  AboutBreathingView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 19/04/23.
//

import SwiftUI

struct AboutBreathingView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Why breathing is the best rest for us?")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("Breathing is the most important process in the human body and oxygen is the main source of energy for our cells.")
                Text("")
                Text("We have busy lives, sometimes we feel happy, sometimes we can experience fear, anger, or sadness. It's normal part of our life.")
                Text("")
                Text("You are okay. Every cell in your body is receiving oxygen when you breathe (even now), and it's very happy about it.")
            }
            .foregroundColor(.black)
            .font(.system(size: 18, weight: .regular, design: .rounded))
            
            Spacer()
            
            Image("ScaredMilo")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            NavigationLink(destination: MeditationView()) {
                Text("Continue")
                    .modifier(ButtonModifier())
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}


struct AboutBreathingView_Previews: PreviewProvider {
    static var previews: some View {
        AboutBreathingView()
    }
}
