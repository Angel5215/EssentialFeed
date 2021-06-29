//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Ángel Vázquez on 30/12/20.
//

import EssentialFeed
import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://a-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
}

private class DummyView: ResourceView {
    func display(_ viewModel: Any) {}
}

var feedTitle: String {
    FeedPresenter.title
}

var loadError: String {
    LoadResourcePresenter<Any, DummyView>.loadError
}

var commentsTitle: String {
    ImageCommentsPresenter.title
}
