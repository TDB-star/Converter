//
//  ExchangeInfoView.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 26/11/2025.
//

import SwiftUI

struct ExchangeInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(Color.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                ExchageRate(leftImage: .goldpiece, rightImage: .goldpenny, exchageRate: "1 Gold Piece = 4 Gold Pennies")
                ExchageRate(leftImage: .goldpenny, rightImage: .silverpiece, exchageRate: "1 Gold Penny = 4 Silver Pieces")
                ExchageRate(leftImage: .silverpiece, rightImage: .silverpenny, exchageRate: "1 Silver Piece = 4 Silver Pennies")
                ExchageRate(leftImage: .silverpenny, rightImage: .copperpenny, exchageRate: "1 Silver Penny = 100 Copper Pennies")
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}


