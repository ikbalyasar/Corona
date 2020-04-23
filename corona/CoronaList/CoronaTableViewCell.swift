//
//  CoronaTableViewCell.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import UIKit

class CoronaTableViewCell: UITableViewCell {

    @IBOutlet var coronaView: UIView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var deadPersentLabel: UILabel!
    @IBOutlet var deadPersentValueLabel: UILabel!
    @IBOutlet var recovryPersentLabel: UILabel!
    @IBOutlet var recovryPersentValueLabel: UILabel!
    @IBOutlet var confirmedLabel: UILabel!
    @IBOutlet var deadLabel: UILabel!
    @IBOutlet var recovryLabel: UILabel!
    @IBOutlet var confirmedValueLabel: UILabel!
    @IBOutlet var deadValueLabel: UILabel!
    @IBOutlet var recovryValueLabel: UILabel!
    @IBOutlet var recovryView: UIView!
    @IBOutlet var deadView: UIView!
    @IBOutlet var confirmedView: UIView!
    @IBOutlet var detailImageView: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        deadLabel.text = "Deaths".localized
        recovryLabel.text = "Recovered".localized
        confirmedLabel.text = "Confirmed".localized
        deadPersentLabel.text = "Deaths".localized
        recovryPersentLabel.text = "Recovered".localized
    
        
        self.coronaView.addShadow(opacitiy: 0.1, shadowRadius: 10, shadowOffsetWidth: 1, shadowOffsetHeight: 1, shadowColor: .darkGray)
        self.coronaView.addCornerRadius(cornerRadius: 6)
        self.confirmedView.addCornerRadius(cornerRadius: 10)
        self.deadView.addCornerRadius(cornerRadius: 10)
        self.recovryView.addCornerRadius(cornerRadius: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(coronaList: List,indexpath:Int) {
        cityName.text = coronaList.data[indexpath].countryStats.name.localized
        deadValueLabel.text = String(coronaList.data[indexpath].countryStats.deathCount)
        recovryValueLabel.text = String(coronaList.data[indexpath].countryStats.recovryCount)
        confirmedValueLabel.text = String(coronaList.data[indexpath].countryStats.confirmedCount)
        recovryPersentValueLabel.text = "% " + String(format: "%.2f",  Double(coronaList.data[indexpath].countryStats.recovryCount * 100) / Double(coronaList.data[indexpath].countryStats.confirmedCount))
        deadPersentValueLabel.text = "% " + String(format: "%.2f", Double(coronaList.data[indexpath].countryStats.deathCount * 100) / Double(coronaList.data[indexpath].countryStats.confirmedCount))
        
        if (coronaList.data[indexpath].cityStats.count == 0) {
            detailImageView.isHidden = true
        }
        else {
            detailImageView.isHidden = false
        }
        
    }
    
}
