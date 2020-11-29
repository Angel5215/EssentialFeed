//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 29/11/20.
//

import UIKit
import EssentialFeed

final class FeedRefreshViewController: NSObject {
    
    private let feedLoader: FeedLoader
    var onRefresh: ((_ feed: [FeedImage]) -> Void)?
    
    private(set) lazy var view: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }()
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    @objc func refresh() {
        view.beginRefreshing()
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onRefresh?(feed)
            }
            self?.view.endRefreshing()
        }
    }
}
