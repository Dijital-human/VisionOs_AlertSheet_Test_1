//
//  AlerSheet_Test_2.swift
//  AlertSheet_Test_1
//
//  Created by Famil Mustafayev on 03.08.24.
//

import SwiftUI

struct AlerSheet_Test_2: View {
    @State var userModel: User_Model
    @State private var showAlert = false
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.supportsMultipleWindows) private var multipleWindows

    var body: some View {
        ZStack(alignment: .top){
            Rectangle().background(.linearGradient(Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)).clipShape(RoundedRectangle(cornerRadius: 50.0))
            VStack(alignment:.center ,spacing: 10.0){
                Text("Dijital Human")
                Text("Alert Controller Testing").foregroundStyle(.secondary)
                VStack{
                    HStack{
                        Text("Name\t\t")
                        TextField(text: $userModel.name) {
                            Text("Ended your name:")
                        }.textFieldStyle(.roundedBorder)
                    }.font(.title).padding(.horizontal)
                    HStack{
                        Text("Surname\t")
                        TextField(text: $userModel.name) {
                            Text("Ended your surname:")
                        }.textFieldStyle(.roundedBorder)
                    }.font(.title).padding(.horizontal)
                    HStack{
                        Text("Age\t\t\t")
                        TextField(text: $userModel.name) {
                            Text("Ended your age:")
                        }.textFieldStyle(.roundedBorder)
                    }.font(.title).padding(.horizontal)
                    HStack{
                        Text("Password\t")
                        SecureField(text: $userModel.name) {
                            Text("Ended your password:")
                        }.textFieldStyle(.roundedBorder)
                    }.font(.title).padding(.horizontal)

                    Button(action: {
                        if userModel.name.isEmpty || userModel.surname.isEmpty || userModel.age.isEmpty || userModel.password.isEmpty{
                            showAlert.toggle()
                        }
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    })
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                    .padding(.horizontal)
                    .padding(.top, 30)
                    Text("Xanalari duzgun doldurun").font(.headline).foregroundStyle(.red.opacity(0.4))
                    Button(action: {
                        openWindow(id: "movie")
                    }, label: {
                        Text("Kecid")
                    })
                }.frame(width: 600, height: 400).background(.white).clipShape(RoundedRectangle(cornerRadius: 25.0)).shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                    
                
                
                
            }.font(Font.custom("Optima", size: 62)).foregroundStyle(.black).fontWidth(.standard).fontWeight(.regular).padding(.top)
            
                
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Ended your data"),
                  message: Text("Registration"),
                  primaryButton: .destructive(Text("destructive")),
                  secondaryButton: .cancel())
        }.background(.white)
    }
}

#Preview(windowStyle: .automatic) {
    AlerSheet_Test_2(userModel: User_Model())
}
