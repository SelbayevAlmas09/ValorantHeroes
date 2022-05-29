//
//  HeroDetailViewController.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 29.05.2022.
//

import UIKit

class HeroDetailViewController: UIViewController {

    var heroDetail: Hero!
    
    @IBOutlet var roleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roleLabel.text = heroDetail.role.displayName
        nameLabel.text = String.uppercased(heroDetail.displayName)()
        descriptionLabel.text = heroDetail.description
        
        
    }
}
