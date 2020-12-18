//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 17/12/20.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
