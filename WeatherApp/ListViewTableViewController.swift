//
//  ListViewTableViewController.swift
//  WeatherApp
//
//  Created by Zheng wu on 2/22/21.
//

import UIKit

class ListViewTableViewController: UITableViewController {
    var weatherList : [CityWeather] = []
    var selectedRow: Int = 0
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview.rowHeight = 100
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableview.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableCell

        cell.weatherLabel.text = weatherList[indexPath.row].summary
        cell.tempLabel.text = weatherList[indexPath.row].temperature

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.item
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DestVC = segue.destination as? DetailsViewViewController {

            DestVC.currentWeather = weatherList[selectedRow]
        }
    }


}
