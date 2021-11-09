//
//  ServiceInformation.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 5.11.2021.
//

import SwiftUI

struct ServiceInformation: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    @StateObject var users = ServiceModelData()
    @StateObject var loginModel = LoginModel()
    // MARK: - Body
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            Rectangle()
                .modifier(ColorSchemeModifier())
            VStack {
                ForEach(users.user) { user in
                    if user.phone == loginModel.phoneNumber {
                        
                        ScrollView {
                            VStack {
                                UserInformation(user: user)
                            }
                        }
                    }
                }
            }
//            .padding()
        }
        .navigationTitle("Servis Bilgisi")
        .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - Preview
struct ServiceInformation_Previews: PreviewProvider {
    static var previews: some View {
        ServiceInformation()
        //            .preferredColorScheme(.dark)
            .environmentObject(ServiceModelData())
    }
}

struct ErrorrView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bir hata ile karşılaşıldı.\nTekrar kullanıcı girişi yapınız.")
                .font(.title2)
                .multilineTextAlignment(.leading)
        }
    }
}
