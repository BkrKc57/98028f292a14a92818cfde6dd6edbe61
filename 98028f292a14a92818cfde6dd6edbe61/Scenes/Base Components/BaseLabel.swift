//
//  BaseLabel.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 5.07.2021.
//

import UIKit

class BaseLabel: UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textColor = UIColor().customColor
    }

}
