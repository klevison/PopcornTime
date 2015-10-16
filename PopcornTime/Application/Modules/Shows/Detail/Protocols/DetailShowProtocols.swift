//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

protocol DetailShowViewProtocol: class {
    
    var presenter: DetailShowPresenterProtocol? { get set }
    
    func deviceFound()
    func deviceNotFound()
    func deviceConnected()
    func presentAlertView(titleString: String, devicesNameCollection: [String], destructiveButtonTitleString: String?)
    func showError(error: NSError?)
    
}


protocol DetailShowPresenterProtocol: class {
    
    var view: DetailShowViewProtocol? { get set }
    var interactor: DetailShowInteractorCommandProtocol? { get set }
    
    func startCastScan()
    func showChooseDeviceAlert()
    func connectDeviceAtIndex(index: Int)
    func disconnectDevice()
    func showImageUrlString(urlString: String)
    
}

protocol DetailShowInteractorQuerytProtocol: class {
    
    func devicesOnlineDidChange(state: DeviceManagerConnectionState)
    func devicesToPresent(connectedDeviceTitle: String?, devicesOnline: [GCKDevice])
    func deviceManagerDidFailToConnect(error: NSError?)
    
}

protocol DetailShowInteractorCommandProtocol: class {
   
    var presenter: DetailShowInteractorQuerytProtocol? { get set }
    var APIDataManager: DetailShowAPIDataManagerInputProtocol? { get set }
    var localDatamanager: DetailShowLocalDataManagerInputProtocol? { get set }
    
    func startCastScan()
    func getCurrentDivecesState()
    func connectDeviceAtIndex(index: Int)
    func disconnectDevice()
    func openImageUrlString(urlString: String)
    
}

protocol DetailShowDataManagerInputProtocol: class {
    
}

protocol DetailShowAPIDataManagerInputProtocol: class {
    
}

protocol DetailShowLocalDataManagerInputProtocol: class {

}
