//
//  MainViewController.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import UIKit
import DropDown

class DashboardViewController: UIViewController {
    
    static let INITIAL_STATION_NAME = "Dünya"
    
    @IBOutlet weak var ugsLabel: BaseLabel!
    @IBOutlet weak var eusLabel: BaseLabel!
    @IBOutlet weak var dsLabel: BaseLabel!
    @IBOutlet weak var spacecraftNameLabel: BaseLabel!
    @IBOutlet weak var damageCapacityLabel: BaseLabel!
    @IBOutlet weak var durationLabel: BaseLabel!
    @IBOutlet weak var searchTextField: BaseTextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: BaseLabel!
    
    @IBOutlet weak var stationsForwardButton: BaseButton!
    @IBOutlet weak var stationsBackButton: BaseButton!
    
    
    var stations: [Station]! {
        didSet {
            self.currentStation = self.stations.filter({$0.name == DashboardViewController.INITIAL_STATION_NAME}).first
            self.collectionView.reloadData()
        }
    }
    
    var spacecraft: Spacecraft! {
        didSet {
            self.spacecraftNameLabel.text = spacecraft.name
            self.damageCapacityLabel.text = String(spacecraft.damageCapacity)
        }
    }
    
    var currentStation: Station! {
        didSet {
            self.titleLabel.text = self.currentStation.name
            self.collectionView.reloadData()
        }
    }
    
    var timer: CADisplayLink?
    var timerCycle: Int = 0
    var damageInterval: Int!
    // task values
    var ugs: Int = 0
    var eus: Int = 0
    var ds: Int = 0
    
    
    var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.collectionViewSetup()
        self.stations = ApplicationData.shared.stations
        self.setupDropDown()
        self.getSpacecraftData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }

    
    func refreshTaskValues() {
        self.ugsLabel.text = String(self.ugs)
        self.eusLabel.text = String(self.eus)
        self.dsLabel.text = String(self.ds)
    }
    
    func getSpacecraftData() {
        if let spacecraftData: Data = LocalData.get(key: Spacecraft.LOCAL_KEY) {
            if let sCraft: Spacecraft = Spacecraft.parse(jsonData: spacecraftData) {
                self.spacecraft = sCraft
                ugs = spacecraft.capacity * 10000
                eus = spacecraft.speed * 20
                ds = spacecraft.durability * 10000
                self.damageInterval = ds / 1000
                self.durationLabel.text = String(format: "%ds", self.damageInterval)
                self.refreshTaskValues()
            }
        }
    }
    
    func setupUI() {
        self.searchTextField.setPlaceholder("search")
        self.searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.stationsBackButton.setImage(UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.stationsForwardButton.setImage(UIImage(named: "ic_forward")?.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    func setupDropDown() {
        self.dropDown.anchorView = self.searchTextField
        self.dropDown.direction = .bottom
        self.dropDown.bottomOffset = CGPoint(x: 0, y: self.searchTextField.bounds.height)
        self.dropDown.dataSource = self.stations.compactMap({$0.name})
        self.dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            self.dropDown.hide()
            self.searchTextField.text = item
            let index = self.stations.firstIndex(where: {$0.name == item}) ?? Int.max
            if index != Int.max {
                self.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    @objc func showDropDown(items: [String]) {
        self.dropDown.dataSource = items
        self.dropDown.show()
    }
    
    
    func collectionViewSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.isScrollEnabled = false
    }
    
    func getVisibleCollectionCellIndexpath() -> IndexPath {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) ?? IndexPath(row: 0, section: 0)
        return visibleIndexPath
    }
    
    
    @IBAction func stationsBackButtonAction(_ sender: UIButton) {
        var indexPath = self.getVisibleCollectionCellIndexpath()
        if indexPath.row != 0 {
            indexPath.row -= 1
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func stationsForwardButtonAction(_ sender: UIButton) {
        var indexPath = self.getVisibleCollectionCellIndexpath()
        if indexPath.row != self.stations.count - 1 {
            indexPath.row += 1
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    @objc func addFavoriteStationButtonAction(_ sender: UIButton) {
        let index = sender.tag
        let selectedStation = self.stations[index]
        var favoriteKeys: [String] = LocalData.get(key: FavoritesViewController.FAVORITES_LOCAL_KEY) ?? []
        if favoriteKeys.contains(selectedStation.name) {
            // Ekli ise
            let favoriteIndex = favoriteKeys.firstIndex(of: selectedStation.name) ?? Int.max
            if favoriteIndex != Int.max {
                favoriteKeys.remove(at: favoriteIndex)
            }
        } else {
            favoriteKeys.append(selectedStation.name)
        }
        LocalData.set(key: FavoritesViewController.FAVORITES_LOCAL_KEY, value: favoriteKeys)
        self.collectionView.reloadData()
    }
    
    
    @objc func travelStationButtonAction(_ sender: UIButton) {
        let index = sender.tag
        var station = self.stations[index]
        let distance = station.distanceTo(point: self.currentStation.getCoordinate())
        if self.eus >= distance {
            self.eus -= distance
        } else {
            self.showAlert(message: "yeterli EUS bulunmuyor.")
            return
        }
        if station.stock != station.capacity {
            if self.ugs >= station.need {
                self.ugs -= station.need
                station.stock += station.need
            } else {
                station.stock += self.ugs
                self.ugs = 0
                self.showAlert(message: "UGS bitti Dünyaya dönmelisin..")
            }
            self.stations[index] = station
        }
        self.refreshTaskValues()
        self.currentStation = station
        
        if self.currentStation.name != DashboardViewController.INITIAL_STATION_NAME && self.timer == nil {
            self.startTimer()
        } else if self.currentStation.name == DashboardViewController.INITIAL_STATION_NAME {
            self.stopTimer()
        }
    }
    
    func showAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: --

// MARK: -- UICollectionView DataSource

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: StationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationCollectionViewCell", for: indexPath) as! StationCollectionViewCell
        let station = self.stations[indexPath.row]
        let favoriteKeys: [String] = LocalData.get(key: FavoritesViewController.FAVORITES_LOCAL_KEY) ?? []
        cell.addFavoriteButton.setImage(UIImage(named: favoriteKeys.contains(station.name) == true ? "ic_starFill" : "ic_star" )?.withRenderingMode(.alwaysTemplate), for: .normal)
        let capacity = station.capacity ?? 0
        let stock = station.stock ?? 0
        cell.capacityLabel.text = "\(capacity)/\(stock)"
        cell.eusLabel.text = "\(station.distanceTo(point: self.currentStation.getCoordinate()))EUS"
        cell.titleLabel.text = station.name
        cell.addFavoriteButton.addTarget(self, action: #selector(self.addFavoriteStationButtonAction(_:)), for: .touchUpInside)
        cell.addFavoriteButton.tag = indexPath.row
        cell.travelButton.addTarget(self, action: #selector(self.travelStationButtonAction(_:)), for: .touchUpInside)
        cell.travelButton.tag = indexPath.row
        cell.travelButtonContainerView.isHidden = (self.currentStation.name == station.name && (station.capacity == station.stock || self.ugs == 0 ))
        return cell
    }
    
}

// MARK: --

// MARK: -- UICollectionView Delegate

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}

// MARK: --

// MARK: -- UITextField Delegate

extension DashboardViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dropDown.hide()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        self.dropDown.show()
       
        return true
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
        self.dropDown.hide()
        let text = sender.text ?? ""
        let filtered = self.stations.filter({$0.name.lowercased().contains(text.lowercased())}).compactMap({$0.name})
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(self.showDropDown(items:)), with: filtered, afterDelay: 0.8)
    }
}

// MARK: --

// MARK: -- Timer

extension DashboardViewController {
    func startTimer() {
        self.stopTimer()
        self.timer = CADisplayLink(target: self, selector: #selector(timerAction))
        self.timer?.preferredFramesPerSecond = 1
        self.timer?.add(to: .current, forMode: .common)
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.durationLabel.text = String(format: "%ds", self.damageInterval)
        self.timerCycle = 0
    }
    
    @objc func timerAction() {
        self.timerCycle += 1
        self.durationLabel.text = String(format: "%ds", self.damageInterval - self.timerCycle)
        if self.timerCycle == self.damageInterval {
            self.timerCycle = 0
            self.spacecraft.damageCapacity -= 10
            if self.spacecraft.damageCapacity <= 0 {
                self.stopTimer()
                self.showAlert(message: "Güç kalkanları devre dışı. :)")
            }
            self.damageCapacityLabel.text = String(self.spacecraft.damageCapacity)
        }
    }
}
