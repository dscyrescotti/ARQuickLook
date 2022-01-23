//
//  GalleryCell.swift
//  ARQuickLook
//
//  Created by Aye Chan on 1/23/22.
//

import UIKit

class GalleryCell: UITableViewCell {
    private let galleryImageView = UIImageView()
    private let galleryLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = .init(width: 0, height: 3)
        view.layer.shadowOpacity = 0.3
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.addArrangedSubview(galleryImageView)
        stack.addArrangedSubview(galleryLabel)
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        galleryImageView.snp.makeConstraints { make in
            make.width.height.equalTo(stack.snp.width).inset(20)
        }
        galleryImageView.contentMode = .scaleAspectFit
        
        galleryLabel.numberOfLines = 0
        galleryLabel.font = .preferredFont(forTextStyle: .title3)
        galleryLabel.textAlignment = .center
    }
    
    func configure(_ viewModel: GalleryViewModel) {
        self.galleryImageView.image = UIImage(named: viewModel.fileName)
        self.galleryLabel.text = viewModel.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.galleryImageView.image = nil
        self.galleryLabel.text = nil
    }
}
