//
//  SystemFont.swift
//  Task
//
//  Created by Horbach on 6/11/19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import UIKit

class SystemFont: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var familyName = [String]()
    var fontName = [String]()
    var fontNames = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = false
        runSustemFont()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fontName.sort(){ $0 < $1 }
        return fontName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fontName = fontNames[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontName, size:15)
        cell.textLabel?.text = fontName
        //cell.textLabel?.font = UIFont(name:"TimesNewRomanPSMT",size:15) //name:"FontAwesome"
        //cell.textLabel?.text = fontNames[indexPath.row]
        textLabel.text = fontName
        textLabel.font = UIFont(name: fontName , size: 17)

         return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
   tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
        func runSustemFont() {
        for familyName in UIFont.familyNames{
            self.familyName = [familyName]
            for fontName in UIFont.fontNames(forFamilyName: familyName){
                self.fontName += [fontName]
                self.fontNames += [fontName]
                for family in UIFont.familyNames.sorted() {
                    var names = UIFont.fontNames(forFamilyName: family)
                    //print("Family:\(family) Font Names:\(names)")
                }
            }
        }
    }
    
}


