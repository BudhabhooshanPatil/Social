//
//  User.model.swift
//  Social
//
//  Created by Bhooshan Patil on 28/03/21.
//

import Foundation

// MARK: - User
struct User:Encodable{
    let address: Address
    let company: Company
    let userMeta: UserMeta
}

// MARK: - Address
struct Address:Encodable {
    let city: String
    let geo: Geo
    let street, suite, zipcode: String
}
struct UserMeta:Encodable {
    let email: String
    let id: String
    let name, phone, username, website: String
}
// MARK: - Geo
struct Geo:Encodable {
    let lat, lng: String
}

// MARK: - Company
struct Company:Encodable {
    let bs, catchPhrase, name: String
}
