//
//  ForecastViewModel.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/26/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit

class ForecastViewModel: TableViewCellRepresentable {
    var model: ForecastModel

    init(model: ForecastModel) {
        self.model = model
    }

    func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.reuseIdentifier, for: indexPath) as? ForecastTableViewCell else { return UITableViewCell() }
        cell.setup(self)

        return cell
    }
}
