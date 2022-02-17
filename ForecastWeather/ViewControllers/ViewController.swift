//
//  ViewController.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 07.02.2022.
//

import UIKit
import SnapKit
import CoreLocation

//struct NewImageCustomTableViewCellViewModel {
//    let newViewModels: [ImageCustomTableViewCellViewModel]
//}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    let networkManager = NetworkManager()
    let locationManager = CLLocationManager()
    
//    var newViewModels: [ImageCustomTableViewCellViewModel] = []
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
//        table.register(ImageCustomTableViewCell.self, forCellReuseIdentifier: ImageCustomTableViewCell.identifier)
        return table
    }()
    
//    private let newModels: [NewImageCustomTableViewCellViewModel] = [
//    NewImageCustomTableViewCellViewModel(newViewModels:[
//
//        ImageCustomTableViewCellViewModel(dayWeekLabel: "Понедельник",
//                                          temperatureLabelMin: "+13",
//                                          temperatureLabelMax: "+16",
//                                          imageLabel: "Ясно"),
//        ImageCustomTableViewCellViewModel(dayWeekLabel: "Понедельник",
//                                          temperatureLabelMin: "+13",
//                                          temperatureLabelMax: "+16",
//                                          imageLabel: "Ясно"),
//        ImageCustomTableViewCellViewModel(dayWeekLabel: "Понедельник",
//                                          temperatureLabelMin: "+13",
//                                          temperatureLabelMax: "+16",
//                                          imageLabel: "Ясно"),
//        ImageCustomTableViewCellViewModel(dayWeekLabel: "Понедельник",
//                                          temperatureLabelMin: "+13",
//                                          temperatureLabelMax: "+16",
//                                          imageLabel: "Ясно")
//    ])
//
//    ]

 
    
    private let viewModels: [CollectionTableViewCellViewModel] = [

        CollectionTableViewCellViewModel(
            viewModels: [

                HoursCollectionViewCellViewModel(
                    hoursLabel: "12:00",
                    imageLabel: "ясно",
                    temperatureLabel: "+25"),
                HoursCollectionViewCellViewModel(
                    hoursLabel: "13:00",
                    imageLabel: "ясно",
                    temperatureLabel: "+21"),
                HoursCollectionViewCellViewModel(
                    hoursLabel: "14:00",
                    imageLabel: "ясно",
                    temperatureLabel: "+24"),
                HoursCollectionViewCellViewModel(
                    hoursLabel: "15:00",
                    imageLabel: "ясно",
                    temperatureLabel: "+23"),
                HoursCollectionViewCellViewModel(
                    hoursLabel: "16:00",
                    imageLabel: "ясно",
                    temperatureLabel: "+23")
            ]
        )

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        setupNC()
//        setupButton()
        tableView.tableHeaderView = setupImage()
        
        startLocationManager()
        
//        fetchWeather()
       
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
//    func fetchWeather() {
//
//        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.75&lon=37.61&limit=4&hours=true"
//        guard let url = URL(string: urlString) else {return}
//
//        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//        request.addValue("545e10ba-7c79-4246-b71c-d49188438c87", forHTTPHeaderField: "X-Yandex-API-Key")
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                return
//            }
//            print(String(data:data, encoding: .utf8)!)
//
//        }
//        task.resume()
//    }
    
//    func fetchWeather() {
//        let urlString = "https://api.weather.yandex.ru/v2/informers?lat=59.93602&lon=30.347810&limit=4&hours=true"
//        guard let url = URL(string: urlString) else {return}
//
//        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//        request.addValue("545e10ba-7c79-4246-b71c-d49188438c87", forHTTPHeaderField: "X-Yandex-API-Key")
//        request.httpMethod = "Get"
//
//
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                return
//            }
//            print(String(data: data, encoding: .utf8)!)
//
//        }
//        task.resume()
//
//    }
    
    
    
    
    //MARK: -Table ViewDataSourse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
        let viewModel = viewModels[indexPath.row] // если обратно менять то секция
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
//        let newViewModel = newViewModels[indexPath.r]
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCustomTableViewCell.identifier, for: indexPath) as? ImageCustomTableViewCell else {
//            fatalError()
//        }
//        cell.configure(with: newViewModel)
        
        cell.configure(with:viewModel)
    
        return cell
        
//       guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCustomTableViewCell.identifier, for: indexPath) as? ImageCustomTableViewCell else {
//            return UITableViewCell()
//       }
//        cell.configure(with: newViewModels[indexPath.section])
//        return cell
    }
    
//    func configure(with viewModel: NewImageCustomTableViewCellViewModel) {
//        self.newViewModels = viewModel.newViewModels
//        tableView.reloadData()
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        newViewModels[section].imageLabel
//
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width/2
        
    }
    

    func startLocationManager() {
        
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    
    
    private func setupNC() {
        title = "City"
        navigationItem.rightBarButtonItem  = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(addNewCity))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "location.circle"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(viewLocation))
        
    }
    
//    private func setupButton() {
//        let button = UIButton(type: .system)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue
//        button.setTitle("Добавить город", for: .normal)
//        button.layer.cornerRadius = 20
//        view.addSubview(button)
//
//        button.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalTo(170)
//            make.height.equalTo(40)
//            make.bottom.equalToSuperview().inset(30)
//        }
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//    }
    
//    private func showAlert(with title: String, and message: String) {
//
//
//        var textFieldBtn: UIButton {
//            let button = UIButton(type: .custom)
//            button.setImage(UIImage(systemName: "delete.left"), for: .normal)
//            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//            return button
//        }
//
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let saveAction = UIAlertAction(title: "Добавить", style: .default) { _ in
//            print("ОК")
//        }
//        let cancellAction = UIAlertAction(title: "Отменить", style: .cancel)
//
//        alert.addAction(saveAction)
//        alert.addAction(cancellAction)
//
//        alert.addTextField { textField in
////            guard let text = textField.text, !text.isEmpty else {
////                print("")
////                return
////            }
////            if let _ = Double(text) {
////                print("Wrong format")
////                return
////            }
//            textField.placeholder = "Введите город"
//            textField.snp.makeConstraints { make in
//                make.height.equalTo(20)
//            }
//
//            textField.addTarget(self, action: #selector(self.refreshContent), for: .touchUpInside)
//
//            textField.rightView = textFieldBtn
//            textField.rightViewMode = .always
//
//
//        }
//        present(alert, animated: true)
//    }
    //MARK: -Setup ImageLabel
    private func setupImage() -> UIView? {
        let headerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: 300)
        )
     
        headerView.backgroundColor = .systemBlue
        headerView.layer.cornerRadius = 20
        let currentDay = UILabel(frame: CGRect(x: 10, y: 10,
                                               width: view.frame.size.width-20,
                                               height: headerView.frame.size.height/5))
        
        let imageLabel = UILabel(frame: CGRect(x: 10,
                                               y: 20+currentDay.frame.size.height,
                                               width: view.frame.size.width-20,
                                               height: headerView.frame.size.height/3))
        
        let temperature = UILabel(frame: CGRect(x: 10,
                                                y: 20+currentDay.frame.size.height+imageLabel.frame.size.height,
                                                width: view.frame.size.width-20,
                                                height: headerView.frame.size.height/1.8))
        
        currentDay.textAlignment = .center
        imageLabel.textAlignment = .center
        temperature.textAlignment = .center
        
        headerView.addSubview(currentDay)
        headerView.addSubview(imageLabel)
        headerView.addSubview(temperature)
        
        currentDay.text = "Погода на сегодня"
        imageLabel.text = "Ясно"
        temperature.text = "+17"
        
        
        return headerView
    }
    

    
    
    @objc private func refreshContent() {


    }

    
    @objc private func addNewCity() {
        let myCityTableVC = MyCityTableViewController()
//        myCityTableVC.modalPresentationStyle = .fullScreen
        present(myCityTableVC, animated: true)
    }
    
    @objc private func viewLocation() {
        
    }
    
//    @objc private func buttonTapped() {
//        showAlert(with: "", and: "")
//    }
    
}



