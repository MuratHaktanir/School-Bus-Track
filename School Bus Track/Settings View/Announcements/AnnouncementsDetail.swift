//
//  AnnouncementsDetail.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 4.11.2021.
//

import SwiftUI

struct AnnouncementsDetail: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    
    let post: Post
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .modifier(ColorSchemeModifier())
            ScrollView {
                    VStack(alignment: .leading) {
                        Text(post.body)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .navigationTitle(post.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    // MARK: - Preview
struct AnnouncementsDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsDetail(post: Post.example)
            .preferredColorScheme(.dark)
            
    }
}

