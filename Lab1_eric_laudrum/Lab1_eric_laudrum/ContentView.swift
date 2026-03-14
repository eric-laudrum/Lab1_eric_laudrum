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
    
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
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
        if round % 10 ==  0{
            print("Summary\n",
                  "Prime numbers identified:\n",
                  "Correct: ", correctGuesses,
                  "Incorrect: ", incorrectGuesses
            )
        }
        
    }
    
    // Handle timer
        // new numbers every 5 seconds
        // no answer = X

    
    
}

#Preview {
    ContentView()
}
