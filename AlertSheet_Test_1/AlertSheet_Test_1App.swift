//
//  AlertSheet_Test_1App.swift
//  AlertSheet_Test_1
//
//  Created by Famil Mustafayev on 03.08.24.
//

import SwiftUI

@main
struct AlertSheet_Test_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup(id: "movie") {
            AlerSheet_Test_4()
        }
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
