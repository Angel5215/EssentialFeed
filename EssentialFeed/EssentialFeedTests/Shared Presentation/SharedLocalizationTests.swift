//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 16/06/21.
//

import EssentialFeed
import XCTest

class SharedLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
}
