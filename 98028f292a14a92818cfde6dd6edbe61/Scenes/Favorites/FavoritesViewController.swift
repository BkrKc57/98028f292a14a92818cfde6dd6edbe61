//
//  FavoritesViewController.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    static let FAVORITES_LOCAL_KEY: String = "favorites"
    static let TABLEVIEW_CELL_HEIGHT: CGFloat = 120
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var favorites: [Station]! {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var favoriteKeys: [String] {
        return LocalData.get(key: FavoritesViewController.FAVORITES_LOCAL_KEY) ?? []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
        self.fetchFavorites()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchFavorites()
    }
    
    func fetchFavorites() {
        let favoriteStations = ApplicationData.shared.stations?.filter({favoriteKeys.contains($0.name)})
        self.favorites = favoriteStations
    
    }
    
    func tableViewSetup() {
        self.tableView.backgroundColor = .clear
        self.tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    
    
    @objc func changeFavoriteStatusAction(_ sender: UIButton) {
        let index = sender.tag
        let selectedStation = self.favorites[index]
        var newFavoritesKeys: [String] = favoriteKeys
        if self.favoriteKeys.contains(selectedStation.name) {
            // Ekli ise
            let fIndex = newFavoritesKeys.firstIndex(of: selectedStation.name) ?? Int.max
            if fIndex != Int.max {
                newFavoritesKeys.remove(at: fIndex)
            }
        } else {
            newFavoritesKeys.append(selectedStation.name)
        }
        LocalData.set(key: FavoritesViewController.FAVORITES_LOCAL_KEY, value: newFavoritesKeys)
        self.tableView.reloadData()
    }
}

// MARK: --

// MARK: -- UITableView DataSource

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoritesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
        let station: Station = self.favorites[indexPath.row]
        if self.favoriteKeys.contains(station.name) == true {
            cell.favoriteButton.setImage(UIImage(named: "ic_starFill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            cell.favoriteButton.setImage(UIImage(named: "ic_star")?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
        cell.titleLabel.text = station.name
        cell.eusLabel.text = String(station.distanceToWorld()) + "EUS"
        cell.capacityLabel.text = String(station.capacity)
        cell.favoriteButton.addTarget(self, action: #selector(self.changeFavoriteStatusAction), for: .touchUpInside)
        cell.favoriteButton.tag = indexPath.row
        return cell
    }
}

// MARK: --

// MARK: -- UITableView Delegate

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FavoritesViewController.TABLEVIEW_CELL_HEIGHT
    }
}
