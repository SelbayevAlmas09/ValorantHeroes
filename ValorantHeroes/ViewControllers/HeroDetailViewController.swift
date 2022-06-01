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
    
    @IBOutlet var abilitySegmentControl: UISegmentedControl!
    @IBOutlet var abilityTextLabel: UILabel!
    
    private let abilityDict = ["Ability1": 1, "Ability2": 2, "Grenade": 3, "Ultimate": 4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        
        
        roleLabel.text = String.uppercased(heroDetail.role.displayName)()
        nameLabel.text = String.uppercased(heroDetail.displayName)()
        //descriptionLabel.text = heroDetail.description
        setUpAbilitySC()
    }
    
    @IBAction func abilitySelectAction() {
        //var labelFrame = descriptionLabel.frame
        
        if abilitySegmentControl.selectedSegmentIndex != 0 {
            descriptionLabel.isHidden = true
            abilityTextLabel.text = heroDetail.abilities[abilitySegmentControl.selectedSegmentIndex-1].description
            
        } else {
            descriptionLabel.text = heroDetail.description
            descriptionLabel.isHidden = false
            abilityTextLabel.text = heroDetail.role.description
            
        }
        
    }
    
    private func setUpAbilitySC() {
        abilitySegmentControl.removeAllSegments()
        
        NetworkManager.shared.fetchImage(from: heroDetail.role.displayIcon) { icon in
            self.abilitySegmentControl.insertSegment(with: UIImage(data: icon), at: 0, animated: true)
            self.abilitySegmentControl.selectedSegmentIndex = 0
            self.abilitySelectAction()
        }
        
        for ability in heroDetail.abilities {
            NetworkManager.shared.fetchImage(from: ability.displayIcon) { icon in
                guard let index = self.abilityDict[ability.slot ?? ""] else { return }
                self.abilitySegmentControl.insertSegment(with: UIImage(data: icon), at: index, animated: true)
            }
        }
        
    }
    
    
}
