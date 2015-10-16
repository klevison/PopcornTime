//
//  DetailShowViewController.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/13/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import UIKit
import UIAlertController_Blocks

class DetailShowViewController: UIViewController, DetailShowViewProtocol, UIActionSheetDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    var show: Show?
    var presenter: DetailShowPresenterProtocol?
    var castButton = UIBarButtonItem()
    private lazy var castOffImage: UIImage = {
        return UIImage(named: "cast_off")!
    }()
    private lazy var castOnImage: UIImage = {
        return UIImage(named: "cast_on")!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DetailShowPresenter(view: self)
        presenter!.startCastScan()

        castButton = UIBarButtonItem(image: castOffImage, style: .Plain, target: self, action: "showChooseDeviceAlert")
        navigationItem.rightBarButtonItems = []
        titleLabel.text = show?.title!
    }
    
    @IBAction func playButtonTapped(sender: AnyObject) {
        presenter?.showImageUrlString(show!.images!.fanartUrlString!)
    }
    
    func showChooseDeviceAlert() {
        presenter?.showChooseDeviceAlert()
    }
    
    func presentAlertView(titleString: String, devicesNameCollection: [String], destructiveButtonTitleString: String?) {
        UIAlertController.showActionSheetInViewController(self,
            withTitle: titleString,
            message: nil,
            cancelButtonTitle: "Cancel",
            destructiveButtonTitle: destructiveButtonTitleString,
            otherButtonTitles: devicesNameCollection,
            popoverPresentationControllerBlock: { (UIPopoverPresentationController) -> Void in
                //
            }, tapBlock: { (controller, action, buttonIndex) -> Void in
                if (buttonIndex == controller.destructiveButtonIndex) {
                    self.presenter?.disconnectDevice()
                } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                    self.presenter?.connectDeviceAtIndex(buttonIndex - controller.firstOtherButtonIndex)
                }
        })

    }
    
    func showError(error: NSError?) {
        let alert = UIAlertController(title: "Error", message: error?.description,
            preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func deviceFound() {
        castButton.image = castOffImage
        castButton.tintColor = UIColor.grayColor()
        navigationItem.rightBarButtonItems = [castButton]
    }
    
    func deviceConnected() {
        castButton.image = castOnImage
        castButton.tintColor = UIColor.blueColor()
        navigationItem.rightBarButtonItems = [castButton]
    }
    
    func deviceNotFound() {
        navigationItem.rightBarButtonItems = []
    }

}
