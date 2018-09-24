//
//  HomeViewController.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 24/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEssential()
        // Do any additional setup after loading the view.
    }
    func viewEssential() {
        registerTableView()
    }

    func registerTableView() {
        
        tableView.registerCellWithName(name: "WeatherHeaderTableViewCell")
        tableView.registerCellWithName(name: "WeatherWeekTableViewCell")
        tableView.registerCellWithName(name: "WeatherFooterTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    

    //MARK: Header Methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WeatherHeaderTableViewCell") as? WeatherHeaderTableViewCell
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
     //MARK: Cell Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "WeatherWeekTableViewCell") as? WeatherWeekTableViewCell
        cell?.delegate = self
        cell?.btnExample.tag = indexPath.row
        cell?.btnExample.section = indexPath.section
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
     //MARK: Footer Methods
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WeatherFooterTableViewCell") as? WeatherFooterTableViewCell
        cell?.delegate = self
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
}

extension HomeViewController : weatherFooterDelegate ,ExampleDelegate{
    
    func exampleButtonTapped(button: UIButton) {
        print(button.tag)
        print(button.section)
    }
    
    func refreshButtonTapped(button: UIButton) {
        
    }
    
    
}
