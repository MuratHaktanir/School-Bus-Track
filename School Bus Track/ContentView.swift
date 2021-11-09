//
//  ContentView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI


struct ContentView: View {
    // MARK: - Properties
    @State private var isLoading = true

    // MARK: - Body
    var body: some View {
        if isLoading {
            LaunchView(isLoading: $isLoading)
        }else {
            HomeView()
        }
    }
}
    // MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(LoginModel())
    }
}
