//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach { action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
}
