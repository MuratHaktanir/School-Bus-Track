//
//  UserInformation.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 7.11.2021.
//

import SwiftUI

struct UserInformation: View {
    // MARK: - Propertites
    var user: Users
    @StateObject var users = ServiceModelData()
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .modifier(ColorSchemeModifier())
            VStack {
                
                HStack {
                    Logo()
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Öğrenci ismi:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.name)
                        }
                        HStack {
                            Text("Güzergah:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.address.street)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(
                        Color(colorScheme == .light ? .systemGray4 : .systemFill)
                            .cornerRadius(12)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 2, x: -5, y: 3)
                    )
                }
                .padding()
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Sürücü İsmi:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.name)
                    }
                    Divider()
                    HStack {
                        Text("Tel. No:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.phone)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.users.callNumber(phoneNumber: user.phone)
                            }
                    }
                    Divider()
                    HStack {
                        Text("Hostes İsmi:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.name)
                    }
                    Divider()
                    HStack {
                        Text("Tel. No:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.phone)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.users.callNumber(phoneNumber: user.phone)
                            }
                    }
                    Divider()
                    HStack {
                        Text("Araç Plakası:")
                            .fontWeight(.bold)
                        Spacer()
                        Text(user.address.zipcode)
                    }
                    Divider()
                }
                .padding()
                .background(
                    Color(colorScheme == .light ? UIColor.systemGray4 : .systemFill)
                        .cornerRadius(12)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 2, x: -5, y: 3)

                )
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            }
        }
    }
}

struct UserInformation_Previews: PreviewProvider {
    static var user = ServiceModelData()
    static var previews: some View {
        Group {
            UserInformation(user: user.user[0])
                .environmentObject(ServiceModelData())
            
            UserInformation(user: user.user[0])
                .environmentObject(ServiceModelData())
                .preferredColorScheme(.dark)
        }
    }
}

struct PhoneButton: View {
    var user: Users
    var body: some View {
        Button(action: {
            callNumber(phoneNumber: user.phone)
        }, label: {
            HStack {
                Text("Tel. No:")
                    Spacer()
                Text(user.phone)
                    
            }
            .foregroundColor(.primary)
        })
            .buttonStyle(PlainButtonStyle())
    }
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}

struct Logo: View {
    var brandGradient = Gradient(colors: [Color(.systemPurple), Color(.systemTeal)])
    var body: some View {
        Image("buslogo")
            .resizable()
            .renderingMode(.original)
            .offset(y: -1)
            .frame(maxWidth: 80, maxHeight: 80, alignment: .topTrailing)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing)).lineLimit(10)
            )
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 2, x: -5, y: 3)
    }
}
