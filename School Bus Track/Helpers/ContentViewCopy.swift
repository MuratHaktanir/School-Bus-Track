////
////  ContentView.swift
////  School Bus Track
////
////  Created by Murat Haktanır on 25.10.2021.
////
//
//import SwiftUI
//import CoreData
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


//        // Searching delay
//        .onChange(of: mapData.searchTxt, perform: { newValue in
//            // Searching places
//            // Delay
//            let delay = 0.1
//            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                if newValue == mapData.searchTxt {
//                    self.mapData.searchQuery()
//                }
//            }
//        })


//                VStack(spacing: 0) {
//
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                        TextField("Bulmak istediğiniz okulu buraya yazınız.", text: $mapData.searchTxt)
//                            .colorScheme(.light)
//                            .overlay(
//                                Button(action: {
//                                    self.mapData.searchTxt = ""
//                                }, label: {
//                                    HStack {
//                                        Spacer()
//                                        withAnimation(.easeInOut(duration: 0.3)) {
//                                            Image(systemName: !mapData.searchTxt.isEmpty ? "xmark.circle" : "xmark.circle")
//                                                .foregroundColor(mapData.searchTxt != "" ? .blue : .clear)
//                                        }
//                                    }
//                                })
//                            )
//                    }
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(Color.white)
//                    .cornerRadius(12)
//
//                    // Displaying results
//
//                    if !mapData.places.isEmpty && mapData.searchTxt != "" {
//
//                        ScrollView(showsIndicators: true) {
//                            VStack(spacing: 15) {
//                                ForEach(mapData.places) { place in
//                                    Text(place.place.name ?? "")
//                                        .foregroundColor(.black)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .padding(.leading)
//                                        .onTapGesture {
//                                            mapData.selectPlace(place: place)
//                                        }
//                                    Divider()
//                                }
//                            }
//                            .padding(.top)
//                        }
//                        .background(Color.white)
//                        .padding(.top, 1)
//                        .cornerRadius(12)
//                    }
//                }
//                .padding(.top)
