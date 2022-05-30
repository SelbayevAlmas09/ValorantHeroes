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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roleLabel.text = heroDetail.role.displayName
        nameLabel.text = String.uppercased(heroDetail.displayName)()
        descriptionLabel.text = heroDetail.description
        setUpAbilitySC()
    }
    
    @IBAction func abilitySelectAction() {
        if abilitySegmentControl.selectedSegmentIndex != 0 {
            abilityTextLabel.text = heroDetail.abilities[abilitySegmentControl.selectedSegmentIndex-1].description
        } else {
            abilityTextLabel.text = heroDetail.role.description
        }
        
    }
    
    private func setUpAbilitySC() {
        var count = 1
        
        abilitySegmentControl.removeAllSegments()
        
        NetworkManager.shared.fetchImage(from: heroDetail.role.displayIcon) { icon in
            self.abilitySegmentControl.insertSegment(with: UIImage(data: icon), at: 0, animated: true)
            self.abilitySegmentControl.selectedSegmentIndex = 0
            self.abilitySelectAction()
        }
        
        for ability in heroDetail.abilities {
            NetworkManager.shared.fetchImage(from: ability.displayIcon) { icon in
                self.abilitySegmentControl.insertSegment(with: UIImage(data: icon), at: count, animated: true)
                
                //self.abilitySegmentControl.frame.size.width = 200
                //self.abilitySegmentControl.frame.size.height = 200
                
                count += 1
            }
        }
    }
    
    
}
