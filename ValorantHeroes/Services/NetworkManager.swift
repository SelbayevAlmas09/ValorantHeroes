//
//  NetworkManager.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 28.05.2022.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(ValorantHero) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let valorantHero = try JSONDecoder().decode(ValorantHero.self, from: data)
                DispatchQueue.main.async {
                    completion(valorantHero)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func fetchHeroIcon(from url: String?, with completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let heroIcon = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                completion(heroIcon)
            }
            
        }.resume()
    }
}
