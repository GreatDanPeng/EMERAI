//
//  AppointmentViewModel.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//

import Foundation

struct Provider: Identifiable {
    var id: Int
    var name: String
    var title: String
    var rating: Double
    var reviewsCount: Int
    var isSponsored: Bool
    var hasVideo: Bool
    var nextAvailableAppointments: [String]
}


class AppointmentViewModel: ObservableObject {
    @Published var providers: [Provider] = []
    
    // Simulate fetching data
    func fetchProviders() {
        // This would be replaced by actual data fetching logic
        providers = [
            Provider(id: 1, name: "Ashlyn Nicole", title: "PA-C", rating: 5.0, reviewsCount: 37, isSponsored: true, hasVideo: true, nextAvailableAppointments: ["May 6", "May 7"]),
            // Add more providers similarly
        ]
    }
}
