//
//  ContentView.swift
//  EMERAI
//
//  Created by Dan Peng on 4/17/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
        var body: some View {
            TabView {
                MainView()
                    .tabItem {
                        Label("Tips", systemImage: "lightbulb")
                    }

                AskView()
                    .tabItem {
                        Label("Ask", systemImage: "questionmark.circle")
                    }

                DataView()
                    .tabItem {
                        Label("Data", systemImage: "chart.bar")
                    }

                ProfileView() 
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
