//
//  CreatePasswordView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI

struct CreatePasswordView: View {
    // MARK: - Properties
    @Binding var passwordView: Bool
    @Binding var phoneNumber: String
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .modifier(ColorSchemeModifier())
                VStack(alignment: .leading, spacing: 20) {
                    Text("Şifrenizi öğrenmek için cep telefon numarınızı başında sıfır olmadan giriniz.")
                        .font(.system(size: 18, weight: .regular, design: .default))
                    
                    
                    TextField("Cep telefonu numaranız.", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    Button(action: {
                        self.passwordView = false
                    }, label: {
                        Text("Şifremi gönder")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .background(
                                Color.blue
                            )
                            .cornerRadius(30)
                    })
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 30)
                }
                .padding()
                .navigationTitle("Şifre İşlemleri")
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        Button(action: {
                            self.passwordView = false
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.title3)
                                .foregroundColor(.blue)
                        })
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview
struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView(passwordView: .constant(false), phoneNumber: .constant(""))
            .preferredColorScheme(.dark)
    }
}
