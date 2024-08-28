//
//  AlerSheet_Test_3.swift
//  AlertSheet_Test_1
//
//  Created by Famil Mustafayev on 04.08.24.
//

import SwiftUI

struct AlerSheet_Test_3: View {
    @State private var isOn: Bool = false
    @State private var show: Bool = false
    @State private var isPresent: Bool = false
    @State private var sliderValude: Double = 2
    @State private var picker = "Baku"
    
    @State private var state:CGFloat = 0.7
    private var daireyuzde: Int {
        Int(state * 100)
    }
    var body: some View {
        VStack{
            ZStack{
                Color.white
                VStack{
                    Text("Toggle \(isOn)").foregroundStyle(isOn ? Color.red : Color.black)
                    Toggle("Toggle", isOn: $isOn).padding(.horizontal, 90)//.labelsHidden()
                    
                    Text("Slider \(Int(sliderValude))")
                    Slider(value: $sliderValude, in: 0...100).tint(Color.red).padding(.horizontal)
                    Text("\(picker)")
                    Picker("pickler", selection: $picker) {
                        Text("Baku").tag("1")
                        Text("Gence").tag("2")
                        Text("Sumqayit").tag("3")
                        Text("Yevlax").tag("4")

                    }
                    Circle().trim(from: 0.0,to: state).stroke(daireyuzde == 100 ? .red : .blue, style: StrokeStyle(lineWidth: 3.0, miterLimit: 10.0, dash: [5, 10], dashPhase: 100.0)).padding(.horizontal)
                        .overlay {
                            if daireyuzde < 90 {
                                Text("\(daireyuzde) %").font(.largeTitle)
                            }else if daireyuzde == 100{
                                Image("img").clipShape(Circle())
                            }
                        }
                    Slider(value: $state).tint(.red).background(.blue).clipShape(Capsule()).padding(.horizontal)

                    Button(action: {
                        isOn.toggle()
                    }, label: {
                        Text("Button").foregroundStyle(.white).frame(maxWidth: .infinity)
                    }).background(.blue).clipShape(Capsule()).padding(.horizontal)
                }.foregroundStyle(.red)
                
                
            }.frame(width: 400)
        }.alert(isPresented: $isOn) {
            Alert(
                title: Text("Title"),
                message: Text("Messaje"),
                dismissButton: .cancel()
            )
        }.tint(Color.red)
    }
}

#Preview (windowStyle: .automatic){
    AlerSheet_Test_3()
}
