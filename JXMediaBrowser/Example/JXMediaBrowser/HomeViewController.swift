//
//  ViewController.swift
//  JXMediaBrowser
//
//  Created by Jason on 04/11/2021.
//  Copyright (c) 2021 JXMediaBrowser. All rights reserved.
//

import UIKit
import JXMediaBrowser

class HomeViewController: UITableViewController {
    
    let kCellReuseId = "ReuseId"
    
    lazy var modelArray: [HomeActionModel] = [
        localImageModel
    ]
    
    lazy var localImageModel = HomeActionModel(title: "本地图片") {
        print("click local!")
        let vc = ListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        JXMediaUtil.logLevel = .normal
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var reuseCell = tableView.dequeueReusableCell(withIdentifier: kCellReuseId)
        if (nil == reuseCell) {
            reuseCell = UITableViewCell(style: .subtitle, reuseIdentifier: kCellReuseId)
        }
        let cell = reuseCell!
        
        let model = modelArray[indexPath.row]
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.desc
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = modelArray[indexPath.row]
        model.onClickCallback()
    }
}

