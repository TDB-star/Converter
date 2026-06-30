import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            //background image
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(
                                        leftAmount, to: rightCurrency)
                                }
                            }
                            .onChange(of: leftCurrency) {
                                rightAmount = leftCurrency.convert(
                                    leftAmount, to: rightCurrency)
                            }
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(
                                        rightAmount, to: leftCurrency)
                                }
                            }
                            .onChange(of: rightCurrency) {
                                leftAmount = rightCurrency.convert(
                                    rightAmount, to: leftCurrency)
                            }
                    }
                    .task {
                        try? Tips.configure()
                    }
                    
                    //.padding()
                    .keyboardType(.decimalPad)
                    
                }
                           //.border(.blue)
                .padding()
                .background(.black.opacity(0.5))
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfoView()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrencyView(
                            topCurrency: $leftCurrency,
                            bottomCurrency: $rightCurrency
                        )
                    }
                }
            
            }
       
        }
    }
}
//#Preview {
//    ContentView(showExchangeInfo: false, showSelectCurrency: false, leftAmount: " ", rightAmount: "", leftTyping: false, rightTyping: " ", leftCurrency: .copperPenny, rightCurrency: .goldPenny)
//}
