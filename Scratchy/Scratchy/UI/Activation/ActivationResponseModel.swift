//
//  ResponseModel.swift
//  Scratchy
//
//  Created by Marek Polak on 26/03/2024.
//

import Foundation

// MARK: - Welcome
struct ActivationResponseModel: Codable {
    let ios, iosTM, iosRA, iosRA2: String
    let android, androidTM, androidRA: String

    enum CodingKeys: String, CodingKey {
        case ios, iosTM, iosRA
        case iosRA2 = "iosRA_2"
        case android, androidTM, androidRA
    }
}
