//
//  MainView.swift
//  EMERAI
//
//  Created by Dan Peng on 5/1/24.
//

import SwiftUI

struct MainView: View {
    // Sample data for demonstration
    let recommendations = [
        "Replace bandage & ointment",
        "Rehabilitation exercise 1",
        "Rehabilitation exercise 2"
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(recommendations, id: \.self) { item in
                            Text("• \(item)")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }

                        // Displaying recommendation images
                        Image("rehab_bridge") // Placeholder images, replace with actual image names
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()

                        Image("rehab_exercise_1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()

                        Image("rehab_exercise_2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true) // Hide navigation bar if not needed
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
