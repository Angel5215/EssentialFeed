//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
