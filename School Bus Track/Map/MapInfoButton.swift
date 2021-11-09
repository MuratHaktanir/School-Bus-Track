//
//  MapInfoButton.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 3.11.2021.
//

import SwiftUI

struct MapInfoButton: View {
    // MARK: - Properties
    @Binding var mapInfo: Bool
    @StateObject var loginModel = LoginModel()
    var user: Users
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if self.mapInfo {
                VStack(spacing: 20) {
                    Button(action: {
                        self.loginModel.callNumber(phoneNumber: loginModel.phoneNumber)
                    }, label: {
                        Image(systemName: "bus")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    .offset(x: 60, y: 0)
                    
                    Button(action: {
                        self.loginModel.callNumber(phoneNumber: loginModel.phoneNumber)
                    }, label: {
                        Image(systemName: "person.crop.square")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                            
                    })
                        .offset(x: 60, y: 0)
                }
            }
            Button(action: {
                withAnimation {
                    self.mapInfo.toggle()
                }
            }, label: {
                Image(systemName: "info.circle")
                    .font(.title2)
                    .padding(10)
                    .background(self.mapInfo ? Color.secondary : Color.primary )
                    .clipShape(Circle())
            })
                .padding()
        }
    }
}
// MARK: - Preview
struct MapInfoButton_Previews: PreviewProvider {
    static var user = ServiceModelData()
    static var previews: some View {
        MapInfoButton(mapInfo: .constant(false), user: user.user[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(MapViewModel())
            .environmentObject(LoginModel())
    }
}

