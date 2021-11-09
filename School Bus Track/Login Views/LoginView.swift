//
//  LoginView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI
import CoreLocation

struct LoginView: View {
    // MARK: - Properties
    @StateObject var loginModel = LoginModel()
//    private let locationManager = CLLocationManager()
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Rectangle()
                .modifier(ColorSchemeModifier())
            ScrollView {
                    // MARK: - Logo
                    Image("buslogo")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 250, height: 75)
                        .cornerRadius(30)
                    
                    
                    VStack {
                        Text("Veli Uygulaması için bilgilerinizi giriniz.")
                            .font(.system(size: 18, weight: .ultraLight, design: .rounded))
                            .fontWeight(.semibold)
                        // MARK: - TextFields
                        VStack {
                            TextField("Telefon numaranızı giriniz.", text: $loginModel.phoneNumber)
                                .keyboardType(.phonePad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            SecureField("Şifrenizi giriniz.", text: $loginModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal)
                        
                        // MARK: - Buttons
                        HStack(spacing: 20) {
                            Button(action: {
                                withAnimation {
                                    self.loginModel.passwordView = true
                                }
                            }, label: {
                                Text("Şifre İşlemleri")
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(
                                        Color.blue
                                    )
                                    .cornerRadius(30)
                            })
                                .fullScreenCover(isPresented: $loginModel.passwordView) {
                                    CreatePasswordView(passwordView: $loginModel.passwordView, phoneNumber: $loginModel.phoneNumber)
                                }
                            Spacer()
                            Button(action: {
                                
                                withAnimation {
                                    guard !loginModel.phoneNumber.isEmpty && !loginModel.password.isEmpty && !loginModel.checkBox ==  false else { return }
                                    self.loginModel.login = false
                                    
                                    self.loginModel.locationManager.requestAlwaysAuthorization()
                                    self.loginModel.locationManager.requestWhenInUseAuthorization()
                                }
                            }, label: {
                                Text("Giriş")
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(
                                        loginModel.phoneNumber.isEmpty || loginModel.password.isEmpty || !loginModel.checkBox ?
                                        Color.gray : Color.blue
                                    )
                                    .cornerRadius(30)
                            })
                                .onTapGesture {
                                    if loginModel.phoneNumber.isEmpty {
                                        loginModel.showConfirmationDiaolog = true
                                    }
                                }
                        }
                        .padding()
                        
                        // MARK: - Privacy Section
                        HStack {
                            Button(action: {
                                self.loginModel.checkBox.toggle()
                            }, label: {
                                withAnimation {
                                    Image(systemName: loginModel.checkBox ? "checkmark.square" : "square")
                                        .font(.title)
                                }
                            })
                            
                            Spacer()
                            Text("KVVK Aydınlatma metni, gizlilik politikası ve tahütnamesini okudum, anladım, onaylıyorum.")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.horizontal)
                        .padding(.top, 30)
                        
                        HStack {
                            Spacer()
                            Link("Okumak için tıklayınız.", destination: URL(string: "https://www.apple.com")!)
                                .foregroundColor(.red)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    
                }
                .padding(.top)
        }
    }
}

    // MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}


//class LocationModel: NSObject, ObservableObject {
//    private let locationManager = CLLocationManager()
//    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined
//
//    override init() {
//        super.init()
//        self.locationManager.delegate = self
//    }
//
//    public func requestAuthorisation(always: Bool = false) {
//        if always {
//            self.locationManager.requestAlwaysAuthorization()
//        } else {
//            self.locationManager.requestWhenInUseAuthorization()
//        }
//    }
//}
//
//extension LocationModel: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        self.authorisationStatus = status
//    }
//}
