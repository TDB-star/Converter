//
//  CurrencyTip.swift
//  Converter
//
//  Created by Tatiana Dmitrieva on 04/12/2025.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Selected Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
