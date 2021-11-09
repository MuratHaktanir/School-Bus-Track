//
//  ServiceInformationItem.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 5.11.2021.
//

import SwiftUI

struct ServiceInformationItem: View {
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    var user: Users

    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .modifier(ColorSchemeModifier())
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Öğrenci Adı ve Soyadı:")
                        .fontWeight(.semibold)
                    Text(user.name)
                    Spacer()
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(colorScheme == .light ? .opaqueSeparator : .black))
                        .cornerRadius(12)
                )
                
                Divider()
                
                HStack {
                    Text("Kullanıcı Adı:")
                        .fontWeight(.semibold)
                    Text(user.username)
                    Spacer()
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(colorScheme == .light ? .opaqueSeparator : .black))
                        .cornerRadius(12)
                )
                
                Divider()
                
                HStack {
                    Text("Email adresi:")
                        .fontWeight(.semibold)
                    Text(user.email)
                    Spacer()
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(colorScheme == .light ? .opaqueSeparator : .black))
                        .cornerRadius(12)
                )
                
                Divider()
                
                HStack {
                    Text("Adres:")
                        .fontWeight(.semibold)
                    Text("\(user.address.street) \(user.address.suite) \(user.address.city)")
                    Spacer()
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(colorScheme == .light ? .opaqueSeparator : .black))
                        .cornerRadius(12)
                )
                
                Divider()
                
                HStack {
                    Text("Telefon No:")
                        .fontWeight(.semibold)
                    Text(user.phone)
                    Spacer()
                    Button(action: {
//                        UIApplication.sharedApplication().openURL(NSURL(string: "tel://9809088798")!)
                    }, label: {
                        Image(systemName: "phone.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.purple)
                    })
                        .buttonStyle(PlainButtonStyle())
                }
                
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(colorScheme == .light ? .opaqueSeparator : .black))
                        .cornerRadius(12)
                )
            }
            .font(.system(size: 14, weight: .regular, design: .default))
        }
        
    }
}
    // MARK: - Preview
struct ServiceInformationItem_Previews: PreviewProvider {
    static let user = ServiceModelData()
    static var previews: some View {
        ServiceInformationItem(user: user.user[0])
            .preferredColorScheme(.dark)
            .environmentObject(ServiceModelData())
    }
}
