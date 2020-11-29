//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
