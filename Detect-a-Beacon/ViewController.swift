import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        }
        
        override open var shouldAutorotate: Bool {
            return false
        }
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var distanceReading: UILabel!
    @IBOutlet weak var rssivalue: UILabel!
    @IBOutlet weak var accuracyvalue: UILabel!
    
   
    @IBOutlet weak var distanceReading2: UILabel!
    @IBOutlet weak var rssivalue2: UILabel!
    @IBOutlet weak var accuracyvalue2: UILabel!
    
    
    @IBOutlet weak var distanceReading3: UILabel!
    @IBOutlet weak var rssivalue3: UILabel!
    @IBOutlet weak var accuracyvalue3: UILabel!
    
    @IBOutlet weak var distanceReading4: UILabel!
    @IBOutlet weak var rssivalue4: UILabel!
    @IBOutlet weak var accuracyvalue4: UILabel!
    
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var iconstack: UIStackView!
    
    @IBOutlet weak var settingStackView: UIStackView!{
        didSet {
            settingStackView.arrangedSubviews.forEach { (view) in
                if view.tag != 5 {
                    view.isHidden = true
                }
            }
        }
    }
  
    @IBAction func showsetting(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.settingStackView.arrangedSubviews.forEach({ (view) in
                if view.tag != 5 {
                    view.isHidden = !view.isHidden
                }
                self.settingStackView.layoutIfNeeded()
            })
        }
    }
    
    @IBOutlet weak var iconStackView: UIStackView!
    
    @IBAction func showIconView(_ sender: UIButton) {
        
        let iconView = iconStackView.arrangedSubviews[sender.tag]
        
        UIView.animate(withDuration: 0.25) {
            iconView.isHidden = !iconView.isHidden
            
            if iconView.isHidden {
                sender.tintColor = UIColor.lightGray
               
            } else {
                sender.tintColor = .white
                
            }
            self.iconStackView.layoutIfNeeded()
        }
        
    }
    
    
    
    func disableview1(){
        v1.isUserInteractionEnabled = false
        v1.alpha = 0.3
    }
    
    
    
    @IBAction func test(_ sender: UIButton) {
        disableview1()
        
    }
    
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
      
        let beaconRegion1 = CLBeaconRegion(proximityUUID: uuid, major: 10, minor: 1, identifier: "MyBeacon1")
        let beaconRegion2 = CLBeaconRegion(proximityUUID: uuid, major: 10, minor: 2, identifier: "MyBeacon2")
        let beaconRegion3 = CLBeaconRegion(proximityUUID: uuid, major: 10, minor: 3, identifier: "MyBeacon3")
        let beaconRegion4 = CLBeaconRegion(proximityUUID: uuid, major: 10, minor: 4, identifier: "MyBeacon4")
        
        
        
        locationManager.startMonitoring(for: beaconRegion1)
        locationManager.startRangingBeacons(in: beaconRegion1)
        
        locationManager.startMonitoring(for: beaconRegion2)
        locationManager.startRangingBeacons(in: beaconRegion2)
        
        locationManager.startMonitoring(for: beaconRegion3)
        locationManager.startRangingBeacons(in: beaconRegion3)
        
        locationManager.startMonitoring(for: beaconRegion4)
        locationManager.startRangingBeacons(in: beaconRegion4)

     
    }

  
    
     func update(distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {[unowned self] in
            switch distance {
            case .unknown:
                self.v1.backgroundColor = UIColor.gray
                self.distanceReading.text = "UNKNOWN"
            case .immediate:
                self.v1.backgroundColor = UIColor.red
                self.distanceReading.text = "RIGHT HERE"
            case .near:
                self.v1.backgroundColor = UIColor.orange
                self.distanceReading.text = "NEAR"
            case .far:
                self.v1.backgroundColor = UIColor.blue
                self.distanceReading.text = "FAR"
          
            }
        }
    }
    
    func update2(distance: CLProximity) {
       UIView.animate(withDuration: 0.8) {[unowned self] in
           switch distance {
           case .unknown:
               self.v2.backgroundColor = UIColor.gray
               self.distanceReading2.text = "UNKNOWN"
           case .immediate:
               self.v2.backgroundColor = UIColor.red
               self.distanceReading2.text = "RIGHT HERE"
           case .near:
               self.v2.backgroundColor = UIColor.orange
               self.distanceReading2.text = "NEAR"
           case .far:
               self.v2.backgroundColor = UIColor.blue
               self.distanceReading2.text = "FAR"
         
           }
       }
   }
    
    
    
    func update3(distance: CLProximity) {
       UIView.animate(withDuration: 0.8) {[unowned self] in
           switch distance {
           case .unknown:
               self.v3.backgroundColor = UIColor.gray
               self.distanceReading3.text = "UNKNOWN"
           case .immediate:
               self.v3.backgroundColor = UIColor.red
               self.distanceReading3.text = "RIGHT HERE"
           case .near:
               self.v3.backgroundColor = UIColor.orange
               self.distanceReading3.text = "NEAR"
           case .far:
               self.v3.backgroundColor = UIColor.blue
               self.distanceReading3.text = "FAR"
         
           }
       }
   }
    
    func update4(distance: CLProximity) {
       UIView.animate(withDuration: 0.8) {[unowned self] in
           switch distance {
           case .unknown:
               self.v4.backgroundColor = UIColor.gray
               self.distanceReading4.text = "UNKNOWN"
           case .immediate:
               self.v4.backgroundColor = UIColor.red
               self.distanceReading4.text = "RIGHT HERE"
           case .near:
               self.v4.backgroundColor = UIColor.orange
               self.distanceReading4.text = "NEAR"
           case .far:
               self.v4.backgroundColor = UIColor.blue
               self.distanceReading4.text = "FAR"
         
           }
       }
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        view.backgroundColor = UIColor.darkGray
       
        // border radius
        v1.layer.cornerRadius = 5.0
        v2.layer.cornerRadius = 5.0
        v3.layer.cornerRadius = 5.0	
        v4.layer.cornerRadius = 5.0
        
        
        //button1.layer.cornerRadius = 15;
   
        
       
        iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       // stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
     
    
    }


}


extension ViewController: CLLocationManagerDelegate {
    
  
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                   
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
       
        if beacons.count > 0 {
            let beacon = beacons[0]
            if beacon.minor == 1
            
            {
                
            
            update(distance:beacon.proximity)
            rssivalue.text = "RSSI :\(beacon.rssi)"
            accuracyvalue.text = "ACC: " + String(format: "%.2f", beacon.accuracy)
            
            }
             if beacon.minor == 2
            {
                update2(distance:beacon.proximity)
                rssivalue2.text = "RSSI :\(beacon.rssi)"
                accuracyvalue2.text = "ACC: " + String(format: "%.2f", beacon.accuracy)

            }
           
             if beacon.minor == 3
            {
                update3(distance:beacon.proximity)
                rssivalue3.text = "RSSI :\(beacon.rssi)"
                accuracyvalue3.text = "ACC: " + String(format: "%.2f", beacon.accuracy)

            }
             if beacon.minor == 4
            {
                update4(distance:beacon.proximity)
                rssivalue4.text = "RSSI :\(beacon.rssi)"
                accuracyvalue4.text = "ACC: " + String(format: "%.2f", beacon.accuracy)

                
            }
        
            
        }else{
           // update(distance: .unknown)
        }
        
       
        
    }
    
}
