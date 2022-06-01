//
//  HeroGalleryViewController.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 01.06.2022.
//

import UIKit

private let reuseIdentifier = "heroCell"

class HeroGalleryViewController: UICollectionViewController {
    var hero: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(hero.count)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return hero.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? HeroViewCell
            else { return UICollectionViewCell()}
        // Configure the cell
        cell.configure(with: hero[indexPath.row])
        return cell
    }
    
    
}
