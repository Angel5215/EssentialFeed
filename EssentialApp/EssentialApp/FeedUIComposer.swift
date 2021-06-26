//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 29/11/20.
//

import Combine
import UIKit
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> ListViewController {
        let presentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>(loader: feedLoader)
        
        let feedController = makeFeedViewController(title: FeedPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource
        
        presentationAdapter.presenter = LoadResourcePresenter(
            resourceView: FeedViewAdapter(
                controller: feedController,
                imageLoader: { imageLoader($0).dispatchOnMainQueue() }
            ),
            loadingView: WeakRefVirtualProxy(feedController),
            errorView: WeakRefVirtualProxy(feedController),
            mapper: FeedPresenter.map
        )
        
        return feedController
    }
    
    private static func makeFeedViewController(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = title
        return feedController
    }
}
