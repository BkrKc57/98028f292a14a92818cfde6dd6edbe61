//
//  MySlider.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 2.07.2021.
//

import UIKit

class MySlider: UISlider {

    var step: Float = 1
    var steppedValue: Int {
        let roundedValue = round(self.value / self.step) * self.step
        return Int(roundedValue)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.thumbTintColor = UIColor().customColor
        self.minimumTrackTintColor = UIColor().customColor
    }

}
