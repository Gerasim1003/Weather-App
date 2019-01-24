//
//  LineChart.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/24/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import Foundation
import Charts

class LineChart
{
    var lineChartData: [ChartDataEntry] = []
    
    init(latitude: Double, Longitude: Double) {
        let forecastService = ForecastService(APIKey: "34419891dfa33243b41e4e137395649f")
        forecastService.getForecastDaily(latitude: latitude, longitudude: Longitude) { (weather) in
            for i in 1..<weather!.dailyWeather.count {
                let high = Double((weather!.dailyWeather[i].temperature)!)
                let chartValue = ChartDataEntry(x: Double((weather!.dailyWeather[i].day)!), y: high)
                self.lineChartData.append(chartValue)
            }
        }
    }
    
    func loadData(chartView: LineChartView) {
        let chartDataSet = LineChartDataSet(values: self.lineChartData, label: nil)
        let chartData = LineChartData(dataSet: chartDataSet)
        
        chartView.data = chartData
    }
    
    
}
