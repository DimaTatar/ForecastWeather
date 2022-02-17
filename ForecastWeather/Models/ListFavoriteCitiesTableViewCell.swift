//
//  ListFavoriteCitiesTableViewCell.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 16.02.2022.
//

import UIKit
import SnapKit

class ListFavoriteCitiesTableViewCell: UITableViewCell {
    
    static let identifier = "ImageCustomTableViewCell"
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let temperatureLabelMin: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        
        
        temperatureLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return temperatureLabel
    }()
    
    private let temperatureLabelMax: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
      
        
        temperatureLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return temperatureLabel
    }()
    
    private let imageLabel: UIView = {
        let image = UIView()
        
        
        return image
//    private let imageLabel: UIImageView = {
//        let image = UIImageView()
//
//
//        return image
    }()
    
    private func configureСontent() {
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(temperatureLabelMin)
        contentView.addSubview(temperatureLabelMax)
        contentView.addSubview(imageLabel)
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureСontent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cityNameLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(15)
        }
        temperatureLabelMax.snp.makeConstraints { make in
            make.left.equalTo(270)
            make.top.equalTo(15)
            make.width.equalTo(30)
        }
        temperatureLabelMin.snp.makeConstraints { make in
            make.left.equalTo(230)
            make.top.equalTo(15)
        }
        imageLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.right.equalTo(-20)
            make.top.equalTo(15)
        }
    }
    
    func configure(mainModel: MainModel) {
        self.cityNameLabel.text = mainModel.name
        self.temperatureLabelMin.text = mainModel.temperatureMinString
        self.temperatureLabelMax.text = mainModel.temperatureMaxString
       // нужна еще картинка
    }
}
