//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 20/12/20.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
