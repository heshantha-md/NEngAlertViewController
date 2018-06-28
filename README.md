# NEngAlertViewController

NEngAlertViewController is a custom class that written to  draw / design an awesome Alert View Controller with simple and easy approach. Developer can implement Alert View Controller with simple few steps and customize it with plenty of attributes such as logo, border color, background color, font color etc. Class is based on Swift language and require UIKit framework for function the functionalities of the class.

<br />
<p align="center">
  <img src="https://github.com/NadeeshanEngineering/NEngAlertViewController/blob/master/NEngAlertViewController_banner.jpg">
</p>
<br />

To use NEngAlertViewController in your project, please follow following steps

1. Add (or Drag and drop to Your project in Xcode) NEngAlertViewController.swift files to your project 

2. Add NEngAlertViewControllerDelegate to your ViewController class
       Ex:
       
          class ViewController: UIViewController, NEngAlertViewControllerDelegate

3. Declare and initialize an NEngAlertViewController instance with "title", "message", "cancelButtonTitle", "doneButtonTitle"

	Ex:
      
          let alertviewcontroller = NEngAlertViewController(title: "NEngAlertView", message: "This is an awesome alert view that you can customize as you want", cancelButtonTitle: "Cancel", doneButtonTitle: "Continue")

4. Assign NEngAlertViewControllerDelegate to instance

          alertviewcontroller.delegate = self

5. Add NEngAlertViewControllerDelegate functions into your ViewController calss so you can catch button events of NEngAlertViewController

          func doneButtonDidTap(sender: UIButton, tag: NSInteger) {
          
                print("\(tag) Done button did tap")
                
          }

          func cancelButtonDidTap(sender: UIButton, tag: NSInteger) {
          
                print("\(tag) Cancel button did tap")
                
          }
        

Use following atributes to customize your awesome Alert View Controller

NEngAlertViewController - "logo(image: UIImage)" attribute can use developer to change image on logo in alert view controller

    // func - logo(image: UIImage)
    // Ex:
            alertviewcontroller.logo(image: UIImage(named: "ic-logo"))


NEngAlertViewController - "logo(backgroundColor: UIColor)" attribute can use developer to change color of logo in alert view controller

    // func - logo(backgroundColor: UIColor)
    // Ex:
            alertviewcontroller.logo(backgroundColor: .red)


NEngAlertViewController - "logo(borderColor: UIColor)" attribute can use developer to change borderColor of logo in alert view controller

    // func - logo(borderColor: UIColor)
    // Ex:
            alertviewcontroller.logo(borderColor: .red)
            

NEngAlertViewController - "logo(contentMode: UIViewContentMode)" attribute can use developer to change image content mode of logo in alert view controller

    // func - logo(contentMode: UIViewContentMode)
    // Ex:
            alertviewcontroller.logo(contentMode: .center)
    

NEngAlertViewController - "buttonBorder(color: UIColor)" attribute can use developer to change border color line in between body and button view in alert view controller

    // func - buttonBorder(color: UIColor)
    // Ex:
            alertviewcontroller.buttonBorder(color: .red)


NEngAlertViewController - "buttonSeparator(color: UIColor)" attribute can use developer to change separator color line in between two buttons in alert view controller

    // func - buttonSeparator(color: UIColor)
    // Ex:
            alertviewcontroller.buttonSeparator(color: .red)
    

NEngAlertViewController - "cancelButton(backgroundColor: UIColor)" attribute can use developer to change cancel button background color in alert view controller

    // func - cancelButton(backgroundColor: UIColor)
    // Ex:
            alertviewcontroller.cancelButton(backgroundColor: .red)
    

NEngAlertViewController - "cancelButton(font: UIFont)" attribute can use developer to change cancel button font style in alert view controller

    // func - cancelButton(font: UIFont)
    // Ex:
            alertviewcontroller.cancelButton(font: UIFont (name: "HelveticaNeue", size: 20)!)
    

NEngAlertViewController - "cancelButton(foregroundColor: UIColor)" attribute can use developer to change cancel button text color in alert view controller

    // func - cancelButton(foregroundColor: UIColor)
    // Ex:
            alertviewcontroller.cancelButton(foregroundColor: .red)
	    

NEngAlertViewController - "doneButton(backgroundColor: UIColor)" attribute can use developer to change done button background color in alert view controller

    // func - doneButton(backgroundColor: UIColor)
    // Ex:
            alertviewcontroller.doneButton(backgroundColor: .red)


NEngAlertViewController - "cancelButton(font: UIFont)" attribute can use developer to change done button font styel in alert view controller

    // func - doneButton(font: UIFont)
    // Ex:
            alertviewcontroller.doneButton(font: UIFont (name: "HelveticaNeue", size: 20)!)


NEngAlertViewController - "doneButton(foregroundColor: UIColor)" attribute can use developer to change done button text color in alert view controller

    // func - doneButton(foregroundColor: UIColor)
    // Ex:
            alertviewcontroller.doneButton(foregroundColor: .red)


NEngAlertViewController - "title(font: UIFont)" attribute can use developer to change title label font style in alert view controller

    // func - title(font: UIFont)
    // Ex:
            alertviewcontroller.title(font: UIFont (name: "HelveticaNeue", size: 20)!)
            

NEngAlertViewController - "title(color: UIColor)" attribute can use developer to change title label text color in alert view controller

    // func - title(color: UIColor)
    // Ex:
            alertviewcontroller.title(color: .red)


NEngAlertViewController - "message(textAlignment: NSTextAlignment)" attribute can use developer to change message label text alignment in alert view controller

    // func - message(textAlignment: NSTextAlignment)
    // Ex:
            alertviewcontroller.message(textAlignment: .center)
            

NEngAlertViewController - "message(textAlignment: NSTextAlignment)" attribute can use developer to change message label text alignment in alert view controller

    // func - message(textAlignment: NSTextAlignment)
    // Ex:
            alertviewcontroller.message(textAlignment: .center)


NEngAlertViewController - "message(numberOfLines: NSInteger)" attribute can use developer to change number of text lines in message label at alert view controller

    // func - message(numberOfLines: NSInteger)
    // Ex:
            alertviewcontroller.message(numberOfLines: 3)


NEngAlertViewController - "message(color: UIColor)" attribute can use developer to change title message text color in alert view controller

    // func - message(color: UIColor)
    // Ex:
            alertviewcontroller.message(color: .red)


NEngAlertViewController - "background(color: UIColor)" attribute can use developer to change body background color in alert view controller

    // func - background(color: UIColor)
    // Ex:
            alertviewcontroller.background(color: .red)


NEngAlertViewController - "background(effect: UIBlurEffectStyle)" attribute can use developer to change background blur effect style in alert view controller

    // func - background(effect: UIBlurEffectStyle)
    // Ex:
            alertviewcontroller.background(effect: .dark)


NEngAlertViewController - "backgroundTap(enable: Bool)" attribute can use developer to define whether alert view controller dismiss on background tap or not, by default background tap is enabled

    // func - backgroundTap(enable: Bool)
    // Ex:
            alertviewcontroller.backgroundTap(enable: false)
            

NEngAlertViewController - "tag(id: NSInteger)" attribute can use developer to define tag to the alert view controller instance, So the alert view controller instance uniquely can identify the alert controller inside delegate methods

    // func - tag(id: NSInteger)
    // Ex:
            alertviewcontroller.tag(id: 10001)


Created by Nadeeshan Jayawardana (NEngineering).
