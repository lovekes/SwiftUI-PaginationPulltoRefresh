//
//  GEOPlacesModel.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 23/01/26.
//

import Combine
import SwiftUI

final class GEOPlacesModel: ObservableObject {
    @Published var geoData: [GEOPlacesData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var currentOffset = 0
    let defaultLimit = 10
    
    private let apiService: APIServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers(offset: Int = 0, limit: Int = 10) {
        guard let url = URL(string: APIRouter.shared.geoPlaces(offset: offset, limit: limit)) else { return }
        
        isLoading = true
        errorMessage = nil
        
        apiService.request(url)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] (response: GEOPlaces) in
                self?.currentOffset = offset + limit
                self?.geoData.append(contentsOf: response.data ?? [])
            }
            .store(in: &cancellables)
    }
    
    func loadMoreIfNeeded() {
        fetchUsers(offset: currentOffset, limit: defaultLimit)
    }
    
    func refreshUsers() async {
        geoData.removeAll()
        fetchUsers()
    }
}
