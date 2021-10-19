//
//  ContentView.swift
//  Lion Marks
//
//  Created by Craig Canepa on 10/19/21.
//

import SwiftUI
import MapKit


struct ContentView : View {
    var pointAnnotation:CustomPointAnnotation!
    @State private var showsAlert = false
    @State private var viewModel = ContentViewModel()
    @State private var butty = alertstuff()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 30.514251,
                longitude: -90.468015
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
//print("codey code commit test")
    
    private var pointsOfInterest = [
        AnnotatedItem(name: "CSTB", coordinate: .init(latitude: 30.510876, longitude: -90.464800)),
        AnnotatedItem(name: "Fayard", coordinate: .init(latitude: 30.514805, longitude: -90.466663)),
        AnnotatedItem(name: "Student Union", coordinate: .init(latitude: 30.514320, longitude: -90.467357))
    ]
        var body: some View {
            Map(
                coordinateRegion: $region,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: pointsOfInterest
            ){ item in
                MapMarker(coordinate: item.coordinate)
            }
                .ignoresSafeArea()
                .onAppear{
                    viewModel.checklocserv()
                    
                }
        }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
