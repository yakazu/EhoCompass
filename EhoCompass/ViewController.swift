//
//  ViewController.swift
//  Ehomaki
//
//  Created by yakazu on 2018/01/10.
//  Copyright © 2018年 yakazu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var ehoView: UIView!
    @IBOutlet weak var howtoButton: UIButton!
    
    var locationManager: CLLocationManager!
    
    /// 恵方の方位（2018年は165度　年ごとにこの数値を変更する）
    let ehoDirection = 165.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        howtoButton.layer.masksToBounds = true
        howtoButton.layer.cornerRadius = 20
        
        self.circleImageView.isHidden = true
        self.ehoView.isHidden = true
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            // Specifies the minimum amount of change in degrees needed for a heading service update (default: 1 degree)
            locationManager.headingFilter = kCLHeadingFilterNone
            
            // Specifies a physical device orientation from which heading calculation should be referenced
            locationManager.headingOrientation = .portrait
            
            locationManager.startUpdatingHeading()
        }
    }
    
    deinit {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.stopUpdatingHeading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        }
        return .all
    }
    
    @IBAction func tappedHowto(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:HowtoTableViewController = storyboard.instantiateViewController(withIdentifier: "HowtoTableViewController") as! HowtoTableViewController
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if (self.circleImageView.isHidden) {
            self.circleImageView.alpha = 0
            self.circleImageView.isHidden = false
            var transRotate = CGAffineTransform()
            let angle = .pi * (newHeading.magneticHeading - ehoDirection) * -1 / 180.0
            transRotate = CGAffineTransform(rotationAngle: CGFloat(angle));
            self.circleImageView.transform = transRotate
            UIView.animate(withDuration: 0.3, animations: {
                self.circleImageView.alpha = 1
            })
        } else {
            let angle = .pi * (newHeading.magneticHeading - ehoDirection) * -1 / 180.0
            UIView.animate(withDuration: 0.1, animations: {
                var transRotate = CGAffineTransform()
                transRotate = CGAffineTransform(rotationAngle: CGFloat(angle));
                self.circleImageView.transform = transRotate
                if (angle <= 0.03 && angle >= -0.03) {
                    self.ehoView.isHidden = false
                    self.arrowImageView.isHidden = true
                    self.ehoView.alpha = 1
                    self.arrowImageView.alpha = 0
                } else {
                    self.ehoView.isHidden = true
                    self.arrowImageView.isHidden = false
                    self.ehoView.alpha = 0
                    self.arrowImageView.alpha = 1
                }
            })
        }
    }
}

