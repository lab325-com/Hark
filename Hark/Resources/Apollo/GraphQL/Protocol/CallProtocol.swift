//
//  CallProtocol.swift
//  Hark
//
//  Created by Andrey S on 27.01.2022.
//

import Foundation

protocol CallProtocol {
    var talkId: String { get }
    var uid: UInt { get }
    var channelName: String { get }
    var token: String { get }
}
