//
//  ContentView.swift
//  21
//
//  Created by GayaneA on 10/15/19.
//  Copyright © 2019 GayaneA. All rights reserved.
//

import SwiftUI

/*
struct rotatefadeout : ViewModifier{
    var num: Int
    var correctAnswer : Int
  
    func body(content: Content) -> some View {
        if num == correctAnswer{
            return (content.rotation3DEffect(.degrees(360), axis: (x: 0, y: 1, z: 0))).animation(.default)
        }
        else{
           return (content.rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))).animation(.default)
        }
    }
}*/


struct ContentView: View {
    
    @State var countries = ["uk", "us", "russia", "estonia", "france", "germany", "ireland", "italy", "nigeria", "poland",  "spain"]//.shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var showalert = false
    @State var message = ""
    @State var guess = 0
    @State var score = 0
    @State var correct: Double = 0
    @State var opasity = 1.0
    @State var myanimation : Animation? = .default
    
    
    
    var body: some View {
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of: ") +
                        Text(countries[correctAnswer].uppercased()).foregroundColor(.red)
                    
                }
                
//0
                Button(action: {
                    self.guess =  0
                    self.myanimation = .default
                    self.opasity = 0.25
                    
                    if self.correctAnswer == 0{
                        self.message = "Correct"
                        self.score += 1
                        self.correct = 360
                    }
                    else{
                        self.message = "Wrong"
                        self.score -= 1
                    }
                    
                    self.showalert = true
                })
                {
                    Image(self.countries[0])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                }
                .rotation3DEffect(.degrees(correctAnswer == 0 ? correct : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(correctAnswer == 0 ? 1 : opasity)
                .animation(myanimation)
                
                
                
//1
                Button(action: {
                    self.guess =  1
                    self.opasity = 0.25
                    self.myanimation = .default
                    
                    if self.correctAnswer == 1{
                        self.message = "Correct"
                        self.score += 1
                        self.correct = 360
                        
                    }
                    else{
                        self.message = "Wrong"
                        self.score -= 1
                    }
                    self.showalert = true
                })
                {
                    Image(self.countries[1])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                }
                .rotation3DEffect(.degrees(correctAnswer == 1 ? correct : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(correctAnswer == 1 ? 1 : opasity)
                .animation(myanimation)
                
                
                
//2
                Button(action: {
                    self.guess =  2
                    self.opasity = 0.25
                    
                    self.myanimation = .default
                    
                    if self.correctAnswer == 2{
                        self.message = "Correct"
                        self.score += 1
                        self.correct = 360
                    }
                    else{
                        self.message = "Wrong"
                        self.score -= 1
                        
                    }
                    self.showalert = true
                })
                {
                    Image(self.countries[2])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                    
                }
                .rotation3DEffect(.degrees(correctAnswer == 2 ? correct : 0), axis: (x: 0, y: 1, z: 0))
                 
                    .opacity(correctAnswer == 2 ? 1 : opasity)
                    
                    .animation(myanimation)
                
  //commented out to add animation to each button separate
            /*
                ForEach(0..<3){   number in
                    
                    Button(action: {//
                        
                        self.guess =  number
                        
                        if number == self.correctAnswer {
                            self.message = "Correct"
                            self.score += 1
                            self.correct = 360
                        }
                        else{
                            self.message = "Wrong"
                            self.score -= 1
                        }
                        
                        self.showalert = true
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                    }
                    
                }
 */
                
                Spacer().frame(height: 15)
                
                Text("Score: \(score)").foregroundColor(.white).fontWeight(.heavy).font(.largeTitle)
                
                Spacer()
            }
                
            .alert(isPresented: self.$showalert) { () -> Alert in
                Alert(title: Text("This is the flag of \(self.countries[self.guess].uppercased())"), message: Text("\(self.message), Score: \(score)"), dismissButton: .default(Text("Continue")){self.askQuestion()})
            }
            
        }
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        myanimation = nil
        correct = 0
        opasity = 1
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
