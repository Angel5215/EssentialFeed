//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 20/12/20.
//

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(description: image.description, location: image.location)
    }
}
