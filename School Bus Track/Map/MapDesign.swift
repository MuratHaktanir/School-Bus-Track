//
//  MapDesign.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 1.11.2021.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapDesign: View {
    // MARK: - Properties
    @StateObject var mapData = MapViewModel()
    // Location Manager
    @State var locationManager = CLLocationManager()
    // SearchView
    @State private var searchView = false
    @StateObject var user = ServiceModelData()
    // Point Color on Map
    @Environment(\.colorScheme) var colorScheme
    // MARK: - Body
    var body: some View {
        ZStack {
            MapView()
                .environmentObject(mapData)
                .edgesIgnoringSafeArea(.bottom)
                .edgesIgnoringSafeArea(.horizontal)
                .accentColor(colorScheme == .light ? .blue : .pink)

            VStack {
                Spacer()
                HStack {
                    MapInfoButton(mapInfo: $mapData.mapInfo, user: user.user[0])
                    Spacer()
                    VStack {
                        Button(action: {
                            mapData.focusLocation()
                        }, label: {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(10)
                                .background(Color.primary)
                                .clipShape(Circle())
                        })
                        Button(action: {
                            mapData.updateMapType()
                        }, label: {
                            Image(systemName: mapData.mapType == .standard ? "network" : "map")
                                .font(.title2)
                                .padding(10)
                                .background(Color.primary)
                                .clipShape(Circle())
                        })
                        
                        Button(action: {
                            withAnimation {
                                self.searchView.toggle()
                            }
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .padding(10)
                                .background(Color.primary)
                                .clipShape(Circle())
                            
                        })
                            .sheet(isPresented: $searchView) {
                                SearchView(mapData: mapData, locationManager: locationManager, searchView: $searchView)
                            }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 23)
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .onAppear(perform: {
            // Setting Delegate
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        // Permission denied alert
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(
                title: Text("Konum izni verilmedi."),
                message: Text("Lütfen konum servislerine izin verin."),
                dismissButton: .default(Text("Ayarlara gidin."), action: {
                    // Redirecting user to settings.
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
        })
    }
}
// MARK: - Preview
struct MapDesign_Previews: PreviewProvider {
    static var previews: some View {
        MapDesign()
            .preferredColorScheme(.dark)
            .environmentObject(MapViewModel())
            .environmentObject(ServiceModelData())
    }
}
