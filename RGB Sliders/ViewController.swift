//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Richard Greene on 8/7/17.
//  Copyright © 2017 Richard Greene. All rights reserved.
//

import UIKit
//added comment
class ViewController: UIViewController {
//added links or Boutlets to the three sliders so they can interact with the code for the view
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
   //created a BOutlet for the color from the sliders to affect the square
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading the user defaults for each slider(no need to 'synchronize()', retrieiving data not storing)
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        
      //giving the colorSquare a one block pixel order
        colorSquare.layer.borderColor = UIColor.black.cgColor //cg stands for 'Core Graphics'
        colorSquare.layer.borderWidth = 1
        
      //so that the app will start with the sliders already taking affect, call the func
        updateBackgroundColor()
    }
    
    
    @IBAction func updateBackgroundColor() {
    //casting the slider values as CGFloat because they will be using a 0 - 1 scale (UIsliders)
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
      //changed 'view.' to 'colorSquare.' as to make this func affect the colorSquare, not the viewController
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
      //this will save the last color the user sets as the default, saving it for when the app closes
        let defaults = UserDefaults.standard
        defaults.set(redSlider.value, forKey: "red")
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(blueSlider.value, forKey: "blue")
        defaults.synchronize() //this makes sure the data is save immediately
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //this will override the basic function of the segue and give it new properties
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      //giving the segue function with the name "openColor"
        if (segue.identifier == "openColor"){
            
      //storing a reference to the second viewController
        let newViewController = segue.destination
        
      //this argument sends whatever the value the sliders create and display that on the new viewController
        newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }

}

