# KeyboardScrollView
Drag and Drop Scroll View that can handle textfields and dismiss keyboard


## Install
1. Import KeyboardScrollView.swift into your project
2. Add ScrollView to storyboard and set the class to KeyboardScrollView
3. Set ScrollView constraints: `Leading`, `Trailing`, `Top`, `Bottom` to `0`. Set Center X and Ceter Y.
4. Add reference outlet to your ViewController (named `scrollView` in this example)
5. Add `UITextFieldDelegate` to your ViewController
6. Set delegate for each text field that you are using 
7. Add the following code to your ViewController which provides the scrollView with the ability to adjust focus.

```swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
	if textField == emailTextField {
		textField.resignFirstResponder()
		self.scrollView.setContentOffset(CGPoint.zero, animated: true)
		return false
	}
	
	return true
}
```
