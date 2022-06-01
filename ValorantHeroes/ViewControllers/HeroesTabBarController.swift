//
//  HeroesTabBarController.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 31.05.2022.
//

import UIKit

class HeroesTabBarController: UITabBarController {
    private var hero: [Hero] = []
    private let apiUrl = "https://valorant-api.com/v1/agents?isPlayableCharacter=true"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: apiUrl)
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { valorantHero in
            self.transferData(about: valorantHero.data)
        }
    }
    
    // MARK: - Navigation
    private func transferData(about hero: [Hero]) {
        guard let navigations = viewControllers else { return }
        
        for navigation in navigations {
            guard let navigationVC = navigation as? UINavigationController else { return }

            if let heroListVC = navigationVC.topViewController as? HeroListViewController {
                heroListVC.hero = hero
                heroListVC.tableView.reloadData()
            } else if let heroGalleryVC = navigationVC.topViewController as? HeroGalleryViewController {
                heroGalleryVC.hero = hero
                heroGalleryVC.collectionView.reloadData()
            }
        }
    }

}
