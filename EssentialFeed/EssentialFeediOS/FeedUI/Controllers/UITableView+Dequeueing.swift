//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 06/12/20.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
