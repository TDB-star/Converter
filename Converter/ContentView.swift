//
//  ContentView.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 26/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36)
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        // Text field
                        Text("Enter amount...")
                            
                        
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {
                        HStack {
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36)
                        }
                        
                        // text field
                        Text("Enter amount...")
                    }
                }
                Spacer()
                // imfo button
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
