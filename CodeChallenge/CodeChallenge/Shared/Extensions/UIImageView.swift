//
//  File.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/25/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func roundCornersForAspectFit(radius: CGFloat)
    {
        if let image = self.image {
            
            //calculate drawingRect
            let boundsScale = self.bounds.size.width / self.bounds.size.height
            let imageScale = image.size.width / image.size.height
            
            var drawingRect: CGRect = self.bounds
            
            if boundsScale > imageScale {
                drawingRect.size.width =  drawingRect.size.height * imageScale
                drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
            } else {
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func frameForImageInImageViewAspectFit() -> CGRect
    {
        if  let img = self.image {
            let imageRatio = img.size.width / img.size.height;
            
            let viewRatio = self.frame.size.width / self.frame.size.height;
            
            if(imageRatio < viewRatio)
            {
                let scale = self.frame.size.height / img.size.height;
                
                let width = scale * img.size.width;
                
                let topLeftX = (self.frame.size.width - width) * 0.5;
                
                return CGRect(x: topLeftX, y: 0, width: width, height: self.frame.size.height);
            }
            else
            {
                let scale = self.frame.size.width / img.size.width;
                
                let height = scale * img.size.height;
                
                let topLeftY = (self.frame.size.height - height) * 0.5;
                
                return CGRect(x: 0, y: topLeftY, width: self.frame.size.width, height: height);
            }
        }
        
        return CGRect(x: 0, y: 0, width: 0, height: 0)
    }
}
