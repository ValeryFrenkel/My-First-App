//
//  NewsStructures.swift
//  My First App
//
//  Created by Valery Frenkel on 2/18/21.
//

import UIKit

struct Article: Codable {
    
    let author: String?
    let title: String
    let urlToImage: URL?
    
    
    private enum CodingKeys: String, CodingKey {
                case author, title, urlToImage
            }

    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            author = try? container.decode(String.self, forKey: .author)
            title = try container.decode(String.self, forKey: .title)
            urlToImage = try? container.decode(URL.self, forKey: .urlToImage)
        }
    
}

struct AllArticles: Codable{
    
    let articles: [Article]
    
}
