//
//  CreateCommentReport.swift
//  Mlem
//
//  Created by Jake Shirley on 7/1/23.
//

import Foundation

struct CreateCommentReportRequest: APIPostRequest {

    typealias Response = CreateCommentReportResponse

    let instanceURL: URL
    let path = "comment/report"
    let body: Body

    // lemmy_api_common::post::CreatePostReport
    struct Body: Encodable {
        let auth: String
        let comment_id: Int
        let reason: String
    }

    init(
        account: SavedAccount,
        commentId: Int,
        reason: String
    ) {
        self.instanceURL = account.instanceLink
        self.body = .init(auth: account.accessToken, comment_id: commentId, reason: reason)
    }
}

// lemmy_api_common::comment::CreateCommentReportRequest
struct CreateCommentReportResponse: Decodable {
    let commentReportView: APICommentReportView
}
