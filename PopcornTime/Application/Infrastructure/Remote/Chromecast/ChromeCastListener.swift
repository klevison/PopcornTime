//
//  File.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/15/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation

enum DeviceManagerConnectionState: Int {
    
    case Unknown = -1
    case Found
    case Connected
    case NotFound
    
}

protocol ChromeCastHandlerDelegate {
    
    func devicesOnlineDidChange(devices: [GCKDevice])
    func deviceManagerDidConnect(deviceManager: GCKDeviceManager!)
    func deviceManagerDidDisconnect()
    func deviceManagerDidFailToConnect(error: NSError?)
    
}

final class ChromeCastListener: NSObject, GCKDeviceScannerListener, GCKDeviceManagerDelegate, GCKMediaControlChannelDelegate {
    
    private var deviceScanner: GCKDeviceScanner?
    private var deviceManager: GCKDeviceManager?
    var delegate: ChromeCastHandlerDelegate?
//    private var mediaInformation: GCKMediaInformation?
    private let kReceiverAppID = "794B7BBF"
    private lazy var textChannel: TextChannel = {
        return TextChannel(namespace: "urn:x-cast:com.google.cast.sample.helloworld")
    }()
    static let sharedInstance = ChromeCastListener()
    
    func displayString(string: String) {
        textChannel.sendTextMessage(string)
    }
    
    func getConnectedDeviceTitle() -> String? {
        if let device = deviceManager?.device {
            return device.friendlyName
        }
        
        return nil
    }
    
    func isDeviceOnline() -> Bool {
        return deviceManager != nil && deviceManager?.connectionState == GCKConnectionState.Connected
    }
    
    func getDevicesOnline() -> [GCKDevice] {
        var devices = [GCKDevice]()
        
        if let deviceScanner = deviceScanner {
            for device in deviceScanner.devices  {
                devices.append(device as! GCKDevice)
            }
        }
        
        return devices
    }
    
    func startScan() {
        let filterCriteria = GCKFilterCriteria(forAvailableApplicationWithID: kReceiverAppID)
        deviceScanner = GCKDeviceScanner(filterCriteria: filterCriteria)
        if let deviceScanner = deviceScanner {
            deviceScanner.addListener(self)
            deviceScanner.startScan()
        }
    }
    
    func connectToDeviceAtIndex(index: Int) {
        if let selectedDevice = deviceScanner?.devices[index] as? GCKDevice {
            let identifier = NSBundle.mainBundle().infoDictionary?["CFBundleIdentifier"] as! String
            deviceManager = GCKDeviceManager(device: selectedDevice, clientPackageName: identifier)
            deviceManager!.delegate = self
            deviceManager!.connect()
        }
    }
    
    func disconnectDevice() {
        deviceManager!.leaveApplication()
        deviceManager!.disconnect()
        deviceDisconnected()
        delegate?.deviceManagerDidDisconnect()
    }
    
    private func deviceDisconnected() {
        deviceManager = nil
    }
    
    // MARK: GCKDeviceScannerListener
    func deviceDidComeOnline(device: GCKDevice!) {
        delegate?.devicesOnlineDidChange(deviceScanner?.devices as! [GCKDevice])
        print("Device found: \(device.friendlyName)")
    }
    
    func deviceDidGoOffline(device: GCKDevice!) {
        delegate?.devicesOnlineDidChange(deviceScanner?.devices as! [GCKDevice])
        print("Device went away: \(device.friendlyName)")
    }
    
    // MARK: GCKDeviceManagerDelegate
    func deviceManagerDidConnect(deviceManager: GCKDeviceManager!) {
        print("Connected.")
        delegate?.deviceManagerDidConnect(deviceManager)
        deviceManager.launchApplication(kReceiverAppID)
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didConnectToCastApplication applicationMetadata: GCKApplicationMetadata!, sessionID: String!, launchedApplication: Bool) {
        print("Application has launched.");
        deviceManager.addChannel(textChannel)
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didFailToConnectToApplicationWithError error: NSError!) {
        print("Received notification that device failed to connect to application.");
        delegate?.deviceManagerDidFailToConnect(error)
        deviceDisconnected()
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didFailToConnectWithError error: NSError!) {
        print("Received notification that device failed to connect.");
        delegate?.deviceManagerDidFailToConnect(error)
        deviceDisconnected()
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didDisconnectWithError error: NSError!) {
        print("Received notification that device disconnected.")
        delegate?.deviceManagerDidFailToConnect(error)
        deviceDisconnected()
    }
    
    
}