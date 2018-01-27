//
//  WeatherView.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/26/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    // MARK: - Instance properties

    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "wi-day-sunny")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    let weatherTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°"
        label.font = UIFont.systemFont(ofSize: 70, weight: UIFont.Weight.semibold)
        label.textColor = .customBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "It's sunny outside."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .customBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupWeatherImageView()
        setupWeatherTemperatureLabel()
        setupWeatherDescriptionLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup methods

    private func setupWeatherImageView() {
        addSubview(weatherImageView)

        weatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }

    private func setupWeatherTemperatureLabel() {
        addSubview(weatherTemperatureLabel)

        weatherTemperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        weatherTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        weatherTemperatureLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        weatherTemperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 30).isActive = true
    }

    private func setupWeatherDescriptionLabel() {
        addSubview(weatherDescriptionLabel)

        weatherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        weatherDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        weatherDescriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherTemperatureLabel.bottomAnchor, constant: 30).isActive = true
    }

}
