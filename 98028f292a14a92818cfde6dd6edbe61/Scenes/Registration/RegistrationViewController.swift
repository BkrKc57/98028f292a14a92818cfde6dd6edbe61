//
//  RegistrationViewController.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import UIKit

struct Spacecraft: Codable {
    
    static let LOCAL_KEY = "spacecraft"
    
    var name: String = ""
    var durability: Int = 0
    var speed: Int = 0
    var capacity: Int = 0
    var damageCapacity: Int = 100
    
    var total: Int {
        return durability + speed + capacity
    }
    
    func isValid() -> (isValid: Bool, message: String?) {
        if self.name.isEmpty == true {
            return (false, "Uzay aracı ismi boş bırakalamaz.")
        }
        let tempMessage: String = "%@ sıfır olamaz"
        if durability == 0 {
            return (false, String(format: tempMessage, "Dayanıklılık"))
        } else if speed == 0 {
            return (false, String(format: tempMessage, "Hız"))
        } else if capacity == 0 {
            return (false, String(format: tempMessage, "Kapasite"))
        }
        return (true, nil)
    }
}

class RegistrationViewController: UIViewController {
    
    // Statics
    static let INITIAL_AVAILABLE_POINT: Int = 15
    
    
    // MARK: -- UI Items
    @IBOutlet weak var availablePointLabel: UILabel!
    @IBOutlet weak var spacecraftNameTextfield: BaseTextField!
    @IBOutlet weak var continueButtonContainerView: BorderContainerView!
    
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!

    // MARK: -- Variables
    var availablePoint: Int!
    var spacecraft: Spacecraft = Spacecraft()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    func setupUI() {
        // General
        self.availablePoint = RegistrationViewController.INITIAL_AVAILABLE_POINT
        self.availablePointLabel.text = String(self.availablePoint)
        self.availablePointLabel.layer.borderWidth = 2
        self.availablePointLabel.layer.borderColor = UIColor.black.cgColor
        self.spacecraftNameTextfield.setPlaceholder("Spacecraft Name")
        self.continueButtonContainerView.sketchShadow(color: UIColor().customColor.withAlphaComponent(0.2), alpha: 1, x: 0, y: 4, blur: 8)
    }
    
    func refreshAvailablePoint() {
        self.availablePoint = RegistrationViewController.INITIAL_AVAILABLE_POINT - self.spacecraft.total
        self.availablePointLabel.text = String(self.availablePoint)
    }
    
    @IBAction func durabilitySliderAction(_ sender: MySlider) {
        if self.availablePoint == 0 && sender.value > Float(spacecraft.durability) {
            sender.value = Float(self.spacecraft.durability)
            return
        }
        self.spacecraft.durability = sender.steppedValue
        self.durabilityLabel.text = String(self.spacecraft.durability)
        
        self.refreshAvailablePoint()
    }
    
    @IBAction func speedSliderAction(_ sender: MySlider) {
        if self.availablePoint == 0 && sender.value > Float(spacecraft.speed) {
            sender.value = Float(self.spacecraft.speed)
            return
        }
        self.spacecraft.speed = sender.steppedValue
        self.speedLabel.text = String(self.spacecraft.speed)
        
        self.refreshAvailablePoint()
    }
    
    @IBAction func capacitySliderAction(_ sender: MySlider) {
        if self.availablePoint == 0 && sender.value > Float(spacecraft.capacity) {
            sender.value = Float(self.spacecraft.capacity)
            return
        }
        self.spacecraft.capacity = sender.steppedValue
        self.capacityLabel.text = String(self.spacecraft.capacity)
        
        self.refreshAvailablePoint()
    }
    
    func showAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func continueButtonAction(_ sender: BaseButton) {
        #if DEBUG
        self.spacecraft.name = self.spacecraftNameTextfield.text ?? ""
        #endif
        if self.availablePoint > 0 {
            self.showAlert(message: "Kalan \(self.availablePoint!) puanı dağıtmanız gerekiyor.")
            return
        }
        let validation = self.spacecraft.isValid()
        if validation.isValid == false {
            if let message = validation.message {
                self.showAlert(message: message)
            }
            return
        }
        let data = self.spacecraft.toData()
        LocalData.set(key: Spacecraft.LOCAL_KEY, value: data as Any)
        AppRouter.push(from: self, to: TabBarViewController.self)
    }

}

// MARK: --

// MARK: -- UITextField Delegate

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.spacecraft.name = textField.text ?? ""
        textField.resignFirstResponder()
        return true
    }
}
