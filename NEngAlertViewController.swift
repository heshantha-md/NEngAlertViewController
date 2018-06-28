//
//  NEngAlertViewController.swift
//  NEngAlertViewController
//
//  Created by Nadeeshan Jayawardana on 6/23/18.
//  Copyright © 2018 NEngineering. All rights reserved.
//

import UIKit

protocol NEngAlertViewControllerDelegate {
    func doneButtonDidTap(sender: UIButton, tag: NSInteger)
    func cancelButtonDidTap(sender: UIButton, tag: NSInteger)
}

class NEngAlertViewController: UIViewController {

    var delegate: NEngAlertViewControllerDelegate?
    private var tag: NSInteger = 00000
    
    private var tTitle: String = String()
    private var tMessage: String = String()
    private var tCancelButtonTitle: String = String()
    private var tDoneButtonTitle: String = String()
    
    private let containerView: UIView = UIView()
    private let bodyView: UIView = UIView()
    private let buttonView: UIView = UIView()
    private let leftButton: UIButton = UIButton()
    private let centerBorder: UIView = UIView()
    private let buttonBorderView: UIView = UIView()
    private let rightButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let bodyLabel: UILabel = UILabel()
    private let logoContainerView: UIView = UIView()
    private let logoImageView: UIImageView = UIImageView()
    
    private var logoImage: UIImage = UIImage()
    private var logoBackgroundColor: UIColor = .white
    private var logoBorderColor: CGColor = UIColor().NELightGray.cgColor
    private var logoContentMode: UIViewContentMode = .center
    private var buttonBorderColor: UIColor = UIColor().NEGold
    private var buttonSeparatorColor: UIColor = .lightGray
    private var cancelButtonBackgroundColor: UIColor = .lightGray
    private var cancelButtonFont: UIFont = UIFont (name: "Helvetica Neue", size: 20)!
    private var cancelButtonForegroundColor: UIColor = .white
    private var doneButtonBackgroundColor: UIColor = .orange
    private var doneButtonFont: UIFont = UIFont (name: "Helvetica Neue", size: 20)!
    private var doneButtonForegroundColor: UIColor = .white
    private var titleFont: UIFont = UIFont (name: "HelveticaNeue", size: 24)!
    private var titleColor: UIColor = .black
    private var messageFont: UIFont = UIFont (name: "HelveticaNeue-light", size: 18)!
    private var messageTextAlignment: NSTextAlignment = .center
    private var messageNumberOfLines: NSInteger = 4
    private var messageColor: UIColor = .black
    private var backgroundBodyColor: UIColor = .white
    private var backgroundEffect: UIBlurEffectStyle = .dark
    private var backgroundTapEnable: Bool = true
    
    init(title: String, message: String, cancelButtonTitle: String, doneButtonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.tTitle = title
        self.tMessage = message
        self.tCancelButtonTitle = cancelButtonTitle
        self.tDoneButtonTitle = doneButtonTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        
        // Adding a blur view for the background
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: self.backgroundEffect))
        blurView.frame = self.view.bounds
        
        // Adding a Tap Guester for blurView view so view can be dismiss
        let backroundTapGuesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(didBackgroundTaped))
        blurView.addGestureRecognizer(backroundTapGuesterRecognizer)
        self.view.addSubview(blurView)
        
        self.configureViewContoller()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureViewContoller() {
        // MARK: - container view | continer of all the sub views of alert view
        self.containerView.backgroundColor = .clear
        self.view.addSubview(self.containerView)
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        let containerViewHorizontalConstraint = NSLayoutConstraint(item: self.containerView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let containerViewVerticalConstraint = NSLayoutConstraint(item: self.containerView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let containerViewWidthConstraint = NSLayoutConstraint(item: self.containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let containerViewHeightConstraint = NSLayoutConstraint(item: self.containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 345)
        self.view.addConstraints([containerViewHorizontalConstraint, containerViewVerticalConstraint, containerViewWidthConstraint, containerViewHeightConstraint])
        
        // MARK: - body view | container of all subviews of alert body
        self.bodyView.backgroundColor = self.backgroundBodyColor
        self.bodyView.layer.cornerRadius = 20
        self.bodyView.layer.masksToBounds = true
        self.containerView.addSubview(self.bodyView)
        
        self.bodyView.translatesAutoresizingMaskIntoConstraints = false
        let bodyViewLeftConstraint = NSLayoutConstraint(item: self.bodyView, attribute: .left, relatedBy: .equal, toItem: self.containerView, attribute: .left, multiplier: 1, constant: 0)
        let bodyViewRightConstraint = NSLayoutConstraint(item: self.bodyView, attribute: .right, relatedBy: .equal, toItem: self.containerView, attribute: .right, multiplier: 1, constant: 0)
        let bodyViewHeightConstraint = NSLayoutConstraint(item: self.bodyView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 272)
        let bodyViewBottomConstraint = NSLayoutConstraint(item: self.bodyView, attribute: .bottom, relatedBy: .equal, toItem: self.containerView, attribute: .bottom, multiplier: 1, constant: 0)
        self.containerView.addConstraints([bodyViewLeftConstraint,bodyViewRightConstraint,bodyViewHeightConstraint,bodyViewBottomConstraint])
        
        // MARK: - button view | container for the button of alert view
        self.buttonView.backgroundColor = .white
        self.buttonView.clipsToBounds = true
        self.bodyView.addSubview(self.buttonView)
        
        self.buttonView.translatesAutoresizingMaskIntoConstraints = false
        let buttonViewHeightConstraint = NSLayoutConstraint(item: self.buttonView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let buttonViewBottomConstraint = NSLayoutConstraint(item: self.buttonView, attribute: .bottom, relatedBy: .equal, toItem: bodyView, attribute: .bottom, multiplier: 1, constant: 0)
        let buttonViewLeftConstraint = NSLayoutConstraint(item: self.buttonView, attribute: .left, relatedBy: .equal, toItem: bodyView, attribute: .left, multiplier: 1, constant: 0)
        let buttonViewRightConstraint = NSLayoutConstraint(item: self.buttonView, attribute: .right, relatedBy: .equal, toItem: bodyView, attribute: .right, multiplier: 1, constant: 0)
        self.bodyView.addConstraints([buttonViewHeightConstraint, buttonViewLeftConstraint, buttonViewRightConstraint, buttonViewBottomConstraint])
        
        // MARK: - button set
        self.configureButtonSetForAlertViewController()
        
        // MARK: - button border view | visual border to separate alert text layers from the buttons
        self.buttonBorderView.backgroundColor = self.buttonBorderColor
        self.bodyView.addSubview(self.buttonBorderView)
        
        self.buttonBorderView.translatesAutoresizingMaskIntoConstraints = false
        let buttonBorderViewHeightConstraint = NSLayoutConstraint(item: self.buttonBorderView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        let buttonBorderViewleftConstraint = NSLayoutConstraint(item: self.buttonBorderView, attribute: .left, relatedBy: .equal, toItem: self.bodyView, attribute: .left, multiplier: 1, constant: 0)
        let buttonBorderRightConstraint = NSLayoutConstraint(item: self.buttonBorderView, attribute: .right, relatedBy: .equal, toItem: self.bodyView, attribute: .right, multiplier: 1, constant: 0)
        let buttonBorderBottomConstraint = NSLayoutConstraint(item: self.buttonBorderView, attribute: .bottom, relatedBy: .equal, toItem: self.buttonView, attribute: .top, multiplier: 1, constant: 0)
        self.bodyView.addConstraints([buttonBorderViewHeightConstraint, buttonBorderViewleftConstraint, buttonBorderRightConstraint, buttonBorderBottomConstraint])
        
        // MARK: - Alert view text title
        self.titleLabel.text = self.tTitle
        self.titleLabel.textColor = self.titleColor
        self.titleLabel.numberOfLines = 2
        self.titleLabel.font = self.titleFont
        self.titleLabel.textAlignment = .center
        self.bodyView.addSubview(self.titleLabel)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let titleLabelTopConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.bodyView, attribute: .top, multiplier: 1, constant: 50)
        let titleLabelHightConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let titleLabelWidthConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260)
        let titleLabelHorizontalConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self.bodyView, attribute: .centerX, multiplier: 1, constant: 0)
        self.bodyView.addConstraints([titleLabelTopConstraint, titleLabelWidthConstraint, titleLabelHorizontalConstraint, titleLabelHightConstraint])
        
        // MARK: - Alert view text Message
        self.bodyLabel.text = self.tMessage
        self.bodyLabel.textColor = self.messageColor
        self.bodyLabel.numberOfLines = self.messageNumberOfLines
        self.bodyLabel.font = self.messageFont
        self.bodyLabel.textAlignment = self.messageTextAlignment
        self.bodyView.addSubview(self.bodyLabel)
        
        self.bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        let bodyLabelTopConstraint = NSLayoutConstraint(item: self.bodyLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 5)
        let bodyLabelWidthConstraint = NSLayoutConstraint(item: self.bodyLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260)
        let bodyLabelHorizontalConstraint = NSLayoutConstraint(item: self.bodyLabel, attribute: .centerX, relatedBy: .equal, toItem: self.bodyView, attribute: .centerX, multiplier: 1, constant: 0)
        self.bodyView.addConstraints([bodyLabelTopConstraint, bodyLabelWidthConstraint, bodyLabelHorizontalConstraint])
        
        // MARK: - Alert view logo container
        self.logoContainerView.backgroundColor = self.logoBackgroundColor
        self.logoContainerView.layer.cornerRadius = 60
        self.logoContainerView.layer.borderWidth = 5
        self.logoContainerView.layer.borderColor = self.logoBorderColor
        self.logoContainerView.layer.masksToBounds = true
        self.containerView.addSubview(self.logoContainerView)
        
        self.logoContainerView.translatesAutoresizingMaskIntoConstraints = false
        let logoContainerViewHeightConstraint = NSLayoutConstraint(item: self.logoContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let logoContainerViewWidthConstraint = NSLayoutConstraint(item: self.logoContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let logoContainerViewTopConstraint = NSLayoutConstraint(item: self.logoContainerView, attribute: .top, relatedBy: .equal, toItem: self.containerView, attribute: .top, multiplier: 1, constant: 0)
        let logoContainerViewHorizontalConstraint = NSLayoutConstraint(item: self.logoContainerView, attribute: .centerX, relatedBy: .equal, toItem: self.containerView, attribute: .centerX, multiplier: 1, constant: 0)
        self.containerView.addConstraints([logoContainerViewHeightConstraint,logoContainerViewWidthConstraint,logoContainerViewTopConstraint,logoContainerViewHorizontalConstraint])
        
        self.logoImageView.image = self.logoImage
        self.logoImageView.contentMode = self.logoContentMode
        self.logoContainerView.addSubview(self.logoImageView)
        
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let logoImageViewHeightConstraint = NSLayoutConstraint(item: self.logoImageView, attribute: .height, relatedBy: .equal, toItem: self.logoContainerView, attribute: .height, multiplier: 1, constant: 0)
        let logoImageViewWidthConstraint = NSLayoutConstraint(item: self.logoImageView, attribute: .width, relatedBy: .equal, toItem: self.logoContainerView, attribute: .width, multiplier: 1, constant: 0)
        let logoImageViewHorizontalConstraint = NSLayoutConstraint(item: self.logoImageView, attribute: .centerX, relatedBy: .equal, toItem: self.logoContainerView, attribute: .centerX, multiplier: 1, constant: 0)
        let logoImageViewVerticalConstraint = NSLayoutConstraint(item: self.logoImageView, attribute: .centerY, relatedBy: .equal, toItem: self.logoContainerView, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.logoContainerView.addConstraints([logoImageViewHeightConstraint, logoImageViewWidthConstraint, logoImageViewHorizontalConstraint, logoImageViewVerticalConstraint])
    }
    
    private func configureButtonSetForAlertViewController() {
        
        self.rightButton.backgroundColor = self.doneButtonBackgroundColor
        self.rightButton.setTitle(self.tDoneButtonTitle, for: .normal)
        self.rightButton.setTitleColor(self.doneButtonForegroundColor, for: .normal)
        self.rightButton.titleLabel?.font = self.doneButtonFont
        self.rightButton.addTarget(self, action: #selector(doneButtonDidTap), for: .touchUpInside)
        self.buttonView.addSubview(self.rightButton)
        
        self.rightButton.translatesAutoresizingMaskIntoConstraints = false
        let rightButtonTopConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .top, relatedBy: .equal, toItem: self.buttonView, attribute: .top, multiplier: 1, constant: 0)
        let rightButtonBottomConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .bottom, relatedBy: .equal, toItem: self.buttonView, attribute: .bottom, multiplier: 1, constant: 0)
        let rightButtonRightConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .right, relatedBy: .equal, toItem: self.buttonView, attribute: .right, multiplier: 1, constant: 0)
        var rightButtonWidthConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .width, relatedBy: .equal, toItem: self.leftButton, attribute: .width, multiplier: 1, constant: 0)
        var rightButtonLeftConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .left, relatedBy: .equal, toItem: self.centerBorder, attribute: .right, multiplier: 1, constant: 0)
        
        
        if (self.tCancelButtonTitle.count > 0) {
            self.leftButton.backgroundColor = self.cancelButtonBackgroundColor
            self.leftButton.setTitle(self.tCancelButtonTitle, for: .normal)
            self.leftButton.setTitleColor(self.cancelButtonForegroundColor, for: .normal)
            self.leftButton.titleLabel?.font = self.cancelButtonFont
            self.leftButton.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
            self.buttonView.addSubview(self.leftButton)
            
            self.centerBorder.backgroundColor = self.buttonSeparatorColor
            self.buttonView.addSubview(self.centerBorder)
            
            self.leftButton.translatesAutoresizingMaskIntoConstraints = false
            let leftButtonTopConstraint = NSLayoutConstraint(item: self.leftButton, attribute: .top, relatedBy: .equal, toItem: self.buttonView, attribute: .top, multiplier: 1, constant: 0)
            let leftButtonBottomConstraint = NSLayoutConstraint(item: self.leftButton, attribute: .bottom, relatedBy: .equal, toItem: self.buttonView, attribute: .bottom, multiplier: 1, constant: 0)
            let leftButtonLeftConstraint = NSLayoutConstraint(item: self.leftButton, attribute: .left, relatedBy: .equal, toItem: self.buttonView, attribute: .left, multiplier: 1, constant: 0)
            let leftButtonRightConstraint = NSLayoutConstraint(item: self.leftButton, attribute: .right, relatedBy: .equal, toItem: self.centerBorder, attribute: .left, multiplier: 1, constant: 0)
            let leftButtonWidthConstraint = NSLayoutConstraint(item: self.leftButton, attribute: .width, relatedBy: .equal, toItem: self.rightButton, attribute: .width, multiplier: 1, constant: 0)
            
            self.centerBorder.translatesAutoresizingMaskIntoConstraints = false
            let centerBorderTopConstraint = NSLayoutConstraint(item: self.centerBorder, attribute: .top, relatedBy: .equal, toItem: self.buttonView, attribute: .top, multiplier: 1, constant: 0)
            let centerBorderBottomConstraint = NSLayoutConstraint(item: self.centerBorder, attribute: .bottom, relatedBy: .equal, toItem: self.buttonView, attribute: .bottom, multiplier: 1, constant: 0)
            let centerBorderWidthConstraint = NSLayoutConstraint(item: self.centerBorder, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
            
            rightButtonWidthConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .width, relatedBy: .equal, toItem: self.leftButton, attribute: .width, multiplier: 1, constant: 0)
            rightButtonLeftConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .left, relatedBy: .equal, toItem: self.centerBorder, attribute: .right, multiplier: 1, constant: 0)
            
            self.buttonView.addConstraints([leftButtonTopConstraint, leftButtonBottomConstraint, leftButtonLeftConstraint, leftButtonRightConstraint, centerBorderTopConstraint, centerBorderBottomConstraint, centerBorderWidthConstraint, leftButtonWidthConstraint])
        } else {
            rightButtonWidthConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .width, relatedBy: .equal, toItem: self.buttonView, attribute: .width, multiplier: 1, constant: 0)
            rightButtonLeftConstraint = NSLayoutConstraint(item: self.rightButton, attribute: .left, relatedBy: .equal, toItem: self.buttonView, attribute: .right, multiplier: 1, constant: 0)
        }
        
        self.buttonView.addConstraints([rightButtonTopConstraint,  rightButtonBottomConstraint, rightButtonRightConstraint,  rightButtonLeftConstraint, rightButtonWidthConstraint])
    }
    
    @objc func didBackgroundTaped() {
        if backgroundTapEnable {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    // Customizing the logo of alert view
    func logo(image: UIImage) {
        self.logoImage = image
    }
    
    func logo(backgroundColor: UIColor) {
        self.logoBackgroundColor = backgroundColor
    }
    
    func logo(borderColor: UIColor) {
        self.logoBorderColor = borderColor.cgColor
    }
    
    func logo(contentMode: UIViewContentMode) {
        self.logoContentMode = contentMode
    }
    
    // Customizing the buttons of alert view
    func buttonBorder(color: UIColor) {
        self.buttonBorderColor = color
    }
    
    func buttonSeparator(color: UIColor) {
        self.buttonSeparatorColor = color
    }
    
    // Customizing the cancel buttons
    func cancelButton(backgroundColor: UIColor) {
        self.cancelButtonBackgroundColor = backgroundColor
    }
    
    func cancelButton(font: UIFont) {
        self.cancelButtonFont = font
    }
    
    func cancelButton(foregroundColor: UIColor) {
        self.cancelButtonForegroundColor = foregroundColor
    }
    
    // Customizing the done buttons
    func doneButton(backgroundColor: UIColor) {
        self.doneButtonBackgroundColor = backgroundColor
    }
    
    func doneButton(font: UIFont) {
        self.doneButtonFont = font
    }
    
    func doneButton(foregroundColor: UIColor) {
        self.doneButtonForegroundColor = foregroundColor
    }
    
    // Customizing the alert text
    func title(font: UIFont) {
        self.titleFont = font
    }
    
    func title(color: UIColor) {
        self.titleColor = color
    }
    
    func message(font: UIFont) {
        self.messageFont = font
    }
    
    func message(textAlignment: NSTextAlignment) {
        self.messageTextAlignment = textAlignment
    }
    
    func message(numberOfLines: NSInteger) {
        self.messageNumberOfLines = numberOfLines
    }
    
    func message(color: UIColor) {
        self.messageColor = color
    }
    
    // Customizing the background
    func background(color: UIColor) {
        self.backgroundBodyColor = color
    }
    
    func background(effect: UIBlurEffectStyle) {
        self.backgroundEffect = effect
    }
    
    func backgroundTap(enable: Bool) {
        self.backgroundTapEnable = enable
    }
    
    func tag(id: NSInteger) {
        self.tag = id
    }
    
    // MARK: Delegate functions
    
    @objc func doneButtonDidTap(sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        self.delegate?.doneButtonDidTap(sender: sender, tag: self.tag)
    }
    
    @objc func cancelButtonDidTap(sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        self.delegate?.cancelButtonDidTap(sender: sender, tag: self.tag)
    }
}

extension UIColor {
    var NEGold: UIColor {
        return UIColor(red:0.97, green:0.83, blue:0.16, alpha:1.0)
    }
    
    var NELightGray: UIColor {
        return UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0)
    }
}
