//
//  FeedEndpointTests.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 03/07/21.
//

import EssentialFeed
import XCTest

class FeedEndpointTests: XCTestCase {
    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")
        
        XCTAssertEqual(received, expected)
    }
}
