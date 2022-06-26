//
//  Extensions.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//

import Foundation
import UIKit

extension UIViewController {
    func activateSpinner(view: UIViewController, spinner: inout UIView?) {
        view.showLoading(view: view, spinner: &spinner, active: true)
    }
    
    func deactivateSpinner(view: UIViewController, spinner: inout UIView?) {
        view.showLoading(view: view, spinner: &spinner, active: false)
    }
    
    func showLoading(view: UIViewController, spinner: inout UIView?, active: Bool) {
        
        if active {
            let windowCount = UIApplication.shared.windows.count
            spinner = view.displaySpinner(onView: UIApplication.shared.windows[windowCount-1])
        } else {
            if spinner != nil {
                view.removeSpinner(spinner: spinner!)
            }
        }
    }
    
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.frame)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
