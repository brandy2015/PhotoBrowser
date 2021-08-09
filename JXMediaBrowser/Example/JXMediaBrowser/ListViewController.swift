//
//  ListViewController.swift
//  JXMediaBrowser_Example
//
//  Created by Jason on 2021/5/14.
//  Copyright © 2021 JXMediaBrowser. All rights reserved.
//

import UIKit
import JXMediaBrowser

class ListViewController: UIViewController {
    
    let reuseCellId = "imageCell"
    
    lazy var modelArray = ResourceManager.makeLocalDataSource()
    
    lazy var listView = JXListView()
    
    deinit {
        JXMediaUtil.log(message: "deinit:\(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.listView)
        
        self.setupListView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.listView.frame = self.view.bounds
    }
    
    private func setupListView() {
        self.listView.padding = UIEdgeInsetsMake(100, 20, 30, 20)
        self.listView.scrollDirection = .horizontal
        self.listView.itemSpacing = 60
        
        self.listView.numberOfItems = {
            return self.modelArray.count
        }
        
        self.listView.cellForItemAtIndex = { listView, index in
            let cell = listView.dequeueReusableCell(withClass: JXImageCell.self, for: index)
            let model = self.modelArray[index]
            var image: UIImage?
            if let imageName = model.localName {
                image = UIImage(named: imageName)
            }
            cell.reload(with: image)
            return cell
        }
    }
}
