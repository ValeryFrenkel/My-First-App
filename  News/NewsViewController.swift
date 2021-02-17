//
//  NewsViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit

private let reuseIdentifier = "NewsCell"

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        if let data = NSData(contentsOf: NSURL(string: url)! as URL) {
            return UIImage(data: data as Data)
        } else {
            return UIImage()
        }
    }
}

class NewsViewController : UICollectionViewController {
    
    var articles:[Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .orange
        
        guard let newsUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cb2b3fb383dc488eaac69d4704e8ee2d") else { return }
        
        let newsSession = URLSession.shared
        newsSession.dataTask(with: newsUrl) { (data, response, error) in
            
            if let response = response {
              print(response)
            }
            
            guard let data = data else { return }
            print(data)
            
            do {
                let decoder = JSONDecoder()
                let a = try decoder.decode(AllArticles.self , from: data)
                self.articles = a.articles
                DispatchQueue.main.async {
                    [self] in
                    self.collectionView.reloadData()
                }
            } catch{
                print(error)
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers])
                let  jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                print(String(decoding: jsonData, as: UTF8.self))
            } catch {
                print(error)
            }
        }.resume()
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
        
        cell.titleLable?.text = "\(articles[indexPath.row].title)"
        cell.authorLabel?.text = "\(articles[indexPath.row].author)"
        
        
        cell.backgroundColor = .green
        
        return cell
    }
    
    
    
}




