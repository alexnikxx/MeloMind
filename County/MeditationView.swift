//
//  MeditationView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 19/04/23.
//

import SwiftUI

struct MeditationView: View {
    @Namespace var animation
    
    @State var showBreatheView: Bool = false
    @State var startAnimation: Bool = false
    
    @State var timerCount: CGFloat = 0
    @State var breatheAction: String = "Breathe In"
    @State var count: Int = 0
    @State var breathCycles = 0
    
    @State var affirmations: [String] = ["You are strong", "You are smart", "You are beautiful", "You are unique", "You are special", "You are kind", "I believe in you", "You are capable of amazing things", "I am proud of you", "You've got this!", "You have a great imagination", "You are talented", "You are loved"]
    @State var affirmation = "You are my best playmate!"
    
    var body: some View {
        VStack {
            if showBreatheView {
                VStack {
                    Text("\(breatheAction)")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                    Text(affirmation)
                        .padding()
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                }
                .foregroundColor(.black)
                .frame(maxHeight: .infinity, alignment: .top)
                .animation(.easeInOut(duration: 1), value: breatheAction)
                .animation(.easeInOut(duration: 1), value: showBreatheView)
                .onReceive(Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()) { _ in
                    if showBreatheView {
                        if timerCount >= 3.2 {
                            timerCount = 0
                            breatheAction = (breatheAction == "Breathe Out" ? "Breathe In" : "Breathe Out")
                            
                            if breathCycles % 2 == 1 {
                                let randomAffirmation = affirmations.randomElement() ?? "You are loved"
                                affirmation = randomAffirmation
                            }
                            
                            withAnimation(.easeInOut(duration: 3).delay(0.1)) {
                                startAnimation.toggle()
                            }
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            
                            breathCycles += 1
                            
                        } else {
                            timerCount += 0.01
                        }
                        
                        count = 3 - Int(timerCount)
                    } else {
                        timerCount = 0
                    }
                }
            } else {
                VStack {
                    Text("Breathing")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                    Text("")
                    Text("Let's try it together! All you need to do is breathe in and out with me and try to focus on your breathing. It can be difficult for the first time, so don't worry, we will try just 3 times!")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    
                }
                .foregroundColor(.black)
            }
            
            GeometryReader { proxy in
                var size = proxy.size
                
                BreatheView(size: size)
                    .frame(width: size.width, height: size.height, alignment: .center)
            }
            
            Text("Press when you are ready!")
                .opacity(breathCycles > 5 || showBreatheView == false ? 1 : 0)
                .font(.system(size: 20, weight: .regular, design: .rounded))
            
            if showBreatheView == false {
                Button(action: startBreathing) {
                    Text("START")
                        .modifier(ButtonModifier())
                        .opacity(showBreatheView ? 0 : 1)
                }
            } else {
                NavigationLink(destination: FinishView()) {
                    Text("Finish breathing")
                        .modifier(ButtonModifier())
                        .opacity(breathCycles > 5 ? 1 : 0)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    func BreatheView(size: CGSize) -> some View {
        ZStack {
            ForEach(1...6, id: \.self) { index in
                Circle()
                    .fill(.green.opacity(0.5))
                    .frame(width: 150, height: 150)
                    .offset(x: startAnimation ? 0 : 75)
                    .rotationEffect(.init(degrees: Double(index) * 60))
                    .rotationEffect(.init(degrees: startAnimation ? -60 : 0))
            }
        }
        .scaleEffect(startAnimation ? 0.8 : 1)
        .overlay(content: {
            Text("\(count == 0 ? 1 : count)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .animation(.easeInOut, value: count)
                .opacity(showBreatheView ? 1 : 0)
        })
        .frame(height: (size.width) + 150)
    }
    
    func startBreathing() {
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            showBreatheView.toggle()
        }
        
        if showBreatheView {
            withAnimation(.easeInOut(duration: 3).delay(0.05)) {
                startAnimation = true
            }
        } else {
            withAnimation(.easeInOut(duration: 1.5)) {
                startAnimation = false
            }
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
