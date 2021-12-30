//
//  ContentView.swift
//  SwiftUINaviationRD
//
//  Created by Anthony Ankit on 08/10/20.
//

import SwiftUI

struct View1: View {
    @State var isNavigationBarHidden: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                NavigationLink("View 2", destination: View2(isNavigationBarHidden: self.$isNavigationBarHidden))
            }
            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct View2: View {
    @Binding var isNavigationBarHidden: Bool

    var body: some View {
        ZStack {
            Color.green
            NavigationLink("View 3", destination: View3())
        }
        .navigationBarTitle("Visible Title 1", displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct View3: View {
    var body: some View {
        Color.blue
            .navigationBarTitle("Visible Title 2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
