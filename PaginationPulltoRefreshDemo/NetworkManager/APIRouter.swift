//
//  APIRouter.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 22/01/26.
//

class APIRouter {
    static let shared = APIRouter()
    private init() {}
    
    private var baseURL: String {
        return "https://geodb-free-service.wirefreethought.com"
    }
    
    func geoPlaces(offset: Int, limit: Int) -> String {
        return baseURL + "/v1/geo/places?offset=\(offset)&limit=\(limit)"
    }
}
