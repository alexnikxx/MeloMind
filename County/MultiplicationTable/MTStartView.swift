//
//  MTStartView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 18/04/23.
//

import SwiftUI

struct MTStartView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Multiplication Table")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("Now I want to check how confident you feel about multiplication table, my friend!")
                Text("")
                Text("You need to answer 10 questions. If you answer at least 5 questions correctly, you win. If less, then I win, deal?")
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .foregroundColor(.black)
            
            Spacer()
            
            Image("DrinkingMilo")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            VStack {
                Text("Press when you are ready!")
                NavigationLink(destination: MultiplicationTableView()) {
                    Text("START")
                        .modifier(ButtonModifier())
                }
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))

        }
        .padding()
    }
}


struct MTStartView_Previews: PreviewProvider {
    static var previews: some View {
        MTStartView()
    }
}
