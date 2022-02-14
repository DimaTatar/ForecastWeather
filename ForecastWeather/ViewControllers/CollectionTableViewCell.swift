//
//  CollectionTableViewCell.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 07.02.2022.
//

import UIKit

struct CollectionTableViewCellViewModel {
    let viewModels: [HoursCollectionViewCellViewModel]
}


class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModels: [HoursCollectionViewCellViewModel] = []
    
   
    
    static var identifier = "CollectionTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 30)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(HoursCollectionViewCell.self, forCellWithReuseIdentifier: HoursCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoursCollectionViewCell.identifier, for: indexPath) as? HoursCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func configure(with viewModel: CollectionTableViewCellViewModel) {
        self.viewModels = viewModel.viewModels
        collectionView.reloadData()
    }
      
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widht: CGFloat = contentView.frame.size.width / 5
        return CGSize(width: widht, height: 150)
    }

}
