//
//  ContentView.swift
//  AdobeTestProject
//
//  Created by Frank Tan on 9/3/20.
//  Copyright © 2020 Frank Tan. All rights reserved.
//

import SwiftUI
import ACPCore

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
                Text("Event Menu")
            Button(action: {
                ACPCore.trackAction("ADD_TO_CART", data: [
                    "name": "Branch Cap",
                    "revenue": "65.42",
                    "currency": "USD",
                    "timestamp": String(Date.timeIntervalSinceReferenceDate),
                    "category": "hats",
                    "sku": "sku-code-here"
                ])
            }) {
                Text("log ADD_TO_CART")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
