//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 20/12/20.
//

import EssentialFeed
import XCTest

protocol FeedImageView {
    associatedtype Image
    func display(_ model: FeedImageViewModel<Image>)
}

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}

final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image {
    
    private let view: View
    private let imageTransformer: (Data) -> Image?
    
    init(view: View, imageTransformer: @escaping (Data) -> Image?) {
        self.view = view
        self.imageTransformer = imageTransformer
    }
    
    func didStartLoadingImageData(for model: FeedImage) {
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: nil,
                isLoading: true,
                shouldRetry: false)
        )
    }
    
    func didFinishLoadingImageData(with data: Data, for model: FeedImage) {
        guard let image = imageTransformer(data) else {
            return
        }
        
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: image,
                isLoading: false,
                shouldRetry: false
            )
        )
    }
}

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
