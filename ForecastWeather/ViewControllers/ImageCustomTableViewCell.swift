//
//  ImageCustomTableViewCell.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 08.02.2022.
//

import UIKit

//struct ImageCustomTableViewCellViewModel {
//    let imageLabel: String
//    let temperatureLabel: String
//    let discription: String
//}

class ImageCustomTableViewCell: UITableViewCell {
   
    static let identifier = "ImageCustomTableViewCell"

    private let dayWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Пятница"

        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    private let temperatureLabelMin: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        temperatureLabel.text = "+17"

        temperatureLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return temperatureLabel
    }()
    
    private let temperatureLabelMax: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        temperatureLabel.text = "+23"

        temperatureLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return temperatureLabel
    }()

    private let imageLabel: UILabel = {
        let image = UILabel()
        image.textColor = .black
        image.text = "ясно"
        return image
    }()
    
    private func configureСontent() {
        contentView.addSubview(dayWeekLabel)
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
        
        dayWeekLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(15)
        }
        temperatureLabelMin.snp.makeConstraints { make in
            make.left.equalTo(230)
            make.top.equalTo(15)
        }
        temperatureLabelMax.snp.makeConstraints { make in
            make.left.equalTo(270)
            make.top.equalTo(15)
        }
        imageLabel.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.top.equalTo(15)
        }
//        dayWeekLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().inset(15)
//            make.top.equalToSuperview().inset(15)
//        }
//        temperatureLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//        }
//        imageLabel.snp.makeConstraints { make in
//            make.right.equalToSuperview().inset(15)
//            make.top.equalToSuperview().inset(15)
//        }
//
    }

//
//    func configure(with newViewModel: ImageCustomTableViewCellViewModel) {
//        dayWeekLabel.text = newViewModel.imageLabel
//        temperatureLabel.text = newViewModel.temperatureLabel
//        imageLabel.text = newViewModel.discription
//
//    }
    
   
    
    
    
    
   

    

    
}
