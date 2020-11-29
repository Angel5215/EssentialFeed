//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach { action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
}
