//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 19/06/21.
//

import EssentialFeed
import XCTest

final class ImageCommentsLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
