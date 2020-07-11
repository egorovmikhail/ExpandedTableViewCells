//
//  ViewController.swift
//  ExpandedTableViewCells
//
//  Created by Михаил Егоров on 28.06.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let headerID = String(describing: CustomHeaderView.self)
    
    var arrayOfData = [ExpandedModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfData = [
            ExpandedModel(isExpanded: true, title: "Words", array: ["One", "Two", "Three", "Four", "Five"]),
            ExpandedModel(isExpanded: true, title: "Numbers", array: ["6", "7", "8", "9", "10"]),
            ExpandedModel(isExpanded: true, title: "Сharacters", array: ["Q", "W", "E", "R", "T", "Y"]),
            ExpandedModel(isExpanded: true, title: "Emojis", array: [" ", " ", " ", " ", " "])
        ]
        
        tableViewConfig()

    }
    
    private func tableViewConfig() {
        
        let nib = UINib(nibName: headerID, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.tableFooterView = UIView()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !arrayOfData[section].isExpanded {
            return 0
        }
        
        return arrayOfData[section].array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfData[indexPath.section].array[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        header.configure(title: arrayOfData[section].title, section: section)
        header.rotateImage(arrayOfData[section].isExpanded)
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}

extension ViewController: HeaderViewDelegate {
    func expandedSection(button: UIButton) {
        let section = button.tag
        let isExpanded = arrayOfData[section].isExpanded
        arrayOfData[section].isExpanded = !isExpanded
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}
