//
//  ViewController.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/22/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var regions: [Region] = [Region(name: "Երեւան", latitude: 40.1535005, longitude: 44.4185271),
                            Region(name: "Արագածոտնի մարզ", latitude: 40.481378, longitude: 43.8135773),
                            Region(name: "Արարատի մարզ", latitude: 39.9520157, longitude: 44.435802),
                            Region(name: "Արմավիրի մարզ", latitude: 40.1590152, longitude: 44.0075393),
                            Region(name: "Գեղարքունիքի մարզ", latitude: 40.3010835, longitude: 44.8339823),
                            Region(name: "Կոտայքի մարզ", latitude: 40.4087447, longitude: 44.4405217),
                            Region(name: "Լոռու մարզ", latitude: 40.982811, longitude: 43.9295877),
                            Region(name: "Շիրակի մարզ", latitude: 40.8103599, longitude: 43.5465633),
                            Region(name: "Սյունիքի մարզ", latitude: 39.342143, longitude: 45.6090432),
                            Region(name: "Տավուշի մարզ", latitude: 40.9755753, longitude: 44.9006949),
                            Region(name: "Վայոց Ձորի մարզ", latitude: 39.7582171, longitude: 45.1660169)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        weatherTableView.rowHeight = 170
        
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeathersTableViewCell
        
        cell!.cellView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell!.cellView.layer.shadowColor = UIColor.black.cgColor
        cell!.cellView.layer.shadowRadius = 3
        cell!.cellView.layer.shadowOpacity = 0.8
        
        cell!.cellView.layer.cornerRadius = 15
        cell!.cellView.layer.masksToBounds = false
        
        let forecastServise = ForecastService(APIKey: "34419891dfa33243b41e4e137395649f")
        forecastServise.getForecastCurently(latitude: regions[indexPath.row].latitude, longitudude: regions[indexPath.row].longitude) { (weather) in
        
            DispatchQueue.main.async {
                
                cell?.regionName.text = self.regions[indexPath.row].name
                if let data = weather?.temperature! {
                    cell?.temp.text = "\(String(data)) ℃"
                }
                
                if let icon = weather?.icon {
                    cell?.icon.image = UIImage(named: icon)
                }

            }
            
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "weather") as! WeatherViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
        viewController.name = regions[indexPath.row].name
        viewController.latitude = regions[indexPath.row].latitude
        viewController.longitude = regions[indexPath.row].longitude

    }
    
}

