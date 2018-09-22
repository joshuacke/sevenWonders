//
//  MyUIViewController.swift
//  KeJoshua-hw6
//
//  Created by Ke, Joshua C on 10/16/17.
//  Copyright © 2017 Ke, Joshua C. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var MyImageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyImageView.image = image
        MyImageView.contentMode = UIViewContentMode.scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
