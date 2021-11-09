//
//  Notifications.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 6.11.2021.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    // MARK: - Properties
    
    // Background
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
        
    }
    
    // Toggles
    //    @State private var closeNotify = false
    @AppStorage("closeNotify") var closeNotify = false
    
    // Notification Buttons
    @AppStorage("getInBusMorning") var getInBusMorning = false
    @AppStorage("getOutBusMorning") var getOutBusMorning = false
    
    @AppStorage("getInBusNight") var getInBusNight = false
    @AppStorage("getOutBusNight") var getOutBusNight = false
    
    
    // MARK: - Body
    var body: some View {
        
        Form {
            Section(footer: Text("Servis hareketleri hakkında bildirim almak isteseniz, lütfen bildirimleri açık tutun.")) {
                Toggle(isOn: $closeNotify) {
                    Text(closeNotify ? "Bildirimleri kapat." : "Bildirimleri aç.")
                }
            }
            .onTapGesture {
                withAnimation {
                    self.closeNotify.toggle()
                }
            }
            
            if self.closeNotify {
                Section(footer: Text(self.closeNotify ? "Almak istediğiniz bildirimi seçiniz.": "")) {
                    VStack(alignment: .leading, spacing: 30) {
                        HStack {
                            Text("Sabah araca biniş.")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    if self.closeNotify {
                                        self.getInBusMorning.toggle()
                                    }else {
                                        self.getInBusMorning = false
                                    }
                                }
                            }, label: {
                                Image(systemName: getInBusMorning ? "checkmark.circle" : "circle")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            })
                        }
                        HStack {
                            Text("Sabah araçtan iniş.")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.getOutBusMorning.toggle()
                                }
                            }, label: {
                                Image(systemName: getOutBusMorning ? "checkmark.circle" : "circle")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            })
                        }
                        
                        HStack {
                            Text("Akşam araca biniş.")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.getInBusNight.toggle()
                                }
                            }, label: {
                                Image(systemName: getInBusNight ? "checkmark.circle" : "circle")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            })
                        }
                        
                        HStack {
                            Text("Akşam araçtan iniş.")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.getOutBusNight.toggle()
                                }
                            }, label: {
                                Image(systemName: getOutBusNight ? "checkmark.circle" : "circle")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            })
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }else {
                Text("Bildirimlere izin verirseniz,\nbildirim seçecenekleriniz burada görünür.")
                    .font(.system(size: 15, weight: .light, design: .default))
            }
        }
        .zIndex(1)
        .background(
            Color(colorScheme == .light ? .systemGroupedBackground : .opaqueSeparator).ignoresSafeArea()
        )
        .navigationTitle("Bildirimler")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
