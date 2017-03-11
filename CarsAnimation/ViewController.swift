//
//  ViewController.swift
//  CarsAnimation
//
//  Created by Nodira on 2/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numCars: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateCars(_ sender: Any) {
        
        //Get the number of cars from the user
        let numberOfCars = Int(roundf(numCars!.value))
        
        //Start a loop to show and animate cars one by one
        for carNum in 1...numberOfCars {
            
            //Define the dimensions of the car using randomization
            let wCar = (Int(arc4random() % 10) + 1) * 20  //set car width between 20 and 200
            let hCar = (wCar * 3) / 4                     //set car hight 75% of width
            let xStart = 0 - wCar                         //car starts outside left edge
            let xEnd = 380 + wCar                         //car ends outside right edge
            let yPos = Int(arc4random() % 200) + wCar     //each car stertsat diffvert position
            
            //Define the duration and dilay of the animation
            let aDur = Double(arc4random() % 10)             //duration between 0 and 9 sec
            let aDly = Double(arc4random() % 2)              //delay between 0 and 1 secs
            
            // Now set up our car image
            let car = UIImageView()                       // we need an ImageView to hold the image of the car
            car.image = #imageLiteral(resourceName: "white-mers2")
            car.frame = CGRect(x: xStart, y: yPos, width: wCar, height: hCar)
            self.view.addSubview(car)
            
            //Now animate the car and then remove it once it goes past right edge
            UIView.animate(withDuration: aDur, delay: aDly, options: UIViewAnimationOptions.curveLinear, animations: {
                car.frame =  CGRect(x: xEnd, y: yPos, width: wCar, height: hCar)
            }, completion: { animationFinished in car.removeFromSuperview()}) //On comlition of animation remove the car
        }
    }

}

