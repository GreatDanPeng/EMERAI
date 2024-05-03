//
//  DataView.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//

import SwiftUI

struct AppointmentView: View {
    @StateObject private var viewModel = AppointmentViewModel()
       
       var body: some View {
           NavigationView {
               List {
                   ForEach(viewModel.providers) { provider in
                       VStack(alignment: .leading) {
                           Text("\(provider.name) \(provider.title)")
                               .font(.headline)
                           Text("⭐️ \(String(provider.rating)) (\(provider.reviewsCount) reviews)")
                           if provider.isSponsored {
                               Text("Sponsored").foregroundColor(.red)
                           }
                           HStack {
                               ForEach(provider.nextAvailableAppointments, id: \.self) { date in
                                   Text(date)
                                       .padding(.horizontal)
                                       .background(Color.yellow)
                                       .cornerRadius(5)
                               }
                           }
                       }
                       .padding()
                   }
               }
               .navigationTitle("Find Care")
               .onAppear {
                   viewModel.fetchProviders()
               }
           }
       }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
