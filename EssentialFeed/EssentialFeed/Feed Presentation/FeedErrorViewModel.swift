//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 18/12/20.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
