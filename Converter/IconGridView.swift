//
//  IconGridView.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 30/11/2025.
//

import SwiftUI

struct IconGridView: View {

    @Binding var selectedCurrency: Currency
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIconView(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black,radius: 10)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .opacity(0.5)
                        })
                } else {
                    CurrencyIconView(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCurrency: Currency = .copperPenny
    
    IconGridView(selectedCurrency: $selectedCurrency)
}
