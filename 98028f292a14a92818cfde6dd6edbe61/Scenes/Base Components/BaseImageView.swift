//
//  BaseImageView.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 5.07.2021.
//

import UIKit

class BaseImageView: UIImageView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tintColor = UIColor().customColor
    }

}
