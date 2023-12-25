//
//  WebServices.swift
//  NewsApp
//
//  Created by Tolga Sarikaya on 25.12.23.
//

import Foundation

class WebServices {
    
    static let shared = WebServices()
    
    private init() {}
    
    private let session = URLSession.shared
    
    func fetchNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=950d670b55e945ebb025596570b8e57"
        
        if let url = URL(string: urlString) {
            session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    
                    do {
                        let result = try JSONDecoder().decode(NewsResponse.self, from: data!)
                        completion(result.articles)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
            
    }
}
