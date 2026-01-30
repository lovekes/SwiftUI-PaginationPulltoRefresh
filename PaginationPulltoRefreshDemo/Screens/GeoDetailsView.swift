//
//  GeoDetailsView.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 23/01/26.
//

import SwiftUI
import MapKit

struct GeoDetailsView: View {
    var detailsItem: GEOPlacesData
    @StateObject var viewModel: GEOPlacesModel

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(detailsItem.name ?? "")
                    .font(.headline)
                Text("Country: \(detailsItem.country ?? "")")
                Text("Type: \(detailsItem.countryCode ?? "")")
                Text("Latitude: \(detailsItem.region ?? "")")
            }
            .padding()
            Map(initialPosition: .region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: detailsItem.latitude ?? 0.0, longitude: detailsItem.longitude ?? 0.0),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            ))) {
                Marker(detailsItem.name ?? "", coordinate: CLLocationCoordinate2D(latitude: detailsItem.latitude ?? 0.0, longitude: detailsItem.longitude ?? 0.0))
            }
        }
        
    }
}
