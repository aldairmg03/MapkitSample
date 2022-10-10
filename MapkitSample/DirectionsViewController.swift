//
//  DirectionsViewController.swift
//  MapkitSample
//
//  Created by Aldair Martinez on 10/10/22.
//

import UIKit

class DirectionsViewController: UIViewController {

    private var directions: [String] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DirectionsCell.self, forCellWithReuseIdentifier: DirectionsCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setData(directions: [String]) {
        self.directions = directions
        collectionView.reloadData()
    }

}

private extension DirectionsViewController {
    
    func setup() {
        title = "Directions"
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(collectionView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}

extension DirectionsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return directions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DirectionsCell.identifier, for: indexPath) as? DirectionsCell else {
            return UICollectionViewCell()
        }
        cell.configure(text: directions[indexPath.row])
        return cell
    }

    
}

extension DirectionsViewController: UICollectionViewDelegate {
    
}
