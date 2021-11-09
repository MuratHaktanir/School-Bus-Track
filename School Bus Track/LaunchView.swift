//
//  LaunchView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 2.11.2021.
//

import SwiftUI

struct LaunchView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    @Binding var isLoading: Bool

    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .modifier(ColorSchemeModifier())
            
            if isLoading {
                VStack(spacing: 0) {
                    Image("buslogo")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100, alignment: .center)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 2, x: -5, y: 3)
                        .padding()

                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: colorScheme == .light ? .blue : .red))
                        .padding()
                    
                    Text("Loading...")
                        .fontWeight(.bold)
                        .font(.footnote)
                }
            }
        }
        .onAppear {fakeLoading()}
        .zIndex(10)
    }
    func fakeLoading() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}
// MARK: - Preview
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(isLoading: .constant(true))
    }
}
