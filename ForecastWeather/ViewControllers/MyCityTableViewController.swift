//
//  MyCityTableViewController.swift
//  ForecastWeather
//
//  Created by Дмитрий Татаринцев on 04.02.2022.
//

import UIKit
import CoreLocation

class MyCityTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(ListFavoriteCitiesTableViewCell.self, forCellReuseIdentifier: ListFavoriteCitiesTableViewCell.identifier)
        return table
    }()
    
    let networkManager = NetworkManager()
    
    var citiesArray = [MainModel]()
    
    let emptyCities = MainModel()
    
    var nameCitesArray = ["Сочи", "Краснодар", "Москва", "Тамбов", "Мурманск"]
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setupNC()
        
        
        setupButton()
//        networkManager.fetchWeather()
      
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCities, count: nameCitesArray.count)
        }
        
        addCities()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    // MARK: - Delete Cell
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            let edetingRow = self.nameCitesArray[indexPath.row]
            
            if let index = self.nameCitesArray.firstIndex(of: edetingRow) {
                self.citiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCitesArray) { index, mainModel in
            self.citiesArray[index] = mainModel
            self.citiesArray[index].name = self.nameCitesArray[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(self.citiesArray)
        }
    }  

   
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListFavoriteCitiesTableViewCell.identifier, for: indexPath) as! ListFavoriteCitiesTableViewCell
        var mainModel = MainModel()
        mainModel = citiesArray[indexPath.row]
        cell.configure(mainModel: mainModel)
        
        return cell
    }
    
    //MARK: - Setup Alert Controller
    func alertPlusCity(name: String, completionHandler: @escaping (String) -> Void) {
        
        var textFieldBtn: UIButton {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "delete.left"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

            return button
        }
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Добавить", style: .default) { action in
            let textField = alert.textFields?.first
            guard let text = textField?.text else {return}
            completionHandler(text)
        }
        
        let cancellAction = UIAlertAction(title: "Отменить", style: .default)
        
        alert.addAction(cancellAction)
        alert.addAction(saveAction)
        
        alert.addTextField { textField in
            textField.placeholder = "Введите город"
            textField.snp.makeConstraints { make in
                make.height.equalTo(20)
            }
            textField.rightView = textFieldBtn
            textField.rightViewMode = .always
            
        }
        present(alert, animated: true)
    }
    
    //MARK: - Setup Button Save Cities
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить город", for: .normal)
        button.layer.cornerRadius = 20
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(170)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(30)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupNC() {
        let navVC = UINavigationController()
        title = "Мои города"
        navVC.navigationItem.leftBarButtonItem  = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(back))

    }

    @objc private func back() {

    }
    
    @objc private func buttonTapped() {
        alertPlusCity(name: "") { city in
            self.nameCitesArray.append(city)
            self.citiesArray.append(self.emptyCities)
            self.addCities()
        }
    }

}
