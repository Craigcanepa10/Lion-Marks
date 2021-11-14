//
//  GoogleMapView.swift
//  Lion Marks
//
//  Created by Craig Canepa on 11/10/21.
//

import SwiftUI
import UIKit
import GoogleMaps


struct GoogleMapView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    
    let Vendings = [
            [
                "name": "Fayard",
                "lat": 30.514822,
                "long": -90.466666,
                "Snip": "Snacks (First Floor): Lay’s Chips, Cheetos, Ruffles, Doritos, Ruffles, Cheetos, Fritos, Chester’s Fries, Ritz Chips, Rice Krispie Treats, Grandma’s Cookies, Snickers, Twix, Peanut M&Ms, 3 Musketeers, Reese’s, Hersheys (w/ Peanuts), Nature Valley, Kit Kat, Skittles, Pop Tarts (Strawberry), Oreo Mini"
            ],
            [
                "name": "CSTB",
                "lat": 30.510876,
                "long": -90.464800,
                "Snip": "Snacks (First Floor): Lay’s Potato Chips, Lay’s Dill Pickle Chips, Doritos, Jalapeno Poppers, Zapp’s, Cheetos, Cheetos (Flamin Hot), Fritos (Chili Cheese), Fritos (Honey BBQ), Ritz Chips, Snickers, Twix, Reese’s, Peanut M&Ms, Butterfingers, Hersheys (w/ Peanuts), Skittles, Chips Ahoy, Rice Krispies"
            ],
            [
                "name": "Pennington Center",
                "lat": 30.518397,
                "long": -90.470895,
                "Snip": "Drinks (First Floor): Dasani Water, Powerade Water (Mango), Body Armor \n Snacks(First Floor): Lay’s Baked (Potato), Lay’s Baked (Sour Cream), Cheez-It Snacks, Ritz Chips, Cheetos Baked, Kind Bar, Zoo Animal Crackers, Rice Krispie Treats, Nature Valley"
            ],
            [
                "name": "McClimans",
                "lat": 30.512910,
                "long": -90.466063,
                "Snip": "Drinks (First Floor): Coke, Diet Coke, Sprite, Minute Maid (Watermelon), Dr. Pepper, Diet Dr. Pepper, Monster (White), Dasani Water"
            ],
            [
                "name": "White Hall",
                "lat": 30.510358,
                "long": -90.466128,
                "Snip": "Snacks(Second Floor): Lays Potato Chips, Doritos (Cool Ranch) ,Zapp’s, Cheetos, Fritos (Chili Cheese), Cheez-Its, Ritz,Snickers, Reese’s, Butterfingers, Skittles, Oreo’s Mini,Chips Ahoy, Mike & Ike, Jalapeno Poppers"
            ],
            [
                "name": "Meade Hall",
                "lat": 30.511423,
                "long": -90.466586,
                "Snip": "Snacks(First Floor): Lay’s Chips (Potato), Lay’s Chips (Dill Pickle), Doritos (Cool Ranch), Chester’s Fries, Funyun’s, Ruffles (Cheddar), Cheetos, Fritos (Honey BBQ), Cheez-Its, Ritz Chips,Jalapeno Poppers, Chips Ahoy, Snickers, Twix, Peanut M&Ms, 3 Musketeers, Reese’s, Hershey’s (w/ Peanuts), Skittles, Oreo Mini,Oatmeal Creme Pies, Rice-Krispie Treats"
            ],
            [
                "name": "Mims Hall",
                "lat": 30.511880,
                "long": -90.465868,
                "Snip": "Snacks(First Floor): Lays Potato Chips,Lay’s Dill Pickle Chips, Doritos Cool Ranch, Fritos (Chili Cheese), Ruffles (Cheddar & Sour Cream), Cheetos, Cheez-Its, Chester’s Fries, Cheetos (Flamin Hot), Fritos (Honey BBQ), Oreo Mini, Chips Ahoy, Snickers, Twix, Peanut M&Ms, 3 Musketeers, Reese’s, Nature Valley, Hersheys (w/ Peanuts), Pop Tarts (Strawberry), Oreo Brownie, Rice-Krispie Treats"
            ]
        ]
    let Pao = [
            [
                "name": "Taiwan",
                "lat": 24.360102,
                "long": 121.224064,
                "Snip": "This is Taiwan this is where Pao is from."
            ]
        ]
        
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.selu
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        
        mapView.isMyLocationEnabled = true
        
        do {
              // Set the map style by passing the URL of the local file.
              if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
              } else {
                NSLog("Unable to find style.json")
              }
            } catch {
              NSLog("One or more of the map styles failed to load. \(error)")
            }
        
        return mapView

    }
    

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
        let lionmarker = UIImage(named: "Lion Map Marker")
        let markerView = UIImageView(image: lionmarker)
        
        let pao = UIImage(named: "PaoFace")
        let markerView2 = UIImageView(image: pao)
        
        for Vending in Vendings {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: Vending["lat"] as! CLLocationDegrees, longitude: Vending["long"] as! CLLocationDegrees)
            marker.iconView = markerView
            marker.isTappable = true
            marker.title = Vending["name"] as? String
            marker.snippet = Vending["Snip"] as? String
            marker.map = uiView
        }
        for paos in Pao {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: paos["lat"] as! CLLocationDegrees, longitude: paos["long"] as! CLLocationDegrees)
            marker.iconView = markerView2
            marker.title = paos["name"] as? String
            marker.snippet = paos["Snip"] as? String
            marker.map = uiView
        }
    }
}

//private var pointsOfInterest = [
//    AnnotatedItem(name: "CSTB", coordinate: .init(latitude: 30.510876, longitude: -90.464800)),
//    AnnotatedItem(name: "Fayard", coordinate: .init(latitude: 30.514805, longitude: -90.466663)),
//    AnnotatedItem(name: "Student Union", coordinate: .init(latitude: 30.514320, longitude: -90.467357))
//]

extension GMSCameraPosition  {
    static var selu = GMSCameraPosition.camera(withLatitude: 30.514251, longitude: -90.468015, zoom: 16)
 }

struct GoogleMapView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapView()
    }
}
