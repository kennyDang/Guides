//
//  TableViewCellRepresentable.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/26/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit

protocol TableViewCellRepresentable: class {
    func cell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
