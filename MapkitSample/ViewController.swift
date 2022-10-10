//
//  ViewController.swift
//  MapkitSample
//
//  Created by Aldair Martinez on 10/10/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    lazy var showDirectionsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show directions", for: .normal)
        button.addTarget(self, action: #selector(showDirections), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @objc private func showDirections() {
        
    }

}

private extension ViewController {
    
    func setup() {
        mapView.delegate = self
        addViews()
        setConstraints()
        initMapView()
    }
    
    func addViews() {
        view.addSubview(mapView)
        view.addSubview(showDirectionsButton)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: showDirectionsButton.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            showDirectionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            showDirectionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            showDirectionsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func initMapView() {
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.71, longitude: -74),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        
        let placemarkNY = MKPlacemark(
            coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
        let placemarkBoston = MKPlacemark(
            coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: placemarkNY)
        request.destination = MKMapItem(placemark: placemarkBoston)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { [weak self] response, error in
            guard let route = response?.routes.first else { return }
            self?.mapView.addAnnotations([placemarkNY, placemarkBoston])
            self?.mapView.addOverlay(route.polyline)
            self?.mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
        }
        
    }
    
}

extension ViewController: MKMapViewDelegate {
    
}

