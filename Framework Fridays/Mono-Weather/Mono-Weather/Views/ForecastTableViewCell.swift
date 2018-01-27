//
//  ForecastTableViewCell.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/26/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    // MARK: - Instance properties

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .customBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customBlack
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupDateLabel()
        setupTemperatureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup methods

    func setup(_ viewModel: ForecastViewModel) {
        dateLabel.text = viewModel.model.date
        temperatureLabel.text = "\(viewModel.model.tempHigh)° \(viewModel.model.tempLow)°"
    }

    private func setupDateLabel() {
        contentView.addSubview(dateLabel)

        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
    }

    private func setupTemperatureLabel() {
        contentView.addSubview(temperatureLabel)

        temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
