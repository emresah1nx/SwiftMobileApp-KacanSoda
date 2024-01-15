//
//  ViewController.swift
//  KacanSoda
//
//  Created by Emre Şahin on 2.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var skor = 0
    var timer = Timer()
    var counter = 0
    var hidetimer = Timer()
    var sisearray = [UIImageView] ()
    var highscore = 0
    
    
    @IBOutlet weak var zaman: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var highscorelabel: UILabel!
    @IBOutlet weak var sise1: UIImageView!
    @IBOutlet weak var sise2: UIImageView!
    @IBOutlet weak var sise3: UIImageView!
    @IBOutlet weak var sise4: UIImageView!
    @IBOutlet weak var sise5: UIImageView!
    @IBOutlet weak var sise6: UIImageView!
    @IBOutlet weak var sise7: UIImageView!
    @IBOutlet weak var sise8: UIImageView!
    @IBOutlet weak var sise9: UIImageView!
    @IBOutlet weak var sise10: UIImageView!
    @IBOutlet weak var sise11: UIImageView!
    @IBOutlet weak var sise12: UIImageView!
    @IBOutlet weak var sise13: UIImageView!
    @IBOutlet weak var sise14: UIImageView!
    @IBOutlet weak var sise15: UIImageView!
    @IBOutlet weak var sise16: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        score.text = "Score: \(skor)"
        
        let storedhighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedhighscore == nil {
            highscore = 0
            highscorelabel.text = "Highscore: \(highscore)"
            
        } 
        
        if let nevscore = storedhighscore as? Int
        {
            highscore = nevscore
            highscorelabel.text = "Highscore: \(highscore)"
        }
        
        
        
        sise1.isUserInteractionEnabled = true
        sise2.isUserInteractionEnabled = true
        sise3.isUserInteractionEnabled = true
        sise4.isUserInteractionEnabled = true
        sise5.isUserInteractionEnabled = true
        sise6.isUserInteractionEnabled = true
        sise7.isUserInteractionEnabled = true
        sise8.isUserInteractionEnabled = true
        sise9.isUserInteractionEnabled = true
        sise10.isUserInteractionEnabled = true
        sise11.isUserInteractionEnabled = true
        sise12.isUserInteractionEnabled = true
        sise13.isUserInteractionEnabled = true
        sise14.isUserInteractionEnabled = true
        sise15.isUserInteractionEnabled = true
        sise16.isUserInteractionEnabled = true
        
        let recognaizer1 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer2 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer3 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer4 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer5 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer6 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer7 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer8 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer9 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer10 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer11 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer12 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer13 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer14 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer15 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        let recognaizer16 = UITapGestureRecognizer(target: self, action: #selector(puanfonk))
        
        sise1.addGestureRecognizer(recognaizer1)
        sise2.addGestureRecognizer(recognaizer2)
        sise3.addGestureRecognizer(recognaizer3)
        sise4.addGestureRecognizer(recognaizer4)
        sise5.addGestureRecognizer(recognaizer5)
        sise6.addGestureRecognizer(recognaizer6)
        sise7.addGestureRecognizer(recognaizer7)
        sise8.addGestureRecognizer(recognaizer8)
        sise9.addGestureRecognizer(recognaizer9)
        sise10.addGestureRecognizer(recognaizer10)
        sise11.addGestureRecognizer(recognaizer11)
        sise12.addGestureRecognizer(recognaizer12)
        sise13.addGestureRecognizer(recognaizer13)
        sise14.addGestureRecognizer(recognaizer14)
        sise15.addGestureRecognizer(recognaizer15)
        sise16.addGestureRecognizer(recognaizer16)
        
        sisearray = [sise1, sise2, sise3, sise4, sise5, sise6, sise7, sise8, sise9, sise10, sise11, sise12, sise13, sise14, sise15, sise16]
        
        counter = 10
        zaman.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
        hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidesise), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func hidesise () {
     
        for sisesec in sisearray {
            sisesec.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(sisearray.count - 1)))
        sisearray[random].isHidden = false
    }
    
    
    
    
    @objc func puanfonk ()
    {
        skor += 1
        score.text = "Score: \(skor)"
    }

    @objc func countdown () {
        
        counter -= 1
        zaman.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hidetimer.invalidate()
        
            for sisesec in sisearray {
                sisesec.isHidden = true
            }
        
            if self.skor > self.highscore {
                self.highscore = self.skor
                highscorelabel.text = "Highscore: \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
            }
            
            
            let alert = UIAlertController(title: "Süren Doldu Testo", message: "Pes?", preferredStyle: UIAlertController.Style.alert)
            let okbutton = UIAlertAction(title: "PES ET :( ", style: UIAlertAction.Style.cancel, handler: nil)
            let tekrarbutton = UIAlertAction(title: "DEMİR BÜK!", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.skor = 0
                self.score.text = "Score : \(self.skor)"
                self.counter = 10
                self.zaman.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                self.hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidesise), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okbutton)
            alert.addAction(tekrarbutton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    

    
}

