//
//  ProfileView.swift
//  EMERAI
//
//  Created by Dan Peng on 5/2/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        List{
            Section{
                HStack{
                    Text("DP")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Dan Peng")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("dan.peng.1202@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
            }
            
            Section("General") {
                HStack {
                    SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            
            Section("Account") {
                Button {
                    viewModel.signOut()
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
