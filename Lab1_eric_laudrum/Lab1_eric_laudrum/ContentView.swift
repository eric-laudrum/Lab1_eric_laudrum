//
//  ContentView.swift
//  Lab1_eric_laudrum
//
//  Created by Eric Laudrum on 3/14/26.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var number: Int = Int.random(in: 0...100)
    @State private var correctGuesses: Int = 0
    @State private var incorrectGuesses: Int = 0
    @State private var round: Int = 0
    @State private var countdownTimer: Int = 5
    @State private var answerReceived: Bool = false
    @State private var showAlert = false
    
    let timer = Timer.publish( every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Is it Prime?")
                .font(.headline)
            
            Text("\(number)")
                .font(.system(size: 50, weight: .bold))
            
            Text("Time Remaining: \(countdownTimer)")
            
            HStack(spacing: 40){
                Button("Prime") {
                    answerReceived = true
                    checkInput(userIsPrime: true)
                }
                .disabled(answerReceived)
                .font(.title)
                
                Button("Non Prime") {
                    answerReceived = true
                    checkInput(userIsPrime: false)
                }
                .disabled(answerReceived)
                .font(.title)
            }
            
            
            Button("Reset") {
                resetGame()
            }
            
            
            if answerReceived{
                let isCorrect = (checkIsPrime(number) == true)
                
                Image(systemName: checkIsPrime(number) ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(checkIsPrime(number) ? .green : .red)
                    .font(.largeTitle)
                    .opacity(answerReceived ? 1 : 0)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            handleTimer()
        }
        
        .alert("Round Summary", isPresented: $showAlert){
            Button("OK", role: .cancel){
                resetGame()
            }
        } message:{
            Text("Summary\nPrime numbers identified:\nCorrect: \(correctGuesses) Incorrect: \(incorrectGuesses)")
        }
    }
    
    
    // Check for prime number
    func checkIsPrime(_ number: Int) -> Bool{
        // Prime number must have 2 distinct positive factors
        if number <= 1{
            return false
        }
        
        // Check for factors between 1 and the number
        for i in 2..<number{
            // Handle factor that confirms it is a COMPOSITE NUMBER
            if number % i == 0{
                return false
            }
        }
            
        // If no factors are found, it is a PRIME NUMBER
        return true
    }
    
    // Handle the user's response
        // record the answer
        // result displayed with green check or red x
    func checkInput(userIsPrime: Bool){
        
        let numberIsPrime = checkIsPrime(number)
        
        if userIsPrime == numberIsPrime{
            correctGuesses += 1
        } else {
            incorrectGuesses += 1
        }
    }
    
    // Handle progress update
        // after 10 attempts, display dialogue with info on # of right and wrong answers
    func outputRoundSummary(){
        if round > 0 && round % 10 ==  0{
            print("Summary\n",
                  "Prime numbers identified:\n",
                  "Correct: ", correctGuesses,
                  "Incorrect: ", incorrectGuesses
            )
            
            showAlert = true
        }
        
    }
    
    // Handle timer
        // new numbers every 5 seconds
        // no answer = X
    func handleTimer(){
        if countdownTimer > 0{
            countdownTimer -= 1
        }
        
        else{
        
            if !answerReceived{
                incorrectGuesses += 1
            }
            
            // Set the next round
            round += 1
            countdownTimer = 5
            number = Int.random(in: 0...100)
            answerReceived = false
            
            outputRoundSummary()
            
        }
    }
    
    // Reset
    func resetGame(){
        round = 0
        correctGuesses = 0
        incorrectGuesses = 0
        number = Int.random(in: 0...100)
        countdownTimer = 5
        answerReceived = false
    }
}



#Preview {
    ContentView()
}
