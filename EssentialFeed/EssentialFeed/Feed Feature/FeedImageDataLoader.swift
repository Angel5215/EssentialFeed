//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Ángel Vázquez on 29/11/20.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
