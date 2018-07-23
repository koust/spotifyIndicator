//
//  SpotifyIndicator.swift
//  spotifyIndicator
//
//  Created by Batuhan Saygili on 22.07.2018.
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

public class SpotifyIndicator: UIViewController {

    public var yourView                 = UIView()
    public var yourViewBg               = UIColor.black
    public var yourViewAlpha:CGFloat    = 0.1
    public var myPointColor             = UIColor.white
    public var pointSize:CGFloat        = 15
    
   
    
    private let centerPoint              = UIView()
    private let leftPoint                = UIView()
    private let rightPoint               = UIView()
    private let myView                   = UIView()


    public func show(){
        
        shapeType(shape:.circle)
        createView()
        animation()
    }
    
    public func show(shape:Shape){
        
        shapeType(shape:shape)
        createView()
        animation()
    }
    
    public func stop(){
        myView.removeFromSuperview()
    }


    private func createView(){
        myView.translatesAutoresizingMaskIntoConstraints                    = false
        myView.backgroundColor                                              = yourViewBg.withAlphaComponent(yourViewAlpha)

        
        createPoint()
        
        
        yourView.addSubview(myView)
        yourView.addSubview(centerPoint)
        yourView.addSubview(leftPoint)
        yourView.addSubview(rightPoint)
        
        
        
        myView.topAnchor.constraint(equalTo: yourView.topAnchor).isActive           = true
        myView.leftAnchor.constraint(equalTo: yourView.leftAnchor).isActive         = true
        myView.rightAnchor.constraint(equalTo: yourView.rightAnchor).isActive       = true
        myView.bottomAnchor.constraint(equalTo: yourView.bottomAnchor).isActive     = true
        
        
    }


    private func createPoint(){
        centerPoint.clipsToBounds                                       = true
        leftPoint.clipsToBounds                                         = true
        rightPoint.clipsToBounds                                        = true
        
        centerPoint.backgroundColor                                     = myPointColor
        leftPoint.backgroundColor                                       = myPointColor
        rightPoint.backgroundColor                                      = myPointColor
        
        
        leftPoint.frame = CGRect(x: yourView.frame.size.width/2 - pointSize*2, y:yourView.frame.size.height/2 - pointSize/2, width: pointSize, height: pointSize)
        centerPoint.frame = CGRect(x: yourView.frame.size.width/2 - pointSize/2, y:yourView.frame.size.height/2 - pointSize/2, width: pointSize, height: pointSize)
        rightPoint.frame = CGRect(x: yourView.frame.size.width/2 + pointSize, y:yourView.frame.size.height/2 - pointSize/2, width: pointSize, height: pointSize)

        
    }
    
    private func shapeType(shape:Shape){
        switch shape {
        case .square:
            break
        default:
            centerPoint.layer.cornerRadius                                  = pointSize/2
            leftPoint.layer.cornerRadius                                    = pointSize/2
            rightPoint.layer.cornerRadius                                   = pointSize/2
        }
    }
    
    private func animation(){
        let newSize:CGFloat  = 20

        
        
        UIView.animate(withDuration: 0.7, delay: 0, options: [.autoreverse,.repeat],
                       animations: {
                        self.leftPoint.frame = CGRect(x: self.yourView.frame.size.width/2 - newSize*2, y:self.yourView.frame.size.height/2 - newSize/2 + 5, width: newSize, height: newSize)
        },
                       completion: nil
                     
        
            
        )
     
        
        UIView.animate(withDuration: 0.7, delay: 1, options: [.autoreverse,.repeat],
                       animations: {
                        self.centerPoint.frame = CGRect(x: self.yourView.frame.size.width/2 - newSize/2, y:self.yourView.frame.size.height/2 - newSize/2 + 5, width: newSize, height: newSize)
        },
                       completion: nil
    
            
        )
        
        UIView.animate(withDuration: 0.7, delay: 1.7, options: [.autoreverse,.repeat],
                       animations: {
                        self.rightPoint.frame = CGRect(x: self.yourView.frame.size.width/2 + newSize, y:self.yourView.frame.size.height/2 - newSize/2 + 5, width: newSize, height: newSize)
        },
                       completion: nil
    
            
        )
        

    }
}

public enum Shape {
    case circle
    case square
}
