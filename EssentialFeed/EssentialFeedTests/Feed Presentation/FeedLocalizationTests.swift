//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Ángel Vázquez on 08/12/20.
//

import XCTest
import EssentialFeed

final class FeedLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
