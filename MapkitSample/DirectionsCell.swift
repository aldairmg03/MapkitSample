//
//  DirectionsCell.swift
//  MapkitSample
//
//  Created by Aldair Martinez on 10/10/22.
//

import UIKit

class DirectionsCell: UICollectionViewCell {
    
    static let identifier = "DirectionsCell"
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        label.text = text
    }
    
}

private extension DirectionsCell {
    func setup() {
        contentView.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    func addViews() {
        addSubview(label)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
    }
}
