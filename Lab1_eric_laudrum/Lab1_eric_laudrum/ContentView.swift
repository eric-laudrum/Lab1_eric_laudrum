//
//  ContentView.swift
//  Lab1_eric_laudrum
//
//  Created by Eric Laudrum on 3/14/26.
//

import SwiftUI

struct ContentView: View {
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
        
    
    // Handle progress update
        // after 10 attempts, display dialogue with info on # of right and wrong answers
    
    
    // Handle timer
        // new numbers every 5 seconds
        // no answer = X
    
    
}

#Preview {
    ContentView()
}
