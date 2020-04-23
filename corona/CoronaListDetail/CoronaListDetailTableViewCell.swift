//
//  CoronaListDetailTableViewCell.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import UIKit

class CoronaListDetailTableViewCell: UITableViewCell {

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
    
    func updateUI(coronaList: [CountryStats],indexpath:Int) {
        cityName.text = coronaList[indexpath].name
        deadValueLabel.text = String(coronaList[indexpath].deathCount)
        recovryValueLabel.text = String(coronaList[indexpath].recovryCount)
        confirmedValueLabel.text = String(coronaList[indexpath].confirmedCount)
        recovryPersentValueLabel.text = "% " + String(format: "%.2f", Double(coronaList[indexpath].recovryCount * 100) / Double(coronaList[indexpath].confirmedCount))
        deadPersentValueLabel.text = "% " + String(format: "%.2f", Double(coronaList[indexpath].deathCount * 100) / Double(coronaList[indexpath].confirmedCount))
    }
}
