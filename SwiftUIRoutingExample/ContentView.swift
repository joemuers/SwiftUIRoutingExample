//
//  ContentView.swift
//  SwiftUIRoutingExample
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        
        Button("Go to Router flow") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: self.$showingSheet) {
            RouterSwiftUIAdapter()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
