//
//  Post.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 4.11.2021.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    let id: Int
    var title: String
    var body: String
    
    
    #if DEBUG
    static let example = Post(id: 0, title: "Deneme", body: "Her şey çok güzel olacak!")
    #endif
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

