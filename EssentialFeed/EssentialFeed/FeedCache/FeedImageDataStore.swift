//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 26/12/20.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
