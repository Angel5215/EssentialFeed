//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 20/12/20.
//

import EssentialFeed
import XCTest

class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    func test_didStartLoadingImageData_displaysNoImageNoRetryStartsLoadingAndShowsCorrectData() {
        let image = uniqueImage()
        let (sut, view) = makeSUT()
        
        sut.didStartLoadingImageData(for: image)
        
        XCTAssertEqual(view.messages, [.display(description: image.description, location: image.location, image: nil, isLoading: true, shouldRetry: false)])
    }
    
    func test_didFinishLoadingImageData_displaysImageNoRetryStopsLoadingAndShowsCorrectData() {
        let model = uniqueImage()
        let data = Data("image data".utf8)
        let image = successfulImageTransformer(data: data)
        let (sut, view) = makeSUT(imageTransformer: successfulImageTransformer)
        
        sut.didFinishLoadingImageData(with: data, for: model)
        
        XCTAssertEqual(view.messages, [.display(description: model.description, location: model.location, image: image, isLoading: false, shouldRetry: false)])
    }
    
    func test_didFinishLoadingImageData_displaysNoImageAllowsRetryStopsLoadingAndShowsCorrectDataWhenFailingToTransformImage() {
        let model = uniqueImage()
        let data = Data("image data".utf8)
        let (sut, view) = makeSUT(imageTransformer: failureImageTransformer)
        
        sut.didFinishLoadingImageData(with: data, for: model)
        
        XCTAssertEqual(view.messages, [.display(description: model.description, location: model.location, image: nil, isLoading: false, shouldRetry: true)])
    }
    
    func test_didFinishLoadingImageDataWithError_displaysNoImageAllowsRetryStopsLoadingAndShowsCorrectData() {
        let model = uniqueImage()
        let (sut, view) = makeSUT()
        
        sut.didFinishLoadingImageData(with: anyNSError(), for: model)
        
        XCTAssertEqual(view.messages, [.display(description: model.description, location: model.location, image: nil, isLoading: false, shouldRetry: true)])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(imageTransformer: @escaping (Data) -> Image? = { _ in Image(data: Data()) }, file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImagePresenter<ViewSpy<Image>, Image>, view: ViewSpy<Image>) {
        let view = ViewSpy<Image>()
        let sut = FeedImagePresenter<ViewSpy<Image>, Image>(view: view, imageTransformer: imageTransformer)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private func successfulImageTransformer(data: Data) -> Image? {
        return Image(data: data)
    }
    
    private func failureImageTransformer(data: Data) -> Image? {
        return nil
    }
    
    private class ViewSpy<Image: Equatable>: FeedImageView {
        enum Message: Equatable {
            case display(description: String?, location: String?, image: Image?, isLoading: Bool, shouldRetry: Bool)
        }
        private(set) var messages = [Message]()
        
        func display(_ model: FeedImageViewModel<Image>) {
            messages.append(.display(description: model.description, location: model.location, image: model.image, isLoading: model.isLoading, shouldRetry: model.shouldRetry))
        }
    }
    
    private struct Image: Equatable {
        let data: Data
    }
}
