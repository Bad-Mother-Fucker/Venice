//
//  VNScreenObserverProtocol.swift
//  Venice
//
//  Created by Michele De Sena on 29/03/2019.
//  Copyright © 2019 Michele De Sena. All rights reserved.
//


@objc public protocol VNScreenObserverDelegate: NSObjectProtocol {
    @available (iOS 11.0, *)
    @objc optional func userDidStartRecordingScreen()

    @available (iOS 11.0, *)
    @objc optional func userDidFinishRecordingScreen()

    @objc optional func userDidStartMirroringScreen()
    @objc optional func userDidFinishMirroringScreen()
}
