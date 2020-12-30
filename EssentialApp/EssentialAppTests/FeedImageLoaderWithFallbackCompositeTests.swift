//
//  FeedImageLoaderWithFallbackCompositeTests.swift
//  EssentialAppTests
//
//  Created by Ángel Vázquez on 30/12/20.
//

import EssentialFeed
import XCTest

final class FeedImageLoaderWithFallbackComposite: FeedImageDataLoader {
    
    private class Task: FeedImageDataLoaderTask {
        func cancel() {
            
        }
    }
    
    init(primary: FeedImageDataLoader, fallback: FeedImageDataLoader) {
        
    }
    
    func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return Task()
    }
}

class FeedImageLoaderWithFallbackCompositeTests: XCTestCase {
    func test_loadImageData_deliversPrimaryImageDataOnPrimaryLoaderSuccess() {
        let primaryLoader = LoaderSpy()
        let fallbackLoader = LoaderSpy()
        
        _ = FeedImageLoaderWithFallbackComposite(primary: primaryLoader, fallback: fallbackLoader)
        
        XCTAssertTrue(primaryLoader.loadedURLs.isEmpty, "Expected no loaded URLs in the primary loader")
        XCTAssertTrue(fallbackLoader.loadedURLs.isEmpty, "Expected no loaded URLs in the fallback loader")
    }
    
    // MARK: - Helpers
    
    private class LoaderSpy: FeedImageDataLoader {
        
        private var messages = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
        
        var loadedURLs: [URL] { messages.map(\.url) }
        
        private class Task: FeedImageDataLoaderTask {
            func cancel() {
                
            }
        }
        
        func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
            
            return Task()
        }
    }
}
