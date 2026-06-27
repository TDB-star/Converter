//
//  CurrencyIconView.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 30/11/2025.
//

import SwiftUI

struct CurrencyIconView: View {
    
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(4)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(4)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    CurrencyIconView(currencyImage: .goldpiece, currencyName: "Gold piece")
}
