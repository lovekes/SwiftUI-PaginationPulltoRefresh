//
//  GeoListView.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 23/01/26.
//

import SwiftUI
import SwiftData

struct GeoListView: View {
    @StateObject private var viewModel = GEOPlacesModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(Array(viewModel.geoData.enumerated()), id: \.element.uuID) { index, item in
                        NavigationLink {
                            GeoDetailsView(detailsItem: item, viewModel: viewModel)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(item.name ?? "").font(.headline)
                                Text(item.country ?? "").font(.subheadline)
                            }
                        }
                        .onAppear {
                            // Trigger pagination when user scrolls near the end (last 3 items)
                            let thresholdIndex = viewModel.geoData.count - 1
                            if index >= thresholdIndex && thresholdIndex >= 0 && viewModel.geoData.count >= viewModel.defaultLimit {
                                viewModel.loadMoreIfNeeded()
                            }
                        }
                    }
                    
                    if viewModel.isLoading {
                        HStack {
                            Spacer()
                            ProgressView()
                                .scaleEffect(1.2)
                                .progressViewStyle(.circular)
                            Spacer()
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .refreshable {
                    await viewModel.refreshUsers()
                }
            }
            .navigationTitle("Pagination")
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
