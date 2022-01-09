//
//  CommentViewModelTests.swift
//  ApiCallSwiftUITests
//
//  Created by Nilesh on 06/01/22.
//

import XCTest
@testable import ApiCallSwiftUI

class CommentViewModelTests: XCTestCase {

    func testComments() {
        let sut = CommentViewModel(commentViewService: MockCommentViewService())
        sut.fetchComments()
        XCTAssert(sut.comments.count == 500)
    }
}
