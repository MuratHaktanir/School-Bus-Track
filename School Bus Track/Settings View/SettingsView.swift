//
//  SettingsView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 29.10.2021.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @StateObject var loginModel = LoginModel()
    @Environment(\.colorScheme) var colorScheme
    var brandGradient = Gradient(colors: [Color(.systemPurple), Color(.systemTeal)])
    
    init() {
           UITableView.appearance().backgroundColor = .clear // tableview background
           UITableViewCell.appearance().backgroundColor = .clear // cell background
        
       }
    
    // MARK: - Bdoy
    var body: some View {
        List {
            Section(footer: Text("Telefon numaranızı ve şifrenizi tekrar girmeniz gerekir.")) {
                Toggle(isOn: $loginModel.login) {
                    if loginModel.login {
                        Text("Çıkış yapıldı.")
                            .font(.headline)
                    }else {
                        Text("Çıkış yapmak için dokunun.")
                            .font(.headline)
                    }
                }
                .padding(.horizontal)
                .toggleStyle(DefaultToggleStyle())
                .onChange(of: loginModel.login) { newValue in
                    loginModel.phoneNumber = ""
                    loginModel.password = ""
                    loginModel.checkBox = false
                }
            }
            
            Section(footer: Text("Seçilen zamanlara göre serivisi kullanan kişiye özgü bildirim ayarlarını seçebilirsiniz.")) {
                NavigationLink(destination: Notifications()) {
                    Text("Bildirim Ayarları")
                        .font(.headline)
                }
            }
            
            Section(footer: Text("Gelişmelere dair bilgilendirmelere ulaşabilirsiniz.")) {
                NavigationLink(destination: Announcements()) {
                    Text("Duyurular")
                        .font(.headline)
                }
            }
            
            Section(footer: Text("Servis şöförü, hostese dair bilgilere buradan ulaşabilirsiniz. Mesaj gönderebilirsiniz.")) {
                NavigationLink(destination: ServiceInformation()) {
                    Text("Servis Bilgisi")
                        .font(.headline)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Ayarlar")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(colorScheme == .light ? .systemGroupedBackground : .opaqueSeparator).ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                LogoView()
            }
        }
    }
}
// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
