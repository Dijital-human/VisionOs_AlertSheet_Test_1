//
//  AlerSheet_Test_4.swift
//  AlertSheet_Test_1
//
//  Created by Famil Mustafayev on 04.08.24.
//

import SwiftUI

struct AlerSheet_Test_4: View {
    @State private var sheetDetail: InventoryItem?
    @State private var isShowingPopover = false
    @State private var showSettings = false

        var body: some View {
            Button("View Settings") {
                        showSettings = true
                    }
                    .sheet(isPresented: $showSettings) {
                        AlerSheet_Test_3()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
            Button("Show Popover") {
                        self.isShowingPopover = true
                    }
                    .popover(isPresented: $isShowingPopover) {
                        Text("Popover Content")
                            .padding()
                    }
            Button("Show Part Details") {
                sheetDetail = InventoryItem(
                    id: "0123456789",
                    partNumber: "Z-1234A",
                    quantity: 100,
                    name: "Widget")
            }
            .sheet(item: $sheetDetail,
                   onDismiss: didDismiss) { detail in
                VStack(alignment: .leading, spacing: 20) {
                    Text("Part Number: \(detail.partNumber)")
                    Text("Name: \(detail.name)")
                    Text("Quantity On-Hand: \(detail.quantity)")
                }
                .onTapGesture {
                    sheetDetail = nil
                }
            }
        }

        func didDismiss() {
            // Handle the dismissing action.
        }
    }

    struct InventoryItem: Identifiable {
        var id: String
        let partNumber: String
        let quantity: Int
        let name: String
    }



#Preview(windowStyle:.automatic) {
    AlerSheet_Test_4()
}
