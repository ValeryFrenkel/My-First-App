//
//  NewsViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit

struct Article: Codable {
    
    let author: String
    let title: String
}


private let reuseIdentifier = "NewsCell"

class NewsViewController : UICollectionViewController {
    
    let titlesAndAuthors = [
        Article(author: "Valery", title: "Covid-19"),
        Article(author: "Vasya", title: "Covid Vaccine"),
        Article(author: "Alex", title: "Belarus Elections"),
        Article(author: "Nikita", title: "Covid Outbreak")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesAndAuthors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
        
        cell.titleLable?.text = "\(titlesAndAuthors[indexPath.row].title)"
        cell.authorLabel?.text = "\(titlesAndAuthors[indexPath.row].author)"
        
        return cell
    }
}




