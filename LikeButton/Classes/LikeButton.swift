//
//  LikeButton.swift
//  Pods
//
//  Created by Charles HARROCH on 26/04/2016.
//
//

import Foundation
import UIKit

@IBDesignable public class LikeButton: UIView {
    
    var status : Bool! = false
    var identifier : NSInteger!
    
    private var view: UIView!
    
    @IBOutlet public weak var imageView : UIImageView!
    @IBOutlet public weak var button : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        customInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        customInit()
    }
    
    // Our custom view from the XIB file
    private func xibSetup() {
        view = loadViewFromNib()
        self.backgroundColor = UIColor.clearColor()
        view.backgroundColor = UIColor.clearColor()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName:"LikeButton", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    func customInit() {
        let bundle = NSBundle(forClass: self.classForCoder)
        imageView.image = UIImage(named: "ico_like_bp", inBundle: bundle, compatibleWithTraitCollection: nil)
    }
    
    @IBAction func likeButtonPressed() {
        if (status == true) {
            setStatus(false)
        } else {
            setStatus(true)
        }
        animate()
    }
    
    func animate() {
        
        imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        UIView.animateWithDuration(0.3/0.5, animations: {
            self.imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.6, 1.6)
            }) { (complete) in
                UIView.animateWithDuration(0.3, animations: {
                    self.imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9)
                }) { (complete) in
                    UIView.animateWithDuration(0.3, animations: {
                         self.imageView.transform = CGAffineTransformIdentity;
                    })
                }
        }
    }
    
    func setStatus(selected: Bool) {
        let bundle = NSBundle(forClass: self.dynamicType)
        if (selected) {
            self.imageView.image = UIImage(named: "ico_liked_bp.png", inBundle: bundle, compatibleWithTraitCollection: nil)
        } else {
            self.imageView.image = UIImage(named: "ico_like_bp.png", inBundle: bundle, compatibleWithTraitCollection: nil)
        }
        status = selected
    }
}
