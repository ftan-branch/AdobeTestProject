//
//  ContentView.swift
//  AdobeTestProject
//
//  Created by Frank Tan on 9/3/20.
//  Copyright © 2020 Frank Tan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                Text("Hello, World!")
            Button(action: {
                print("pressed button")
            }) {
                Text("add_to_cart!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
