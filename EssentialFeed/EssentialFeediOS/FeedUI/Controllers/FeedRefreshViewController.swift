//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private let viewModel: FeedViewModel
    private(set) lazy var view: UIRefreshControl = binded(UIRefreshControl())
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { [weak self] viewModel in
            if viewModel.isLoading {
                self?.view.beginRefreshing()
            } else {
                self?.view.endRefreshing()
            }
        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
