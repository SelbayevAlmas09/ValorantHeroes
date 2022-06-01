//
//  HeroListViewController.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 28.05.2022.
//

import UIKit

class HeroListViewController: UITableViewController {
    var hero: [Hero]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.rowHeight = 60
        //fetchData(from: "https://valorant-api.com/v1/agents?isPlayableCharacter=true")//dade69b4-4f5a-8528-247b-219e5a1facd6
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hero?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = hero?[indexPath.row].displayName
        content.secondaryText = hero?[indexPath.row].role.displayName
        
        NetworkManager.shared.fetchHeroIcon(from: hero?[indexPath.row].displayIcon) { heroIcon in
            content.image = heroIcon
            cell.contentConfiguration = content
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroDetail = hero?[indexPath.row]
        performSegue(withIdentifier: "showHeroDetail", sender: heroDetail)
    }

    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { valorantHero in
            self.hero = valorantHero.data
            self.tableView.reloadData()
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let heroDetailVC = segue.destination as? HeroDetailViewController else { return }
        heroDetailVC.heroDetail = sender as? Hero
    }
    

}
