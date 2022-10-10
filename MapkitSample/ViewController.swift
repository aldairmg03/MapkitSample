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
    
}

extension ViewController: MKMapViewDelegate {
    
}

