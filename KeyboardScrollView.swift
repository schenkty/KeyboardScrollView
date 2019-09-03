//
//  KeyboardScrollView.swift
//  Ty Schenk
//
//  Created by Ty Schenk on 6/2/19.
//  Copyright © 2019 Ty Schenk. All rights reserved.
//

import UIKit

class KeyboardScrollView: UIScrollView, UIScrollViewDelegate {
	
	override func layoutSubviews() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		self.addGestureRecognizer(tap)
	}
	
	// Get a touched view which is contained by Scroll view.
	open override func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool {
		if view.isKind(of: UITextField.self) {
			let textField:UITextField = view as! UITextField
			self.isScrollEnabled = true
			var rect = textField.bounds
			rect = textField.convert(rect, to: self)
			var points: CGPoint = rect.origin
			points.x = 0
			points.y -= self.frame.size.height/2 - 80
			self.setContentOffset(points, animated: true)
		}
		return true
	}
	
	@objc func dismissKeyboard() {
		self.endEditing(true)
		self.setContentOffset(CGPoint.zero, animated: true)
	}
}
