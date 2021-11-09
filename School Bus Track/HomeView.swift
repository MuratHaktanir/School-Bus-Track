//
//  HomeView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @EnvironmentObject var loginModel: LoginModel
    var brandGradient = Gradient(colors: [Color(.systemPurple), Color(.systemTeal)])

    // MARK: - Body
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            if loginModel.login {
                LoginView()
            }else {
                NavigationView {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Rectangle()
                            .modifier(ColorSchemeModifier())
                        MapDesign()
                    }
                    // Navigation Tools
                    .navigationTitle("School Bus")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gear")
                                    .font(.title3)
                                    .foregroundColor(.purple)
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            LogoView()
                        }
                    }
                    .onAppear(perform: loginModel.requestPush)
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        .environmentObject(loginModel)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LoginModel())
    }
}


