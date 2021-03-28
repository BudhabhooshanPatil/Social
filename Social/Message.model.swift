//
//  Message.model.swift
//  Social
//
//  Created by Bhooshan Patil on 28/03/21.
//

import Foundation

// MARK: - Message
struct Message :Encodable {
    let id, messageDescription: String
    let createdAt: Double
    let to, from: String
}
