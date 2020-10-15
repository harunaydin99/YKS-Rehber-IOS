//
//  ViewController.swift
//  YKSRehberDeneme
//
//  Created by Harun on 10.10.2020.
//  Copyright © 2020 Harun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var anaView: UIView!
    @IBOutlet weak var altView: UIView!
    
    @IBOutlet weak var gun: UILabel!
    @IBOutlet weak var saat: UILabel!
    @IBOutlet weak var dakika: UILabel!
    @IBOutlet weak var saniye: UILabel!
    
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anaView.layer.cornerRadius = 22
        altView.layer.cornerRadius = 22
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(hesapla), userInfo: nil, repeats: true)
    
        
    }
    
    @objc func hesapla(){
        // here we set the current date

           let date = NSDate()
           let calendar = Calendar.current

        let components = calendar.dateComponents([.hour, .minute,.second, .month, .year, .day], from: date as Date)

           let currentDate = calendar.date(from: components)

           let userCalendar = Calendar.current

           // here we set the due date. When the timer is supposed to finish
           let competitionDate = NSDateComponents()
           competitionDate.year = 2021
           competitionDate.month = 6
           competitionDate.day = 27
           competitionDate.hour = 10
           competitionDate.minute = 00
           competitionDate.second=00
           let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!

           //here we change the seconds to hours,minutes and days
        let CompetitionDayDifference = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate!, to: competitionDay)


           //finally, here we set the variable to our remaining time
           let daysLeft = CompetitionDayDifference.day
           let hoursLeft = CompetitionDayDifference.hour
           let minutesLeft = CompetitionDayDifference.minute
        let secondLeft = CompetitionDayDifference.second

           //print("day:", daysLeft ?? "N/A", "hour:", hoursLeft ?? "N/A", "minute:", minutesLeft ?? "N/A")

           //Set countdown label text
        gun.text="\(daysLeft ?? 0)"
        saat.text="\(hoursLeft ?? 0)"
        dakika.text="\(minutesLeft ?? 0)"
        saniye.text = "\(secondLeft ?? 0)"
    }


}

