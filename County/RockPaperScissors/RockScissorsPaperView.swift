//
//  RockPaperScissorsView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 12/04/23.
//

import SwiftUI

struct RockScissorsPaperView: View {
    @State var hand = 0
    @State var result = false
    
    @State var score = 0
    @State var move = 0
    @State var gameEnd = false
    @State var correctAnswer = false
    
    @State var resultImage = Image("DrinkingMilo")
    @State private var showingMeditationButton = false
    
    var body: some View {
        VStack {
            VStack {
                checkResult()
                    .foregroundColor(result ? .green : .red)
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                
                checkImage()
                    .resizable()
                    .scaledToFit()
                
                Text("Choose your move:")
                
                HStack {
                    Button {
                        if hand == 1 && result == true {
                            correctAnswer = true
                        } else if hand == 2 && result == false {
                            correctAnswer = true
                        } else {
                            correctAnswer = false
                        }
                        isAnswerRight()
                        generateAnswers()
                    } label: {
                        Image("rock")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .background(.red.opacity(0.1))
                            .cornerRadius(20)
                    }
                    
                    Button {
                        if hand == 0 && result == false {
                            correctAnswer = true
                        } else if hand == 2 && result == true {
                            correctAnswer = true
                        } else {
                            correctAnswer = false
                        }
                        isAnswerRight()
                        generateAnswers()
                    } label: {
                        Image("scissors")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .background(.red.opacity(0.1))
                            .cornerRadius(20)
                    }
                    
                    Button {
                        if hand == 0 && result == true {
                            correctAnswer = true
                        } else if hand == 1 && result == false {
                            correctAnswer = true
                        } else {
                            correctAnswer = false
                        }
                        isAnswerRight()
                        generateAnswers()
                    } label: {
                        Image("paper")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .background(.red.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
                .frame(maxWidth: .infinity)
                .onAppear(perform: generateAnswers)
                
                Text("Score: \(score)")
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .foregroundColor(.black)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.black)
            )
            .alert("End of the game!", isPresented: $gameEnd) {
                Button("OK", action: restart)
            } message: {
                Text(score >= 5 ? "You beat me! Your final score is \(score) points! Now we can continue the game or go on our next journey!" : "I won! Your final score is \(score) points! Now we can continue the game or go on our next journey!")
            }
            
            Spacer()
            
            resultImage
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            VStack {
                Text("Press when you are ready!")
                NavigationLink(destination: AfterView()) {
                    Text("Continue")
                        .modifier(ButtonModifier())
                }
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .opacity(showingMeditationButton ? 1 : 0)
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
    
    func checkImage() -> Image {
        if hand == 0 {
            return Image("rock")
        } else if hand == 1 {
            return Image("scissors")
        } else {
            return Image("paper")
        }
    }
    
    func checkResult() -> Text {
        if result {
            return Text("You need to win!")
        } else {
            return Text("You need to lose!")
        }
    }
    
    func generateAnswers() {
        if move == 10 {
            gameEnd = true
            showingMeditationButton = true
        }
        
        move += 1
        hand = Int.random(in: 0...2)
        result.toggle()
    }
    
    func isAnswerRight() {
        if correctAnswer {
            score += 1
            resultImage = Image("HappyMilo")
        } else {
            score -= 1
            resultImage = Image("SadMilo")
        }
    }
    
    func restart() {
        hand = Int.random(in: 0...2)
        score = 0
        move = 0
    }
}


struct RockScissorsPaperView_Previews: PreviewProvider {
    static var previews: some View {
        RockScissorsPaperView()
    }
}
