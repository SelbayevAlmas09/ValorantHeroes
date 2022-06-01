//
//  HeroViewCell.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 01.06.2022.
//

import UIKit

class HeroViewCell: UICollectionViewCell {
    @IBOutlet var heroImageView: UIImageView!
    @IBOutlet var heroNameLabel: UILabel!
    
    func configure(with hero: Hero) {
        heroNameLabel.text = hero.displayName
        NetworkManager.shared.fetchImage(from: hero.fullPortraitV2) { image in
            self.heroImageView.image = UIImage(data: image)
        }
    }
}
