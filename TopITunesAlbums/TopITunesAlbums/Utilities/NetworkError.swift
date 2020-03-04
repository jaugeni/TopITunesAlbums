//
//  NetworkError.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/4/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

enum ErrorMessages: String, Error {
    case wentWrong = "Something went wrong"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server."
    case invalidData = "The data received from the server was invalid."
    case invalidLink = "Unable to open Apple Music."
}
