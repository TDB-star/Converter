//
//  ExchangeRate.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 27/11/2025.
//

import SwiftUI

struct ExchageRate: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    let exchageRate: String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 36)
            
            Text(exchageRate)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
    }
}
