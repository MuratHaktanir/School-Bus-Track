//
//  SearchView.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 2.11.2021.
//

import SwiftUI
import MapKit

struct SearchView: View {
    // MARK: - Properties
    @StateObject var mapData = MapViewModel()
    // Location Manager
    @State var locationManager = CLLocationManager()
    
    // Dismiss Button
    @Binding var searchView: Bool
    
    // ColorScheme
    @Environment(\.colorScheme) var colorScheme
    var brandGradient = Gradient(colors: [Color(.systemPurple), Color(.systemTeal)])
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Bulmak istediğiniz okulu buraya yazınız.", text: $mapData.searchTxt)
                        .colorScheme(.light)
                    
                        .overlay(
                            Button(action: {
                                self.mapData.searchTxt = ""
                            }, label: {
                                HStack {
                                    Spacer()
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        Image(systemName: !mapData.searchTxt.isEmpty ? "xmark" : "xmark")
                                            .foregroundColor(mapData.searchTxt != "" ? .purple : .clear)
                                    }
                                }
                                
                            })
                                .buttonStyle(PlainButtonStyle())
                        )
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.white)
                .background(Color(colorScheme == .light ? .white : UIColor.systemBackground))
                .cornerRadius(12)
                // Displaying results
                
                if !mapData.places.isEmpty && mapData.searchTxt != "" {
                    
                    ScrollView(showsIndicators: true) {
                        VStack(spacing: 15) {
                            ForEach(mapData.places) { place in
                                Text(place.place.name ?? "")
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .onTapGesture {
                                        mapData.selectPlace(place: place)
                                        withAnimation {
                                            self.searchView = false
                                        }
                                    }
                                Divider()
                            }
                        }
                        .padding(.top)
                    }
                    .background(Color(colorScheme == .light ? .white : UIColor.quaternarySystemFill))
                    .padding(.top, 1)
                    .cornerRadius(12)
                }
                Spacer()
            }
            .padding()
            // Searching delay
            .onChange(of: mapData.searchTxt, perform: { newValue in
                // Searching places
                // Delay
                // let delay = 0.1
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    if newValue == mapData.searchTxt {
                        self.mapData.searchQuery()
                    }
                }
            })
            
            // Background
            
            .background(Color(colorScheme == .light ? .systemGroupedBackground : UIColor.systemGray2).ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.searchView = false
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title3)
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.purple)
                        
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    LogoView()
                }
            }
            .navigationTitle("Konum Arama")
            .navigationBarTitleDisplayMode(.inline)
        }// NavigationView
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchView: .constant(false))
            .preferredColorScheme(.dark)
        //            .preferredColorScheme(.dark)
            .environmentObject(MapViewModel())
    }
}
