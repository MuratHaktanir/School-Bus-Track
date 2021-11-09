//
//  LogoView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 2.11.2021.
//

import SwiftUI

struct LogoView: View {
    var brandGradient = Gradient(colors: [Color(.systemPurple), Color(.systemTeal)])
    var body: some View {
        Image("buslogo")
            .resizable()
            .renderingMode(.original)
            .offset(y: -1)
            .frame(width: 34, height: 34, alignment: .leading)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing)).lineLimit(10)
            )
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 2, x: -5, y: 3)
            
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
