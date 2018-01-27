//
//  MainViewController.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/24/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit
import ViewAnimator

class MainViewController: UIViewController {

    // MARK: - Instance properties

    let navBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.barTintColor = .white
        nav.shadowImage = UIImage()
        nav.setBackgroundImage(UIImage(), for: .default)
        nav.tintColor = .customBlack
        nav.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)]

        let navItem = UINavigationItem(title: "Edinburgh, United Kingdom")
        let arrowImage = UIImage(named: "Back Chevron")
        let backArrowBarButtonItem = UIBarButtonItem(image: arrowImage, style: .plain, target: nil, action: nil)

        navItem.setLeftBarButton(backArrowBarButtonItem, animated: false)
        nav.items = [navItem]

        return nav
    }()

    let weatherView: WeatherView = {
        let weatherView = WeatherView()
        weatherView.translatesAutoresizingMaskIntoConstraints = false

        return weatherView
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()

        return tableView
    }()

    var data = [TableViewCellRepresentable]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavBar()
        setupWeatherView()
        setupTableView()
        fetchWeatherData()

        // Uncomment the below function and
        // enter a number to see a particular animation

        // 1: Apply random animations to all subviews
        // 2: Apply left to right animations to all subviews
        // 3: Apply right to left animations to all subviews
        // 4: Apply top to bottom animation to the nav bar.
        //    Apply rotation to sun after fade and then animate
        //    the rest of the subviews alternately from left to right.
        //    Tableview has a zooming animation

        //showCoolAnimations(4)
    }

    // MARK: - Setup methods

    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupNavBar() {
        view.addSubview(navBar)

        let guide = view.safeAreaLayoutGuide

        navBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }

    private func setupWeatherView() {
        view.addSubview(weatherView)

        let guide = view.safeAreaLayoutGuide

        weatherView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 8).isActive = true
        weatherView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        weatherView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        weatherView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self

        let guide = view.safeAreaLayoutGuide

        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }

    private func fetchWeatherData() {
        let fridayForecast = ForecastModel(date: "Fri, Jan 26", tempHigh: 70, tempLow: 60)
        let saturdayForecast = ForecastModel(date: "Sat, Jan 27", tempHigh: 86, tempLow: 67)
        let sundayForecast = ForecastModel(date: "Sun, Jan 28", tempHigh: 77, tempLow: 71)

        let fridayForecastVM = ForecastViewModel(model: fridayForecast)
        let saturdayForecastVM = ForecastViewModel(model: saturdayForecast)
        let sundayForecastVM = ForecastViewModel(model: sundayForecast)

        data = [fridayForecastVM, saturdayForecastVM, sundayForecastVM]

        tableView.reloadData()
    }

    private func showCoolAnimations(_ animation: Int) {
        switch animation {
        case 1:
            view.animateRandom()
        case 2:
            let leftToRightAnimation = AnimationType.from(direction: .left, offset: 80)
            view.animateAll(animations: [leftToRightAnimation])
        case 3:
            let rightToLeftAnimation = AnimationType.from(direction: .right, offset: 80)
            view.animateAll(animations: [rightToLeftAnimation])
        case 4:
            let rotateAnimation = AnimationType.rotate(angle: 360)
            let leftToRightAnimation = AnimationType.from(direction: .left, offset: 80)
            let rightToLeftAnimation = AnimationType.from(direction: .right, offset: 80)
            let topToBottomAnimation = AnimationType.from(direction: .top, offset: 30)
            let zoomAnimation = AnimationType.zoom(scale: 0.8)

            navBar.animate(animations: [topToBottomAnimation])

            weatherView.weatherDescriptionLabel.alpha = 0
            weatherView.weatherTemperatureLabel.alpha = 0

            weatherView.weatherImageView.animate(animations: [rotateAnimation], initialAlpha: 0.0, finalAlpha: 1.0, delay: 1, duration: 2, completion: {
                self.weatherView.weatherTemperatureLabel.animate(animations: [rightToLeftAnimation])
                self.weatherView.weatherDescriptionLabel.animate(animations: [leftToRightAnimation])
                self.tableView.animateAll(animations: [zoomAnimation])
            })

        default:
            print("Invalid input! Enter a valid number")
        }
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.row].cell(tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
