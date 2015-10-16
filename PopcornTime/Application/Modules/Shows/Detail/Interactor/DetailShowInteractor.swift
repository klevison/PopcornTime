//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class DetailShowInteractor: DetailShowInteractorCommandProtocol {
    
    weak var presenter: DetailShowInteractorQuerytProtocol?
    var APIDataManager: DetailShowAPIDataManagerInputProtocol?
    var localDatamanager: DetailShowLocalDataManagerInputProtocol?
    private let chromeCastListener = ChromeCastListener.sharedInstance
    
    init() {}
    
    func startCastScan() {
        chromeCastListener.startScan()
        chromeCastListener.delegate = self
    }
    
    func getCurrentDivecesState() {
        presenter?.devicesToPresent(chromeCastListener.getConnectedDeviceTitle(), devicesOnline: chromeCastListener.getDevicesOnline())
    }
    
    func connectDeviceAtIndex(index: Int) {
        chromeCastListener.connectToDeviceAtIndex(index)
    }
    
    func disconnectDevice() {
        chromeCastListener.disconnectDevice()
    }
    
    func openImageUrlString(urlString: String) {
        let imgTag = "<img src=\"\(urlString)\">"
        chromeCastListener.displayString(imgTag)
    }
    
}

extension DetailShowInteractor: ChromeCastHandlerDelegate {
    
    func devicesOnlineDidChange(devices: [GCKDevice]) {
        var connectionState = DeviceManagerConnectionState.Unknown
        
        if devices.count > 0 {
            if chromeCastListener.isDeviceOnline() {
                connectionState = .Connected
            } else {
                connectionState = .Found
            }
        } else {
            connectionState = .NotFound
        }

        presenter?.devicesOnlineDidChange(connectionState)
    }
    
    func deviceManagerDidDisconnect() {
        
    }
    
    func deviceManagerDidConnect(deviceManager: GCKDeviceManager!) {
        presenter?.devicesOnlineDidChange(.Connected)
    }
    
    func deviceManagerDidFailToConnect(error: NSError?) {
    
    }
    
}