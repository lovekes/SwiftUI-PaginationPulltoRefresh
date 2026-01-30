//
//  APIService.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 22/01/26.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error>
}

final class APIService: APIServiceProtocol {

    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
