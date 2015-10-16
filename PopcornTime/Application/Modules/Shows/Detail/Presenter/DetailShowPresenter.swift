//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class DetailShowPresenter: DetailShowPresenterProtocol, DetailShowInteractorQuerytProtocol {
    
    weak var view: DetailShowViewProtocol?
    var interactor: DetailShowInteractorCommandProtocol?
    
    init(view: DetailShowViewProtocol) {
        self.view = view
        interactor = DetailShowInteractor()
        interactor?.presenter = self
    }
    
    func startCastScan() {
        interactor?.startCastScan()
    }
    
    func devicesOnlineDidChange(state: DeviceManagerConnectionState) {
        if state == .Found {
            view?.deviceFound()
        } else if state == .Connected {
            view?.deviceConnected()
        } else {
            view?.deviceNotFound()
        }
    }
    
    func showChooseDeviceAlert() {
        interactor?.getCurrentDivecesState()
    }
    
    func devicesToPresent(connectedDeviceTitle: String?, devicesOnline: [GCKDevice]) {
        
        var devicesNameCollection = [String]()
        
        for device in devicesOnline {
            devicesNameCollection.append(device.friendlyName)
        }
        
        var titleString = ""
        
        var destructiveButtonTitleString: String?
        
        if connectedDeviceTitle != nil {
            titleString = "Casting to \(connectedDeviceTitle!)"
            destructiveButtonTitleString = "Disconnect"
        } else {
            titleString = "Connect to Device"
        }
        
        view?.presentAlertView(titleString, devicesNameCollection: devicesNameCollection, destructiveButtonTitleString: destructiveButtonTitleString)
    }
    
    func connectDeviceAtIndex(index: Int) {
        interactor?.connectDeviceAtIndex(index)
    }
    
    func disconnectDevice() {
        interactor?.disconnectDevice()
    }
    
    func deviceManagerDidFailToConnect(error: NSError?) {
        view?.showError(error)
    }
    
    func showImageUrlString(urlString: String) {
        interactor?.openImageUrlString(urlString)
    }
    
}