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
    
    let futureDate: Date = {
        var future = DateComponents(
            year: 2021,
            month: 6,
            day: 19,
            hour: 10,
            minute: 0,
            second: 0
        )
        return Calendar.current.date(from: future)!
    }()

    var countdown: DateComponents {
        return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
    }

    @objc func updateTime() {
        var countdown = self.countdown //only compute once per call
         //days = countdown.day!
         //hours = countdown.hour!
         //minutes = countdown.minute!
         //seconds = countdown.second!
       // countdownLabel.text = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
    }

    func runCountdown() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anaView.layer.cornerRadius = 22
        altView.layer.cornerRadius = 22
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        while countdown.day! >= 0 {
            gun.text = "\(countdown.day!)"
        }
        while countdown.hour! >= 0 {
            saat.text = "\(countdown.hour!)"
        }
        while countdown.minute! >= 0 {
            dakika.text = "\(countdown.minute!)"
        }
        while countdown.second! >= 0 {
            saniye.text = "\(countdown.second!)"
        }
    
        
    }


}

