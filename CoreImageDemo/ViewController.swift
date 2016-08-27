//
//  ViewController.swift
//  CoreImageDemo
//
//  Created by ABS on 16/2/5.
//  Copyright © 2016年 ABS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: "1.jpeg")
        //获取所有CIfilterName
        //self.showAllFilter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func optionalAction(sender: UIButton) {
        if sender.currentTitle == "模糊效果" {
            sender.setTitle("清晰效果", forState: .Normal)
            
            let image:UIImage = UIImage(named: "1.jpeg")!
            let inputImage:CIImage = CIImage(CGImage: image.CGImage!)
            let ciContext:CIContext = CIContext(options: nil)
            //CoreImage的相应效果
            let ciFilter:CIFilter = CIFilter(name: "CIGaussianBlur", withInputParameters: [kCIInputImageKey:inputImage,"inputRadius":2])!
            let outputImage:CIImage = ciFilter.outputImage! as CIImage
            let outImage:CGImageRef = ciContext.createCGImage(outputImage, fromRect: outputImage.extent)
            let newImage:UIImage = UIImage(CGImage: outImage)
            self.imageView.image = newImage
            
        } else if sender.currentTitle == "清晰效果" {
            sender.setTitle("模糊效果", forState: .Normal)
            self.imageView.image = nil
            self.imageView.image = UIImage(named: "1.jpeg")
        }
    }

    func showAllFilter() ->Void {
        let filterNames:NSArray = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        for index in 0..<filterNames.count {
            let filterName:String = filterNames[index] as! String
            let filter:CIFilter = CIFilter.init(name: filterName)!
            print("\r filter:\(filterName) \r attributes:\(filter.attributes)")
        }
    }

}

