//
//  ViewController.swift
//  Pangesture
//
//  Created by PASHA on 19/07/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var btnClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onClickImageView))

        self.imageV.addGestureRecognizer(panGesture)


        let btnPanGesture = UIPanGestureRecognizer(target: self, action: #selector(btnClickView))


        self.btnClick.addGestureRecognizer(btnPanGesture)


        let imagePinGesture = UIPinchGestureRecognizer(target: self, action: #selector(imageViewPin))

        self.imageV.addGestureRecognizer(imagePinGesture)
        
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateImageView))
        
        self.imageV.addGestureRecognizer(rotateGesture)
        
        print("okkk")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @objc  func onClickImageView(recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        
       if let view = recognizer.view
        {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    @objc func btnClickView(recognizer:UIPanGestureRecognizer)
    {
        
        let translation = recognizer.translation(in: self.view)
     if let btnV = recognizer.view {
        
        btnV.center = CGPoint(x: btnV.center.x + translation.x, y: btnV.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        
    }
    
   @objc func imageViewPin(recognizer:UIPinchGestureRecognizer) {
        
      if  let imgV = recognizer.view {
            
            imgV.transform = imgV.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1
        }
    }
    
    
    @objc func rotateImageView(recognizer:UIRotationGestureRecognizer){
    
       if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
           recognizer.rotation = 0
        }
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

