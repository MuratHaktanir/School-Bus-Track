//
//  AnnouncementListItem.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 4.11.2021.
//

import SwiftUI

struct AnnouncementListItem: View {
    let post: Post
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .foregroundColor(.purple)
            Text("\(post.id).")
            Text(post.title)
            Spacer()
        }
        .font(.system(size: 20, weight: .medium, design: .default))
    }
}

struct AnnouncementListItem_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementListItem(post: Post.example)
    }
}
