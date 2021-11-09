//
//  Announcements.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 2.11.2021.
//

import SwiftUI

struct Announcements: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
    }
    @State var posts: [Post] = []
    @State var detailView = false
    // MARK: - Body
    var body: some View {
        List {
            ForEach(posts) { post in
                NavigationLink(destination: AnnouncementsDetail(post: post)) {
                    AnnouncementListItem(post: post)
                }
            }
        }
        .background(Color(colorScheme == .light ? .systemGroupedBackground : .opaqueSeparator).ignoresSafeArea())
        .onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Duyurular")
        .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - Preview
struct Announcements_Previews: PreviewProvider {
    static var previews: some View {
        Announcements()
            .preferredColorScheme(.dark)
    }
}

