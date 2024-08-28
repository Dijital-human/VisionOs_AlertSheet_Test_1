//
//  ContentView.swift
//  AlertSheet_Test_1
//
//  Created by Famil Mustafayev on 03.08.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var password: String = ""

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State private var show: Bool = false
    var body: some View {
        ZStack(alignment:.top){
            Color.white.clipShape(RoundedRectangle(cornerRadius: 25.0))
            VStack(spacing: 10.0){
                Text("Dijital Human").font(Font.custom("Futura", size: 44))
                Text("Dijital Human Web Sitesi sizler ucun ayarlandi").foregroundStyle(.secondary).font(.title).fontDesign(.serif).monospaced()
                HStack{
                    Image("img").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200)
                    
                    VStack(spacing: 20.0){
                        Text("Shanin Mahmudov 1981 ci ilde Gurcustanda anadan olmus ve daim sizin xidmetinizdedi").font(.title)
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text("About").frame(maxWidth: 300)
                            Spacer()
                        }).frame(width: 300, height: 50).background(.blue).clipShape(Capsule()).foregroundStyle(.white)
                    }.padding(30)
                }.frame(maxWidth: 600).border(Color.red)
            }.padding(.top, 50.0)
            
        }.foregroundStyle(.black)
            .alert(isPresented: $show) {
                Alert(
                    title: Text("Shahin Mahmudov haqqinda daha etrafli"),
                    message: Text("Sahin Mahmudov cox hevesli oglandi"),
                    primaryButton: .destructive(Text("destructive")),
                    secondaryButton: .cancel())
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
