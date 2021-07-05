//
//  StationCollectionViewCell.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 1.07.2021.
//

import UIKit

class StationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var capacityLabel: BaseLabel!
    @IBOutlet weak var eusLabel: BaseLabel!
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var addFavoriteButton: BaseButton!
    @IBOutlet weak var travelButtonContainerView: BorderContainerView!
    @IBOutlet weak var travelButton: BaseButton!
    @IBOutlet weak var capacityWarningLabel: BaseLabel!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor().customColor.cgColor
        self.contentView.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
}
