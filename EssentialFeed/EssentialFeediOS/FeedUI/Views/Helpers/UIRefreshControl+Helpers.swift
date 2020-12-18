//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 17/12/20.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
