//
//  HoursCollectionViewCell.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 07.02.2022.
//

import UIKit
import SnapKit

struct HoursCollectionViewCellViewModel {
    let hoursLabel: String
    let imageLabel: String
    let temperatureLabel: String
}

class HoursCollectionViewCell: UICollectionViewCell {
    
   
    
    static let identifier = "HoursCollectionViewCell"
    
    private let hoursLabel: UILabel = {
        let hoursLabel = UILabel()
        hoursLabel.textColor = .systemGray2
        hoursLabel.font = .systemFont(ofSize: 15, weight: .medium)
        return hoursLabel
    }()
    
    private let imageLabel: UILabel = {
        let imageLabel = UILabel()
        imageLabel.textColor = .systemGray2

        imageLabel.font = .systemFont(ofSize: 17, weight: .medium)
        return imageLabel
    }()
    
    private let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        temperatureLabel.font = .systemFont(ofSize: 15, weight: .bold)
        return temperatureLabel
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(hoursLabel)
        contentView.addSubview(imageLabel)
        contentView.addSubview(temperatureLabel)
        contentView.layer.cornerRadius = 15
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        hoursLabel.frame = contentView.bounds
        hoursLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(17)
        }
        imageLabel.frame = contentView.bounds
        imageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        temperatureLabel.frame = contentView.bounds
        temperatureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(24)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: HoursCollectionViewCellViewModel) {
        hoursLabel.text = viewModel.hoursLabel
        imageLabel.text = viewModel.imageLabel
        temperatureLabel.text = viewModel.temperatureLabel
    }
    
}
