//
//  TemplatesTableViewDataSource.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 09.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class TemplatesTableViewDataSource: NSObject, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: TemplatesTableViewCell.self), for: indexPath)
            as? TemplatesTableViewCell else {
                assertionFailure("Non existing cell")
                return UITableViewCell()
        }
        
        cell.setTitle()
        return cell
    }
    
    
}
